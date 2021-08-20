import 'package:flutter/material.dart';
import "./model.dart";

class Quiz extends StatefulWidget {
  const Quiz({ Key? key }) : super(key: key);

  @override
  _QuizState createState() => _QuizState();
}

class _QuizState extends State<Quiz> {

   int _counter = 0;

  List ques = [
    Questions("1.What is the size of short variable?", 1),
    Questions("2.What is the default value of int variable?", 0),
    Questions("3.Which of the following is true about String?", 1),
    Questions("4.Which of the following is not a Java features?", 2),
    Questions("5._____ is used to find and fix bugs in the Java programs.", 3),
    Questions("6.Which of the following is a valid declaration of a char?", 0),
    Questions("7.What is the return type of the hashCode() method in the Object class?", 1),
    Questions("8.Which of the following creates a List of 3 visible items and multiple selections abled?", 1),
    Questions("9.Which method of the Class.class is used to determine the name of a class represented by the class object as a String?", 2),
    Questions("10.Which package contains the Random class?", 0),

  ];

  List options = [
    ["8 bit", "16 bit", "32 bit", "64 bit"],
    ["0", "0.0", "null", "not defined"],
    ["String is mutable.", "String is immutable.", " String is a data type.", "None of the above."],
    ["Dynamic", "Architecture Neutral", "Use of pointers", "Object-oriented"],
    ["JVM", "JRE", "JDK", "JDB"],
    ["char ch = '\\utea';", "char ca = 'tea';", "char cr = \\u0223;", "char cc = '\\itea';"],
    ["Object", "int", "long", "void"],
    ["new List(false, 3)", "new List(3, true)", "new List(true, 3)", "new List(3, false)"],
    ["getClass()", "intern()", "getName()", "toString()"],
    ["java.util package", "java.lang package", "java.awt package", "java.io package"]
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
              
                image: DecorationImage(image: AssetImage("assets/javaQuiz.jpeg"),
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