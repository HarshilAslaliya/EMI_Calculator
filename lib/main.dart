import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  Map<String, double> map1 = {
    "loan": 100000,
    "inter": 10,
    "tenure": 24,
  };
  double P =0;
  double N =0;
  double R =0;

  // ignore: non_constant_identifier_names
  var EMIRs = 0;

  @override
  Widget build(BuildContext context) {
    // ignore: non_constant_identifier_names
    var Size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "EMI Calculator",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        leading: const Icon(Icons.border_all_outlined),
        backgroundColor: const Color(0xff20295C),
        elevation: 0,
      ),
      body: Align(
        alignment: Alignment.bottomCenter,
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Container(
              height: Size.height,
              width: Size.width,
              decoration: const BoxDecoration(
                color: Color(0xff20295C),
              ),
              child: Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "Your Loan EMI is",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "₹ ${EMIRs.toDouble()}",
                        style: const TextStyle(
                          fontSize: 40,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Text(
                        "Month",
                        style: TextStyle(
                            color: Colors.white,
                            height: 3,
                            fontWeight: FontWeight.w200),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              height: Size.height * 0.76,
              width: Size.width,
              decoration: const BoxDecoration(
                color: Color(0xffEFEFEF),
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(55),
                ),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                    color: Color(0xff0F2027),
                    blurRadius: 50,
                    spreadRadius: 7,
                  ),
                ],
              ),
              child: Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Expanded(
                    child: MySliderBox(
                        Title: "Loan Amount",
                        sym: "₹",
                        Value: "loan",
                        min1: 10000,
                        max1: 200000),),
                  Expanded(
                    child: MySliderBox(
                        Title: "Interest Rate",
                        sym: "%",
                        Value: "inter",
                        min1: 1,
                        max1: 30),),
                  Expanded(
                    child: MySliderBox(
                        Title: "Loan Tenure",
                        sym: "Months",
                        Value: "tenure",
                        min1: 10,
                        max1: 56),),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap:(){
                            setState(() {
                              P=map1["loan"]!;
                              R=map1["inter"]!/12/100;
                              N=map1["tenure"]!;

                              EMIRs = P * R * pow((1+R), N)~/(pow((1 + R), N)-1);
                            });
                          },
                          child: Container(
                            alignment: Alignment.center,
                            height: 70,
                            width: 240,
                            decoration: BoxDecoration(
                              color: const Color(0xffE7EAFF),
                              border: Border.all(
                                color: const Color(0xff2C397E),
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: const Text(
                              "Calculate",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 30,
                                color: Color(0xff2C3568),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Widget MySliderBox(
      // ignore: non_constant_identifier_names
          {required String Title,
        required String sym,
        // ignore: non_constant_identifier_names
        required String Value,
        required double min1,
        required double max1}) {
    return Column(
      children: [
        // SizedBox(height: 30,),
        Text(
          Title,
          style: const TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w500,
            color: Color(0xff484848),
          ),
        ),
        Stack(
          alignment: Alignment.center,
          children: [
            Text(
              Title,
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 50,
                  color: Color(0xffE5E6E8)),
            ),
            Text(
              "${map1[Value]!.toInt()} $sym ",
              style: const TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        SizedBox(
          width: 330,
          child: Slider(
            onChanged: (val) {
              setState(() {
                map1[Value] = val;
              });
            },
            value: map1[Value]!,
            min: min1,
            max: max1,
            thumbColor: const Color(0xff20295C),
            inactiveColor: Colors.blueGrey.shade100,
            activeColor: Colors.blueGrey.shade200,
          ),
        ),
      ],
    );
  }
}
