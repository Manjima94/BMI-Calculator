
import 'package:bmi_calculator/home.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  DateTime? selectedDate;

  Future<void> pickDate() async {
    DateTime? date = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1990, 1, 1),
      lastDate: DateTime.now(),
    );
    if (date != null) {
      setState(() {
        selectedDate = date;
      });
    }
  }

  int? selectednbr;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var height = size.height;
    var width = size.width;

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 236, 191, 191),
      appBar: AppBar(
        toolbarHeight: 150,
        automaticallyImplyLeading: false,
        backgroundColor: Color.fromARGB(255, 236, 191, 191),
        centerTitle: true,
        title: Text(
          "Create Your Profile",
          style: TextStyle(
              color: Color.fromARGB(255, 224, 76, 105),
              fontSize: 35,
              fontWeight: FontWeight.w700,
              fontFamily: 'IrishGrover'),
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                width: width / 1.3,
                child: TextFormField(
                  decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.person,
                      ),
                      hintText: 'Name',
                      hintStyle: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                      filled: true,
                      fillColor: Colors.white,
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 224, 76, 106), width: 2),
                          borderRadius: BorderRadius.circular(10))),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20, bottom: 30),
                child: SizedBox(
                  width: width / 1.3,
                  child: TextFormField(
                    decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.mail_rounded,
                        ),
                        hintText: 'Email',
                        filled: true,
                        fillColor: Colors.white,
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color.fromARGB(255, 224, 76, 106),
                                width: 2),
                            borderRadius: BorderRadius.circular(10))),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 0, bottom: 20),
                child: Container(
                  width: width / 1.3,
                  height: height / 13,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                          color: Color.fromARGB(255, 224, 76, 106), width: 2),
                      color: Colors.white),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Icon(
                        Icons.cake,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 90),
                        child: Text(
                          selectedDate != null
                              ? DateFormat('dd-MM-yyyy').format(selectedDate!)
                              : 'Date of Birth',
                          style: TextStyle(fontSize: 17),
                        ),
                      ),
                      IconButton(
                        onPressed: pickDate,
                        icon: Icon(Icons.calendar_month_sharp),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                width: width / 1.3,
                height: height / 13,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                        color: Color.fromARGB(255, 224, 76, 106), width: 2),
                    color: Colors.white),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        'Age',
                        style: TextStyle(fontSize: 18),
                      ),
                      Text(''),
                      DropdownButton(
                          icon: Icon(Icons.arrow_drop_down_circle_outlined),
                          value: selectednbr,
                          items: List.generate(100, (index) {
                            return DropdownMenuItem(
                              value: index + 1,
                              child: Text('${index + 1}'),
                            );
                          }),
                          onChanged: (value) {
                            setState(() {
                              selectednbr = value;
                            });
                          })
                    ]),
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
                        MaterialPageRoute(builder: (context) => Home()),
                      );
                    },
                    child: Text(
                      'Calculate BMI',
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
    );
  }
}
