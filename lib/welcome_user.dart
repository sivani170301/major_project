import 'package:flutter/material.dart';
import 'package:minor_project/add_address.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WelcomeUser extends StatefulWidget {
  const WelcomeUser({ Key? key }) : super(key: key);

  @override
  _WelcomeUserState createState() => _WelcomeUserState();
}

class _WelcomeUserState extends State<WelcomeUser> {
  static String name="";
  static String mob="";
  static String email="";
  static String city="";
  static String state="";
  static String pincode="";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:const Text('Welcome Page'),),

      body: Center(
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Image.asset('assets/user.png', scale: 3.0,),
          ),

          const Padding(
            padding: EdgeInsets.only(bottom:15.0),
            child: Text("Welcome...", style: TextStyle(fontSize: 20.00),),
          ),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(onPressed: (){

            }, child: const Text("Razorpay")),
          ),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(onPressed: (){
              Navigator.push(context, 
              MaterialPageRoute(builder: (context)=>const AddAddress()));
            }, child: const Text("Add/Update Address")),
          ),

           Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(onPressed: () async {
              final prefs = await SharedPreferences.getInstance();
              name = "Name:"+prefs.getString('name')!;
              mob = "Mobile Number:"+prefs.getString('mob')!;
              email = "Email:"+prefs.getString('email')!;
              city = "City:"+prefs.getString('city')!;
              state = "State:"+prefs.getString('state')!;
              pincode = "Pincode:"+prefs.getString('pincode')!;

              showDialog(context: context, 
                builder: 
                (BuildContext context) => AlertDialog(
          title: const Text('Your Profile',style: TextStyle(fontSize:22.0),),
  
          content: SizedBox(
            height: 200,
            width: 300,
            child: Column(
              
              children: [
                Text(_WelcomeUserState.name),
                Text(_WelcomeUserState.mob),
                Text(_WelcomeUserState.email),
                const Text("Address:",style: TextStyle(fontSize:19.0),),
                Text(_WelcomeUserState.city),
                Text(_WelcomeUserState.state),
                Text(_WelcomeUserState.pincode),
                 
              ],
            ),
          ),
          
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(context, 'OK'),
              child: const Text('OK'),
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
                color: Colors.blue,
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
              child: const Text('Yes'),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context, 'No'),
              child: const Text('No'),
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