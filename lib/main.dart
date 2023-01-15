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
  // ignore: non_constant_identifier_names
  double MySlider = 180;
  double value = 0;

  var tap1 = 0;
  var tap2 = 0;

  // ignore: non_constant_identifier_names
  var Weight = 60;
  // ignore: non_constant_identifier_names
  var Age = 28;

  // ignore: non_constant_identifier_names
  var TapWeight1 = 0;
  // ignore: non_constant_identifier_names
  var TapWeight2 = 0;

  // ignore: non_constant_identifier_names
  var TapAge1 = 0;
  // ignore: non_constant_identifier_names
  var TapAge2 = 0;

  // ignore: non_constant_identifier_names
  double Calculate1 = 0;
  // ignore: non_constant_identifier_names
  String Calculate = "Calculate";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(      backgroundColor: const Color(0xff090E21),

        title: const Text(
          "BMI Calculator",
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.w400,
          ),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      backgroundColor: const Color(0xff090E21),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 10, bottom: 30, right: 30, left: 30),
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.25,
                  child: Row(
                    children: [
                      InkWell(
                        onTap: () {
                          setState(() {
                            tap1 = 1;
                            tap2 = 0;
                          });
                        },
                        child: Ink(
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.4,
                            decoration: BoxDecoration(
                              color: (tap1 == 1)
                                  ? const Color(0xff3B3C4D)
                                  : const Color(0xff1D1E33),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            alignment: Alignment.center,
                            child: Column(
                              children: [
                                Icon(
                                  Icons.female,
                                  size: 160,
                                  color: (tap1 == 1)
                                      ? const Color(0xffEB1555)
                                      : Colors.white,
                                ),
                                Text(
                                  "Female",
                                  style: TextStyle(
                                    fontSize: 17,
                                    color: (tap1 == 1)
                                        ? const Color(0xffeb1555)
                                        : Colors.white,
                                    fontWeight: (tap1 == 1)
                                        ? FontWeight.bold
                                        : FontWeight.normal,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 18,
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            tap2 = 1;
                            tap1 = 0;
                          });
                        },
                        child: Ink(
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.4,
                            decoration: BoxDecoration(
                              color: (tap2 == 1)
                                  ? const Color(0xff3B3C4D)
                                  : const Color(0xff1D1E33),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            alignment: Alignment.center,
                            child: Column(
                              children: [
                                Icon(
                                  Icons.male,
                                  size: 160,
                                  color: (tap2 == 1)
                                      ? const Color(0xffEB1555)
                                      : Colors.white,
                                ),
                                Text(
                                  "Male",
                                  style: TextStyle(
                                    fontSize: 17,
                                    color: (tap2 == 1)
                                        ? const Color(0xffeb1555)
                                        : Colors.white,
                                    fontWeight: (tap2 == 1)
                                        ? FontWeight.bold
                                        : FontWeight.normal,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  height: MediaQuery.of(context).size.height * 0.23,
                  decoration: BoxDecoration(
                    color: const Color(0xff1D1E33),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            "HEIGHT",
                            style: TextStyle(
                              color: Color(0xff626476),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "${MySlider.toInt()}",
                            style: const TextStyle(
                              fontSize: 50,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(
                            width: 2,
                          ),
                          const Text(
                            "cm",
                            style: TextStyle(
                              height: 4,
                              color: Color(0xff626476),
                            ),
                          ),
                        ],
                      ),
                      Slider(
                        value: MySlider.toDouble(),
                        onChanged: (val) {
                          setState(() {
                            MySlider = val;
                          });
                        },
                        min: 90,
                        max: 270,
                        activeColor: const Color(0xffF5C1D1),
                        thumbColor: const Color(0xffEB1555),
                        inactiveColor: const Color(0xff555555),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 17,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.25,
                  child: Row(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * 0.4,
                        decoration: BoxDecoration(
                          color: const Color(0xff1D1E33),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        alignment: Alignment.center,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            const Text(
                              "Weight",
                              style:
                              TextStyle(fontSize: 17, color: Colors.white),
                            ),
                            Text(
                              "$Weight",
                              style: const TextStyle(
                                  fontSize: 50,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      Weight--;
                                      TapWeight1 = 1;
                                      TapWeight2 = 0;
                                    });
                                  },
                                  child: Container(
                                    height: 50,
                                    width: 50,
                                    decoration: BoxDecoration(
                                      color: (TapWeight1 == 1)
                                          ? const Color(0xff6E6F7A)
                                          : const Color(0xff4C4F5E),
                                      borderRadius: BorderRadius.circular(25),
                                    ),
                                    child: Icon(
                                      Icons.horizontal_rule,
                                      color: (TapWeight1 == 1)
                                          ? const Color(0xffF67FA4)
                                          : const Color(0xffffffff),
                                    ),
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      Weight++;
                                      TapWeight1 = 0;
                                      TapWeight2 = 1;
                                    });
                                  },
                                  child: Container(
                                    height: 50,
                                    width: 50,
                                    decoration: BoxDecoration(
                                      color: (TapWeight2 == 1)
                                          ? const Color(0xff6E6F7A)
                                          : const Color(0xff4C4F5E),
                                      borderRadius: BorderRadius.circular(25),
                                    ),
                                    child: Icon(
                                      Icons.add,
                                      color: (TapWeight2 == 1)
                                          ? const Color(0xffF67FA4)
                                          : const Color(0xffffffff),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        width: 18,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.4,
                        decoration: BoxDecoration(
                          color: const Color(0xff1D1E33),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        alignment: Alignment.center,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            const Text(
                              "Age",
                              style:
                              TextStyle(fontSize: 17, color: Colors.white),
                            ),
                            Text(
                              "$Age",
                              style: const TextStyle(
                                  fontSize: 50,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      Age--;
                                      TapAge1 = 1;
                                      TapAge2 = 0;
                                    });
                                  },
                                  child: Container(
                                    height: 50,
                                    width: 50,
                                    decoration: BoxDecoration(
                                      color: (TapAge1 == 1)
                                          ? const Color(0xff6E6F7A)
                                          : const Color(0xff4C4F5E),
                                      borderRadius: BorderRadius.circular(25),
                                    ),
                                    child: Icon(
                                      Icons.horizontal_rule,
                                      color: (TapAge1 == 1)
                                          ? const Color(0xffF67FA4)
                                          : const Color(0xffffffff),
                                    ),
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      Age++;
                                      TapAge2 = 0;
                                      TapAge1 = 1;
                                    });
                                  },
                                  child: Container(
                                    height: 50,
                                    width: 50,
                                    decoration: BoxDecoration(
                                      color: (TapAge2 == 1)
                                          ? const Color(0xff6E6F7A)
                                          : const Color(0xff4C4F5E),
                                      borderRadius: BorderRadius.circular(25),
                                    ),
                                    child: Icon(
                                      Icons.add,
                                      color: (TapAge2 == 1)
                                          ? const Color(0xffF67FA4)
                                          : const Color(0xffffffff),
                                    ),
                                  ),
                                ),
                              ],
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
        ],
      ),
      floatingActionButton: Container(
        height: 60,
        width: MediaQuery.of(context).size.width * 0.92,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.pink,
          borderRadius: BorderRadius.circular(30),
        ),
        child: InkWell(
          onTap: () {
            setState(() {
              Calculate1 = (Weight / MySlider / MySlider) * 10000;
              if (Calculate1 <= 18.5) Calculate = "UnderWeight";
              if (Calculate1 >= 18.5 && Calculate1 <= 24.9) {
                Calculate = "Healthy";
              }
              if (Calculate1 >= 24.9 && Calculate1 <= 30) {
                Calculate = "OverWeight";
              }
              if (Calculate1 >= 30) Calculate = "Obese";
            });
          },
          child: Text(
            Calculate,
            style: const TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
