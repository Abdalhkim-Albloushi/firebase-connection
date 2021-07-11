import 'package:firebase_auth/firebase_auth.dart';
import '../screens/home_screen.dart';
import 'package:flutter/material.dart';

class RegisterScrren extends StatefulWidget {
  @override
  _RegisterScrrenState createState() => _RegisterScrrenState();
}

class _RegisterScrrenState extends State<RegisterScrren> {
  late String _name, _email, _passWord;
  FirebaseAuth instance = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register'),
      ),
      body: Center(
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(labelText: 'Name'),
              onChanged: (_name) {
                setState(() {
                  this._name = _name;
                });
              },
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Email'),
              onChanged: (_email) {
                setState(() {
                  this._email = _email;
                });
              },
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Email'),
              onChanged: (_passWord) {
                setState(() {
                  this._passWord = _passWord;
                });
              },
            ),
            RaisedButton(
              child: Text('Register'),
              onPressed: () async {
                try {
                  UserCredential credential =
                      await instance.createUserWithEmailAndPassword(
                          email: this._email, password: this._passWord);
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (cxt) => HomeScrren(),
                    ),
                  );
                } on FirebaseAuthException catch (e) {
                  if (e.code == 'email-already-in-use') {
                    print('weack password');
                  } else if (e.code == 'invalid-email') {
                    print('eenvalid email');
                  }
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
