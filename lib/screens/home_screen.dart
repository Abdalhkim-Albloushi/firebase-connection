import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import '../screens/login_Screen.dart';
import 'package:flutter/material.dart';

class HomeScrren extends StatefulWidget {
  @override
  _HomeScrrenState createState() => _HomeScrrenState();
}

class _HomeScrrenState extends State<HomeScrren> {
  FirebaseAuth instanceFB = FirebaseAuth.instance;

  @override
  void initState() {super.initState();
  
  instanceFB.authStateChanges().listen(
      (User? user) {
        if (user == null) {
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (cxt) => LoginScrren()),(Route<dynamic> route) => false);
    

    
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        actions: [
          IconButton(
            onPressed: () {
              instanceFB.signOut();
            },
            icon: Icon(Icons.logout),
          ),
        ],
      ),
      body: Center(
        child: Text('Home page'),
      ),
    );
  }
}
