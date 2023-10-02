import 'package:flutter/material.dart';
import 'package:flutter_application_27/screen/home_screen.dart';
import 'package:flutter_application_27/screen/main_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 5)).then((value) {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MainScrean(),));
    },);
    return Scaffold(
      body: Center(
        child: Column(
          children: [
             CircleAvatar(
                radius: 50.0,
                backgroundImage: NetworkImage("https://lh3.googleusercontent.com/b1FG-Jlyzz4gJiIunYC72OKde-yl2n7gOCPL-gZVcIx8vuakL6LLfg_m72AEIDnj7gqlphgACfmvLK8-YfRfYWlyjWN4QCX2jxZo"),
            ),
             CircularProgressIndicator(),
          ],
        ),
      ),

    );
  }
}