// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, unused_import

import 'dart:async';

import 'package:bmi_calculator/intro.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'profile.dart'; // Import your profile.dart file properly.

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
      Duration(seconds: 4),
      () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Intro()),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var height = size.height;
    var width = size.width;
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 240, 171, 171),
        body: Stack(children: [
          Column(
            children: [
              Align(
                  alignment: Alignment.topLeft,
                  child: Container(
                    height: height / 7,
                    width: width / 4,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(160))),
                  )),
              Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                    height: height / 7,
                    width: width / 7,
                    decoration: BoxDecoration(
                        color: Color.fromARGB(255, 224, 76, 105),
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(60),
                            bottomLeft: Radius.circular(60))),
                  )),
              AnimatedTextKit(
                animatedTexts: [
                  WavyAnimatedText(
                    'BMI',
                    textStyle: TextStyle(
                        color: Color.fromARGB(255, 218, 53, 86),
                        fontFamily: 'IrishGrover',
                        fontSize: 90),
                  ),
                ],
                repeatForever: true,
              ),
              Text('Calculator',
                  style: TextStyle(
                      color: Color.fromARGB(255, 218, 53, 86),
                      fontFamily: 'IrishGrover',
                      fontSize: 70)),
              Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    height: height / 7,
                    width: width / 8,
                    decoration: BoxDecoration(
                        color: Color.fromARGB(255, 235, 223, 226),
                        borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(60),
                            topRight: Radius.circular(60))),
                  )),
              Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                    height: height / 6.4,
                    width: width / 8,
                    decoration: BoxDecoration(
                        color: Color.fromARGB(255, 224, 76, 105),
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(60),
                            bottomLeft: Radius.circular(60))),
                  )),
              Align(
                  alignment: Alignment.bottomLeft,
                  child: Container(
                    height: height / 7,
                    width: width / 4,
                    decoration: BoxDecoration(
                        color: Color.fromARGB(255, 224, 76, 105),
                        borderRadius:
                            BorderRadius.only(topRight: Radius.circular(160))),
                  )),
            ],
          ),
        ]));
  }
}
