// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String? ddvalue; // Initially, no value is selected
  var gender = ['Female', 'Male'];
  var height = TextEditingController();
  var weight = TextEditingController();
  var bmi = TextEditingController();
  Color mycolor = Color.fromARGB(255, 218, 53, 86);
  void calculate(String height, String weight) {
    try {
      var my_weight = double.parse(weight);

      var my_height = double.parse(height);

      var result = (my_weight / (my_height * my_height));
      setState(() {
        bmi.text = result.toStringAsFixed(2);
        if (result <= 18.4) {
          mycolor = Color.fromARGB(255, 120, 151, 224);
        } else if (result >= 18.5 && result <= 24.9) {
          mycolor = Color.fromARGB(255, 24, 140, 53);
        } else if (result >= 25 && result <= 29.9) {
          mycolor = Colors.yellow;
        } else if (result >= 30 && result <= 34.9) {
          mycolor = Color.fromARGB(255, 180, 102, 34);
        } else if (result >= 35) {
          mycolor = Colors.red;
        }
      });
    } catch (e) {
      setState(() {
        bmi.text = "Invalid input";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var Height = size.height;
    var Width = size.width;

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 236, 191, 191),
      appBar: AppBar(
        toolbarHeight: 100,
        backgroundColor: Color.fromARGB(255, 236, 191, 191),
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 30),
          child: Container(
            height: Height/15,
            width: Width/1.2,
            decoration: BoxDecoration(color:  Color.fromARGB(255, 218, 53, 86),borderRadius: BorderRadius.circular(15)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Text(
                  'GENDER',
                  style: TextStyle(color: Colors.white, fontSize: 20,fontWeight: FontWeight.w600),
                ),
                DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    
                    iconEnabledColor: Colors.white,
                    dropdownColor: Color.fromARGB(255, 218, 53, 86),
                    style:
                        const TextStyle(fontSize: 20, color:Colors.redAccent ),
                    value: ddvalue,
                    icon: const Icon(
                      Icons.keyboard_arrow_down,
                      size: 35,
                    ),
                    items: gender.map((String gender) {
                      return DropdownMenuItem<String>(
                        value: gender,
                        child: Text(gender,style: TextStyle(color: Colors.white),),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        ddvalue = newValue;
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              height: Height / 16,
              width: Width / 2.7,
              child: TextFormField(
                keyboardType: TextInputType.number,
                controller: height,
                decoration: InputDecoration(
                  labelText: '   HEIGHT',
                  labelStyle: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                  filled: true,
                  fillColor: Color.fromARGB(255, 218, 53, 86),
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: Height / 16,
              width: Width / 2.7,
              child: TextFormField(
                keyboardType: TextInputType.number,
                controller: weight,
                decoration: InputDecoration(
                  labelText: '   WEIGHT',
                  labelStyle: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                  filled: true,
                  fillColor: Color.fromARGB(255, 218, 53, 86),
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(top: 30, bottom: 40),
          child: ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStatePropertyAll(
                Color.fromARGB(255, 218, 53, 86),
              ),
              shape: MaterialStatePropertyAll(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              fixedSize: MaterialStateProperty.all(
                Size(Width / 1.2, Height / 15),
              ),
            ),
            onPressed: () {
              calculate(height.text, weight.text);
            },
            child: const Text(
              'CALCULATE',
              style: TextStyle(color: Colors.white, fontSize: 25),
            ),
          ),
        ),
        Container(
          height: Height / 5,
          width: Width / 1.5,
          decoration: BoxDecoration(
            color: mycolor,
            borderRadius: BorderRadius.circular(45),
          ),
          child: Center(
            child: Text(
              'BMI : ${bmi.text}',
              style: const TextStyle(color: Colors.white, fontSize: 40),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            left: 20,
            top: 40,
          ),
          child: Row(children: [
            Padding(
              padding: const EdgeInsets.only(
                left: 20,
              ),
              child: Column(
                children: [
                  Icon(Icons.square,
                      size: 30, color: Color.fromARGB(255, 120, 151, 224)),
                  Icon(Icons.square,
                      size: 30, color: Color.fromARGB(255, 24, 140, 53)),
                  Icon(
                    Icons.square,
                    size: 30,
                    color: Colors.yellow,
                  ),
                  Icon(Icons.square,
                      size: 30, color: Color.fromARGB(255, 180, 102, 34)),
                  Icon(
                    Icons.square,
                    size: 30,
                    color: Colors.red,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 20,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Underweight',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  Text(
                    'Normal',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  Text(
                    'Overweight',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  Text(
                    'obese',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  Text(
                    'Extreme',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ],
              ),
            )
          ]),
        ),
        Padding(
          padding: const EdgeInsets.only(left:300.0),
          child: FloatingActionButton(backgroundColor: Color.fromARGB(255, 218, 53, 86),
            
            onPressed: () {
            height.clear();
            weight.clear();
           setState(() {
                    ddvalue = null;
                    bmi.clear();
                  });
          }
          ,child: Icon(Icons.refresh,color: Colors.white,size: 30,),),
        )
      ])),
    );
  }
}
