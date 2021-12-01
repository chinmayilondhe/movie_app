import 'package:flutter/material.dart';
import 'package:news_api/views/homepage.dart';
import 'package:splash_screen_view/SplashScreenView.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget example1 = SplashScreenView(
       
      navigateRoute: Home(),
      duration: 5000,
      imageSize: 130,
      //imageSrc: "images/logo.png",
      text: "News App",
      textType: TextType.ColorizeAnimationText,
      textStyle: TextStyle(
        fontSize: 40.0,
      ),
      colors: [
        Colors.purple,
        Colors.blue,
        Colors.yellow,
        Colors.red.shade400,
      ],
      backgroundColor: Colors.black,
    );
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: example1,
    );
    
  }
}
