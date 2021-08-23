import 'package:flutter/material.dart';
import 'package:minor_project/welcome_user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({ Key key }) : super(key: key);

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
          backgroundColor: Colors.green[900],
        ),
          body: Column(
        children: [

          Center(child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Image.asset('assets/enter.png',scale: 3.00,),
          )),
           Padding(
            padding:  const EdgeInsets.all(7.0),
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
            padding: const EdgeInsets.all(7.0),
            child: TextField(
              controller: pwdController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.lock,color: Colors.green,),
                hintText:'Enter Your Password',
                
                
              ),
              autofocus: false,
              obscureText: true,
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextButton(child: const Text("Forget Password"),
              onPressed: (){
                showDialog(context: context, 
                builder: 
                (BuildContext context) => AlertDialog(
          title: const Text('Forget Password?!'),
          content: Text('Try to register again and then login with your new credentials :)'),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Ok', style: TextStyle(color: Colors.green),),
            ),
          ],
                ),
                );


              
              }),
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
              child: const Text('OK', style: TextStyle(color: Colors.green),),
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
