import 'package:HomelessAlone/screens/create_request.dart';
import 'package:HomelessAlone/screens/find_request.dart';
import 'package:HomelessAlone/screens/signup.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: 'Lato',
        primaryColor: Color.fromRGBO(240, 242, 239, 1),
        accentColor: Color.fromRGBO(175, 213, 170, 1),
        
        canvasColor: Color.fromRGBO(92, 83, 70, 1),
      ),
      home: Signup(),
      routes: {
          FindRequest.routeName: (ctx) => FindRequest(),
          CreateScreen.routeName: (ctx) => CreateScreen(),
        },
    );
  }
}

