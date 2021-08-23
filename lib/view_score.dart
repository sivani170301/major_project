import 'package:flutter/material.dart';
import 'package:minor_project/all_confetti_widget.dart';
import 'package:minor_project/high_score.dart';
import 'package:minor_project/user_data.dart';

class ViewScore extends StatefulWidget {
  const ViewScore({ Key key }) : super(key: key);

  @override
  _ViewScoreState createState() => _ViewScoreState();
}

class _ViewScoreState extends State<ViewScore> {

  int java_hs=0, py_hs=0, c_hs=0;
  _ViewScoreState(){
        MySharedPreferences.instance.getIntegerValue("java_hs")
        .then((value) => setState(() {
        java_hs = value;
        }));

        MySharedPreferences.instance
        .getIntegerValue("py_hs")
        .then((value) => setState(() {
              py_hs = value;
            }));

        MySharedPreferences.instance
        .getIntegerValue("c_hs")
        .then((value) => setState(() {
              c_hs = value;
            }));
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("High Score"),
        backgroundColor: Colors.green[900],
      ),
      

      body: 
      
      Center(
        child: Column(children: [
        if(java_hs>=7 && py_hs>=7 && c_hs>=7)
        AllConfettiWidget(
          child: Center(
            child: Text(''),),
          ),
          if(java_hs>=7 && py_hs>=7 && c_hs>=7)
          Padding(
              padding: const EdgeInsets.only(top:20.0),
              child: Text("This is Amazing 🥳", style: const TextStyle(fontSize: 30.00),),
            ),
            

          Padding(
              padding: const EdgeInsets.only(top:20.0),
              child: Text("Your High Scores:", style: const TextStyle(fontSize: 30.00),),
            ),

          Padding(padding: EdgeInsets.only(top:15.0)),
          Text("Java: $java_hs/10", style: TextStyle(fontSize: 20.0),),

          Padding(padding: EdgeInsets.only(top:15.0)),
          Text("Python: $py_hs/10", style: TextStyle(fontSize: 20.0),),

          Padding(padding: EdgeInsets.only(top:15.0)),
          Text("C Programming: $c_hs/10", style: TextStyle(fontSize: 20.0),),

          Padding(
            padding: const EdgeInsets.all(20.0),
            child: ElevatedButton(onPressed: (){
              HighScore.setHigh1();
              Navigator.pop(context);
              final snackBar = SnackBar(
      duration: Duration(milliseconds : 800),
      backgroundColor: Colors.green[900],
      content: Text("Reset Success :)", style: TextStyle(color: Colors.white),),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
            }, child: const Text("Reset High Scores")),
          ),


        ],),
      ),
      
    );
  }
}

