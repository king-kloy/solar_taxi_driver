import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:solar_taxi_driver/screen1.dart';
// import 'package:flutter/services.dart';

class SignIn extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: <Widget>[
              SignInTopPart(),
              SignInBottomPart(),
            ],
          ),
        ),
      );
}

// app theme
ThemeData appTheme = ThemeData(
  primaryColor: Color(0xfff3791a),
);

class SignInTopPart extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Column(
        children: <Widget>[
          SizedBox(height: 50.0),
          Container(
            height: MediaQuery.of(context).size.height / 3,
            child: Image(
              image: AssetImage('assets/logo.png'),
              height: MediaQuery.of(context).size.height / 3,
              width: MediaQuery.of(context).size.width / 3,
            ),
          ),
        ],
      );
}

class SignInBottomPart extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SignInBottomPartState();
}

class _SignInBottomPartState extends State<SignInBottomPart> {
  // @override
  // void initState() {
  //   SystemChrome.setEnabledSystemUIOverlays([]);
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) => Column(
        children: <Widget>[
          SizedBox(height: 50.0),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 30.0),
            child: TextFormField(
              decoration: InputDecoration(
                labelText: 'phone number',
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide(),
                ),
              ),
              keyboardType: TextInputType.number,
              maxLength: 10,
            ),
          ),
          SizedBox(height: 20.0),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 30.0),
            child: TextFormField(
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'password',
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide(),
                ),
              ),
            ),
          ),
          SizedBox(height: 20.0),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.0),
            child: InkWell(
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return ScreenOne();
                }));
              },
              child: Container(
                  alignment: Alignment.center,
                  height: 55.0,
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(9.0)),
                  child: Text("Sign in",
                      style: TextStyle(fontSize: 20.0, color: Colors.white))),
            ),
          ),
        ],
      );
}
