import 'package:firebase_core/firebase_core.dart';

import './screens/home_screen.dart';
import 'package:flutter/material.dart';

main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();


  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScrren(),
    );
  }
}
