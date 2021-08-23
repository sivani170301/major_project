import 'package:flutter/material.dart';
import 'package:minor_project/high_score.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({ Key key }) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

final emailController = TextEditingController();
final pwdController = TextEditingController();
final nameController = TextEditingController();
final mobController = TextEditingController();

class _RegisterPageState extends State<RegisterPage> {

  static Future init() async {

    final prefs = await SharedPreferences.getInstance();

    prefs.setString('email',emailController.text.toString());
    prefs.setString('pwd',pwdController.text.toString());
    prefs.setString('name',nameController.text.toString());
    prefs.setString('mob',mobController.text.toString());
    prefs.setString('city',"NA");
    prefs.setString('state',"NA");
    prefs.setString('pincode',"NA");

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:const Text('Register Page'),
      backgroundColor: Colors.green[900],),

      body: SingleChildScrollView(
              child: Column(children: [
          Center(child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Image.asset('assets/register.png', scale: 3.00,),
          )
          ),

          Padding(
              padding:  const EdgeInsets.all(5.0),
              child:  TextField(
                controller: nameController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.person,color: Colors.green,),
                  hintText:'Enter Your Name',
                  
                ),
              ),
            ),

            Padding(
              padding:  const EdgeInsets.all(5.0),
              child:  TextField(
                controller: mobController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.phone,color: Colors.green,),
                  hintText:'Enter Your Mobile Number',
                  
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(5.0),
              child:  TextField(
                controller: emailController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.mail,color: Colors.green,),
                  hintText:'Enter Your Email',
                  
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(5.0),
              child:  TextField(
                controller: pwdController,
                decoration:const InputDecoration(
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.password,color: Colors.green,),
                  hintText:'Create Password',
                  
                ),
                autofocus: false,
              obscureText: true,
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(5.0),
              child: ElevatedButton(onPressed: (){
                HighScore.setHigh1();
                init();
                Navigator.pop(context);

              },
              child: const Text("Register"),),
            )

        ],),
      ),
      
    );
  }
}