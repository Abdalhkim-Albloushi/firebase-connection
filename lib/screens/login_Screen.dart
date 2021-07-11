import 'package:firebase_auth/firebase_auth.dart';
import '../screens/home_screen.dart';

import '../screens/register_screen.dart';
import 'package:flutter/material.dart';

class LoginScrren extends StatefulWidget {
  @override
  _LoginScrrenState createState() => _LoginScrrenState();
}

class _LoginScrrenState extends State<LoginScrren> {
  late String _email, _passWord;
  
  FirebaseAuth instance = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Center(
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(labelText: 'Email', errorText: 'ggg'),
              onChanged: (_email) {
                setState(() {
                  this._email = _email;
                });
              },
            ),
            TextField(
              decoration: InputDecoration(labelText: 'PassWord'),
              onChanged: (_passWord) {
                setState(() {
                  this._passWord = _passWord;
                });
              },
            ),
            RaisedButton(
              child: Text('Login'),
              onPressed: () async {
                try {
                  await instance.signInWithEmailAndPassword(
                      email: _email, password: _passWord);
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(builder: (context) => HomeScrren()),
                      (Route<dynamic> route) => false);
                } on FirebaseAuthException catch (e) {
                  if (e.code == 'user-not-found') {
                    print('not fond');
                  } else if (e.code == 'wrong-password') {
                    print('password wrong');
                  }
                }
              },
            ),
            FlatButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (cxt) => RegisterScrren(),
                  ),
                );
              },
              child: Text('register'),
            ),
          ],
        ),
      ),
    );
  }
}
