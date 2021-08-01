import 'package:flutter/material.dart';
import 'package:minor_project/welcome_user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({ Key? key }) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

  final emailController = TextEditingController();
final pwdController = TextEditingController();


class _LoginPageState extends State<LoginPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
          title: const Text('Login Page'),
        ),
          body: Column(
        children: [

          Center(child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Image.asset('assets/login.png',scale: 3.00,),
          )),
           Padding(
            padding:  const EdgeInsets.all(7.0),
            child:  TextField(
              controller: emailController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.mail),
                hintText:'Enter Your Email',
                
              ),
            ),
          ),

           Padding(
            padding: const EdgeInsets.all(7.0),
            child: TextField(
              controller: pwdController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.lock),
                hintText:'Enter Your Password',
                
                
              ),
              autofocus: false,
              obscureText: true,
            ),
          ),

          Center(
            child: Padding(
              padding: const EdgeInsets.all(7.0),
              child: ElevatedButton(
                onPressed: () async {
                  final prefs = await SharedPreferences.getInstance();
                  if(prefs.getString('email')==emailController.text.toString() && 
    prefs.getString('pwd')==pwdController.text.toString()){
                    Navigator.push(context,
                    MaterialPageRoute(builder: (context) =>const WelcomeUser()));

                    emailController.clear();
                    pwdController.clear();

                  }
                  else{
                   showDialog(context: context, 
                builder: 
                (BuildContext context) => AlertDialog(
          title: const Text('Error!'),
          content: const Text('Wrong Email or Password..'),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(context, 'OK'),
              child: const Text('OK'),
            ),
          ],
                ),
                );

                emailController.clear();
                pwdController.clear();
                  }
                },
                child: const Text('Login'),
              ),
            ),
          ),

        ],
        
      ),
    );
  }
}
