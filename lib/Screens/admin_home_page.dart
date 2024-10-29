import 'package:flutter/material.dart';
import 'package:pharmacie/services/user_service.dart'; 
import 'package:pharmacie/screens/login.dart'; 

class AdminHomePage extends StatefulWidget {
  @override
  _AdminHomePageState createState() => _AdminHomePageState();
}

class _AdminHomePageState extends State<AdminHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Admin Dashboard'),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () async {
              bool result = await logout();
              if (result) {
                Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) => Login()), 
                  (route) => false
                );
              }
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Welcome, Admin!', style: TextStyle(fontSize: 24)),
            SizedBox(height: 20),
            // Ajoutez Fonctionnalité pour administrateur
          ],
        ),
      ),
    );
  }
}
