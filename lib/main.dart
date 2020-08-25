import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: new LoginPage(),
      theme: new ThemeData(
        primarySwatch: Colors.blue
      )
    );
  }
}


class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with SingleTickerProviderStateMixin{

  AnimationController _iconAnimationController;
  Animation<double> _iconAnimation;

  @override
  void initState(){
    super.initState();
    _iconAnimationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300),
    );
    _iconAnimation = CurvedAnimation(
      parent: _iconAnimationController,
      curve: Curves.bounceOut
    );
    _iconAnimation.addListener(() => this.setState(() {

    }));
    _iconAnimationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Image(
            image: AssetImage('assets/pic1.jpg'),
            height: double.infinity,
            width: double.infinity,
            fit: BoxFit.cover,
            color: Colors.black87,
            colorBlendMode: BlendMode.darken,
          ),
           Column(
             mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              FlutterLogo(
                size: _iconAnimation.value * 100,
              ),
              Form(
                child: Theme(
                  data: ThemeData(
                    brightness: Brightness.dark,
                    primarySwatch: Colors.teal,
                      inputDecorationTheme: InputDecorationTheme(
                        labelStyle: TextStyle(
                          color: Colors.teal,
                          fontSize: 20.0,
                        )
                      )
                  ),
                  child: Container(
                    padding: const EdgeInsets.all(60.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                         TextFormField(
                          decoration: InputDecoration(
                            labelText: 'enter Email',

                          ),
                          keyboardType: TextInputType.emailAddress,
                        ),
                         TextFormField(
                          decoration: InputDecoration(
                            labelText: 'enter Password',
                          ),
                          keyboardType: TextInputType.text,

                             obscureText: true,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 40.0),
                        ),
                        MaterialButton(
                          height: 40.0,
                          minWidth: 100.0,
                          color: Colors.teal,
                          textColor: Colors.white,
                          child: Text('login'),
                          onPressed: () => {},
                          splashColor: Colors.redAccent,
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

