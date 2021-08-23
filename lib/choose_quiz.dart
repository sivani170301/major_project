import 'package:flutter/material.dart';
import 'package:minor_project/c_quiz.dart';
import 'package:minor_project/py_quiz.dart';
import 'package:minor_project/quiz_page.dart';

class Choose extends StatefulWidget {
  const Choose({ Key key }) : super(key: key);

  @override
  _ChooseState createState() => _ChooseState();
}

class _ChooseState extends State<Choose> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:const Text('Let\'s Play Quiz'),
      backgroundColor: Colors.green[900],),

      body: Column(children: [
         Padding(padding: EdgeInsets.only(top:20)),
        Container(

              height: 200,
              width: 500,
             
              decoration: BoxDecoration(
              
                image: DecorationImage(image: AssetImage("assets/choose.jpeg"),
                fit: BoxFit.fill,
                )
              ),   
             
        ),
        Padding(padding: EdgeInsets.only(top:15)),
        Padding(
          
            padding: const EdgeInsets.all(5.0),
            child: ElevatedButton(onPressed: (){

              Navigator.push(context, 
              MaterialPageRoute(builder: (context)=>const Quiz()));

            }, child: const Text("Java Quiz")),
          ),

          Padding(
            padding: const EdgeInsets.all(5.0),
            child: ElevatedButton(onPressed: (){

              Navigator.push(context, 
              MaterialPageRoute(builder: (context)=>const PythonQuiz()));

            }, child: const Text("Python Quiz")),
          ),

          Padding(
            padding: const EdgeInsets.all(5.0),
            child: ElevatedButton(onPressed: (){

              Navigator.push(context, 
              MaterialPageRoute(builder: (context)=>const CQuiz()));

            }, child: const Text("C Programming Quiz")),
          ),
      ],),


      
    );
  }
}