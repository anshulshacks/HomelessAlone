import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:HomelessAlone/screens/find_request.dart';

class Signup extends StatelessWidget {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        SizedBox(
          height: 100,
        ),
        Container(
          alignment: Alignment.center,
          child: Text(
            'Signup',
            style: TextStyle(
              fontFamily: 'Source Sans',
              fontWeight: FontWeight.bold,
              fontSize: 36,
              color: Theme.of(context).primaryColor,
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.only(
            left: 30,
          ),
          alignment: Alignment.centerLeft,
          child: Text(
            'Email',
            style: TextStyle(
              color: Theme.of(context).primaryColor,
              fontSize: 18,
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(
            vertical: 15,
            horizontal: 30,
          ),
          child: TextField(
            controller: emailController,
            style: TextStyle(
              color: Theme.of(context).accentColor,
            ),
            decoration: InputDecoration(
              labelText: 'Email',
              labelStyle: TextStyle(color: Theme.of(context).primaryColor),
              prefixIcon: Icon(
                Icons.mail,
                color: Theme.of(context).primaryColor,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                  color: Theme.of(context).primaryColor,
                  width: 3,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                  color: Theme.of(context).accentColor,
                ),
              ),
            ),
          ),
        ),
        SizedBox(height: 30),
        Container(
          padding: EdgeInsets.only(
            left: 30,
          ),
          alignment: Alignment.centerLeft,
          child: Text(
            'Email',
            style: TextStyle(
              color: Theme.of(context).primaryColor,
              fontSize: 18,
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(
            vertical: 15,
            horizontal: 30,
          ),
          child: TextField(
            obscureText: true,
            controller: passwordController,
            style: TextStyle(
              color: Theme.of(context).accentColor,
            ),
            decoration: InputDecoration(
              labelText: 'Password',
              labelStyle: TextStyle(color: Theme.of(context).primaryColor),
              prefixIcon: Icon(
                Icons.lock,
                color: Theme.of(context).primaryColor,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                  color: Theme.of(context).primaryColor,
                  width: 3,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                  color: Theme.of(context).accentColor,
                ),
              ),
            ),
          ),
        ),
        RaisedButton(
          color: Theme.of(context).accentColor,
          child: Text(
            'Sign up',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          onPressed: () async {
            FirebaseAuth auth = FirebaseAuth.instance;
            AuthResult _authResult;

            _authResult = await auth.createUserWithEmailAndPassword(
                email: emailController.text, password: passwordController.text);

            

            

            Navigator.of(context).pushNamed(
              FindRequest.routeName,
            );
          },
        ),
        FlatButton(
          child: Text(
            'Or log in instead',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ],
    ));
  }
}
