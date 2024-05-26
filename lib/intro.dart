// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:bmi_calculator/profile.dart';
import 'package:flutter/material.dart';

class Intro extends StatefulWidget {
  const Intro({super.key});

  @override
  State<Intro> createState() => _IntroState();
}

class _IntroState extends State<Intro> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var height = size.height;
    var width = size.width;
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 240, 171, 171),
      body: Center(
        child: SizedBox(
          height: height,
          width: width,
          child: Padding(
            padding: const EdgeInsets.only(top: 70),
            child: Column(
              children: [
                Text('BMI',
                    style: TextStyle(
                        color: Color.fromARGB(255, 218, 53, 86),
                        fontFamily: 'IrishGrover',
                        fontSize: 70)),
                Text('Calculator',
                    style: TextStyle(
                        color: Color.fromARGB(255, 218, 53, 86),
                        fontFamily: 'IrishGrover',
                        fontSize: 70)),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                      "Body mass index (BMI): it's a person's weight in kilograms divided by the square of height in meters, BMI is an inexpensive and easy screening method for weight category underweight, healthy weight, overweight, and obesity. A high BMI can indicate high body fatness. BMI screens for weight categories that may lead to health problems, but it does not diagnose the body fatness or health of an individual.",
                      style:
                          TextStyle(fontWeight: FontWeight.w400, fontSize: 20)),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 60.0),
                  child: ElevatedButton(
                      style: ButtonStyle(
                          fixedSize: MaterialStatePropertyAll(
                              Size(width / 1.4, height / 17)),
                          backgroundColor: MaterialStatePropertyAll(
                            Color.fromARGB(255, 218, 53, 86),
                          )),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Profile()),
                        );
                      },
                      child: Text(
                        'GET STARTED',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.normal),
                      )),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
