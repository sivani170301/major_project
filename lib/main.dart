
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:minor_project/register.dart';

import 'login_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({ Key key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(


      theme: ThemeData(
        brightness: Brightness.dark,
    primaryColor: Colors.green[900],
    textButtonTheme: TextButtonThemeData(style: TextButton.styleFrom(primary: Colors.greenAccent)),
    
    
    iconTheme: IconThemeData(color: Colors.green),
    textSelectionTheme: (TextSelectionThemeData(cursorColor: Colors.green)),
    elevatedButtonTheme: ElevatedButtonThemeData(style: 
    ElevatedButton.styleFrom(primary:Colors.green[900])),
    inputDecorationTheme: InputDecorationTheme(
      focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.green)),
      enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.green)),
      border: UnderlineInputBorder(borderSide: BorderSide(color: Colors.green)),
      fillColor: Colors.green,
      focusColor: Colors.green,
      hoverColor: Colors.green,

    )),
      home: const HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({ Key key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: const Text('Welcome to Quiz App'),
        ),
        body: Center(child: Column(children: [

          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Image.asset('assets/quiz.png',scale: 3.00,),
          ),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(child: const Text("Login"),
              onPressed: (){
              Navigator.push(
              context,
              MaterialPageRoute(builder: (context){return const LoginPage();} ),
              
              );
            }),
          ),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(child: const Text("Register"),
              onPressed: (){
              Navigator.push(
              context,
              MaterialPageRoute(builder: (context){return const RegisterPage();}));}),
          ),

          
        ],),
        )
    );
  }
}