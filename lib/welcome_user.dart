import 'package:flutter/material.dart';
import 'package:minor_project/choose_quiz.dart';
import 'package:minor_project/view_score.dart';
import 'package:shared_preferences/shared_preferences.dart';
import './user_data.dart';

class WelcomeUser extends StatefulWidget {
  const WelcomeUser({ Key key }) : super(key: key);

  @override
  _WelcomeUserState createState() => _WelcomeUserState();
}

class _WelcomeUserState extends State<WelcomeUser> {
  static String name="";
  static String mob="";
  static String email="";
  static String username="";

  _WelcomeUserState(){

  MySharedPreferences.instance
        .getStringValue("name")
        .then((value) => setState(() {
              username = value;
            }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:const Text('Let\'s Play Quiz'),
      backgroundColor: Colors.green[900],),

      body: Center(
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Image.asset('assets/user.png', scale: 3.0,),
          ),

          Padding(
            padding: const EdgeInsets.only(bottom:15.0),
            child: Text("Welcome, $username.", style: const TextStyle(fontSize: 20.00),),
          ),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(onPressed: (){

              Navigator.push(context, 
              MaterialPageRoute(builder: (context)=>const Choose()));

            }, child: const Text("Play Quiz")),
          ),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(onPressed: (){

              Navigator.push(context, 
              MaterialPageRoute(builder: (context)=>const ViewScore()));

            }, child: const Text("View High Score")),
          ),

           Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(onPressed: () async {
              final prefs = await SharedPreferences.getInstance();
              name = "Name:"+prefs.getString('name');
              mob = "Mobile Number:"+prefs.getString('mob');
              email = "Email:"+prefs.getString('email');

              showDialog(context: context, 
                builder: 
                (BuildContext context) => AlertDialog(
          title: const Text('Your Profile',style: TextStyle(fontSize:22.0),),
  
          content: SizedBox(
            height: 75,
            width: 300,
            child: Column(
              
              children: [
                Text(_WelcomeUserState.name),
                Text(_WelcomeUserState.mob),
                Text(_WelcomeUserState.email),             
              ],
            ),
          ),
          
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(context, 'OK'),
              child: const Text('OK', style: TextStyle(color:Colors.green),),
            ),
          ],
                ),
                );

            }, child: const Text("View Profile")),
          ),

        ],),
      ),

      drawer: Drawer(child: ListView(
         padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.green,
              ),
              
              child: Text('Your Burger Menu',style: TextStyle(fontSize:20.0),),
              
            ),
            
            ListTile(
              leading: const Icon(Icons.help),
              title: const Text('Help'),
              onTap: () {
                Navigator.pop(context);
              },
            ),

            ListTile(
              leading: const Icon(Icons.share),
              title: const Text('Share :)'),
              onTap: () {
                Navigator.pop(context);
              },
            ),

            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('Logout'),
              onTap: () {
                showDialog(context: context, 
                builder: 
                (BuildContext context) => AlertDialog(
          title: const Text('Are you sure?'),
          content: const Text('Do you really want to logout?'),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.of(context).pushNamedAndRemoveUntil('/', (Route<dynamic> route) => false),
              child: const Text('Yes', style: TextStyle(color: Colors.green),),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context, 'No'),
              child: const Text('No', style: TextStyle(color: Colors.green),),
            ),
          ],
                ),
                );
              },
            ),
      ]
      ), 
    ),
    );
  }
}