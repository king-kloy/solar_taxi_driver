import 'package:flutter/material.dart';

// import './MapSample.dart';
import './screen3.dart';
// import './sign_in.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Google Maps Demo',
      // home: SignIn(),
      home: ScreenThree(),
      debugShowCheckedModeBanner: false,
    );
  }
}
