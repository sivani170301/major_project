import 'package:flutter/material.dart';
import 'package:minor_project/model.dart';
import 'package:minor_project/user_data.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CQuiz extends StatefulWidget {
  const CQuiz({ Key key }) : super(key: key);

  @override
  _CQuizState createState() => _CQuizState();
}

class _CQuizState extends State<CQuiz> {

  int hi_score=0;
  _CQuizState(){
    MySharedPreferences.instance
        .getIntegerValue("c_hs")
        .then((value) => setState(() {
          print(value);
              hi_score=value;
            }));
  }
  Future init(int score) async {

    final prefs = await SharedPreferences.getInstance();

    prefs.setInt('c_hs',score);

  }

  int _counter = 0;

  List ques = [
    Questions("1.Who invented C Language?", 2),
    Questions("2.C Language is a successor to which language?", 3),
    Questions("3.C is a which level language?", 1),
    Questions("4.C is _______ type of programming language?",1 ),
    Questions("5.C language was invented in which laboratories?", 2),
    Questions("6.C language was invented to develop which Operating System?", 3),
    Questions("7.C language was invented in the year?", 2),
    Questions("8.A C program is a combination of?", 3),
    Questions("9.Find a Floating Point constant.", 3),
    Questions("10.Number of Keywords present in C Language are?", 0),

  ];

  List options = [
    ["Charles Babbage", "Grahambel", "Dennis Ritchie", "Steve Jobs"],
    ["FORTRAN", "D Language", "BASIC", "B Language"],
    ["Low Level", "High Level", "Low + High", "None"],
    ["Object Oriented", "Procedural", "Bit level language", "Functional"],
    ["Uniliver Labs", "IBM Labs", "AT&T Bell Labs", "Verizon Labs"],
    ["Android", "Linux", "Ubuntu", "Unix"],
    ["1999", "1978", "1972", "1990"],
    ["Statements", "Functions", "Variables", "All of the above"],
    ["12.3E5", "12e34", "125.34857", "All the above."],
    ["32", "34", "62", "64"],
    
    ];

  
  // A=0, B=1, C=2, D=3 (Options)

  var score=0;

   checkWin(int userChoice , BuildContext context )
{
  

    if(userChoice==ques[_counter].crct_opt)
 {  
     score= score+1;
    final snackBar = SnackBar(
      duration: Duration(milliseconds : 400),
      backgroundColor: Colors.green,
      content: Text("Correct!"),);
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
 }
 else 
 {
        score = score+0;
    final snackBar = SnackBar(
      duration: Duration(milliseconds : 400),
      backgroundColor: Colors.red,
      content: Text("Incorrect!"),
      );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
 }

}

  void _incrementCounter() {
    if(_counter<9){
    setState(() {
      _counter = _counter + 1;
    });
    }
    
    else if(_counter==9){
      if(score>hi_score){
        init(score);
      }
      
      Navigator.pop(context);
      showDialog(context: context, 
                builder: 
                (BuildContext context) => AlertDialog(
          title: const Text('Hurray!! Quiz Completed'),
          content: Text('Your Score: $score/10'),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Ok', style: TextStyle(color: Colors.green),),
            ),
          ],
                ),
                );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text("Quiz"),
        backgroundColor: Colors.green[900],
      ),

      body: Container(
        child: Column(children: [
          Padding(padding: EdgeInsets.only(top:20)),

          Container(

              height: 200,
              width: 500,
             
              decoration: BoxDecoration(
              
                image: DecorationImage(image: AssetImage("assets/cQuiz.jpeg"),
                fit: BoxFit.fill,
                )
              ),
             
        ),
          
        Padding(padding: EdgeInsets.only(top:20)),

         Container(
                    decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.0),
                
                    border: Border.all(color: Colors.green)
                  ),
                  height: 90.0,
                  width: 400,
                   padding: EdgeInsets.all(20),
                     child: Column(
                    
                    
                       mainAxisAlignment: MainAxisAlignment.center,
                       children: <Widget>[
                         
                         Center(child: Text(ques[_counter].q)),
                         

                       ],
                     ),             
                     
               ),

                Padding(padding: EdgeInsets.only(top:15)),

               Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,   children: [
                 ElevatedButton(onPressed: (){
                   checkWin(0, context);
                   _incrementCounter();

                 }, child: Text(options[_counter][0])),

                 ElevatedButton(onPressed: (){
                   checkWin(1, context);
                   _incrementCounter();

                 }, child: Text(options[_counter][1])),

               ],),

                Padding(padding: EdgeInsets.only(top:7)),

               Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,children: [
                 ElevatedButton(onPressed: (){
                   checkWin(2, context);
                   _incrementCounter();

                 }, child: Text(options[_counter][2])),

                 ElevatedButton(onPressed: (){
                   checkWin(3, context);
                   _incrementCounter();

                 }, child: Text(options[_counter][3])),

               ],), 
    
        ],
        ),
      ),
      
    );
  }
}