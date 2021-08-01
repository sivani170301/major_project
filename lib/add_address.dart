import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AddAddress extends StatefulWidget {
  const AddAddress({ Key? key }) : super(key: key);

  

  @override
  _AddAddressState createState() => _AddAddressState();
}

final cityController = TextEditingController();
final stateController = TextEditingController();
final pincodeController = TextEditingController();

class _AddAddressState extends State<AddAddress> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:const Text('Add Address'),),
      body: SingleChildScrollView(
              child: Center(
          child: Column(
            children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Image.asset('assets/address.png', scale:3.0),
            ),

             Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: cityController,
                decoration: 
              const InputDecoration(border: OutlineInputBorder(),
              hintText: "Enter City"),),
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: stateController,
                decoration: 
              const InputDecoration(border: OutlineInputBorder(),
              hintText: "Enter State"),),
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: pincodeController,
                decoration: 
              const InputDecoration(border: OutlineInputBorder(),
              hintText: "Enter PinCode"),
              ),
              
            ),

            ElevatedButton(onPressed: () async {
              final prefs = await SharedPreferences.getInstance();
              prefs.setString('city',cityController.text.toString());
    prefs.setString('state',stateController.text.toString());
    prefs.setString('pincode',pincodeController.text.toString());
              Navigator.pop(context);
            }, child: const Text("Save"))
          ],
          
          ),
        ),
      ),
      );
  }
}