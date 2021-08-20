

import 'package:flutter/material.dart';
import 'package:minor_project/model.dart';

class PythonQuiz extends StatefulWidget {
  const PythonQuiz({ Key? key }) : super(key: key);

  @override
  _PythonQuizState createState() => _PythonQuizState();
}

class _PythonQuizState extends State<PythonQuiz> {

  int _counter = 0;

   List ques = [
    Questions("1.Who developed the Python language?", 1),
    Questions("2.What is the maximum possible length of an identifier?", 3),
    Questions("3.In which year was the Python language developed?", 3),
    Questions("4.Which one of the following is the correct extension of the Python file?", 0),
    Questions("5.What do we use to define a block of code in Python language?", 2),
    Questions("6.What is the method inside the class in python language?", 1),
    Questions("7.Which of the following is not a keyword in Python language?", 0),
    Questions("8.Which of the following operators is the correct option for power(ab)?", 1),
    Questions("9.Which one of the following has the highest precedence in the expression?", 3),
    Questions("10.Given a function that does not return any value, What value is thrown by default when executed in shell.", 3),

  ];

  List options = [
    ["Zim Den", "Guido van Rossum", "Niene Stom", "Wick van Rossum"],
    ["16", "32", "64", "None"],
    ["1995", "1972", "1981", "1989"],
    [".py", ".python", ".p", "None"],
    ["Key", "Brackets", "Indentation", "None of these"],
    ["Object", "Function", "Attribute", "Argument"],
    ["val", "raise", "try", "with"],
    ["a^b", "a**b", "a^^b", "a^*b"],
    ["Division", "Subtraction", "Power", "Parentheses"],
    ["int", "bool", "void", "none"],
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
    //Scaffold.of(context).showSnackBar(snackbar);
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
    //Scaffold.of(context).showSnackBar(snackbar);
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
              
                image: DecorationImage(image: AssetImage("assets/python.jpeg"),
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