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
  var RS1 = 0;

  var GSTpr = [
    "3%",
    "5%",
    "12%",
    "18%",
    "28%",
  ];

  var Box1 = 0;
  var Box2 = 0;
  var Box3 = 0;
  var Box4 = 0;
  var Box5 = 0;

  var GST = 0;
  var FinalPrice = 0;

  var Decoration1 = BoxDecoration(
    color: Colors.orange.shade700,
    borderRadius: BorderRadius.circular(10),
  );

  @override
  Widget build(BuildContext context) {
    double h1 = MediaQuery.of(context).size.height;
    double w1 = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: h1 * 0.04,
                  width: w1 * 0.487,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                  ),
                  child: Row(
                    children: [
                      const SizedBox(
                        width: 30,
                      ),
                      const Text(
                        "ORIGINAL PRICE",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 17,
                        ),
                      ),
                      const SizedBox(
                        width: 110,
                      ),
                      Text(
                        "$RS1 Rs.",
                        style: const TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 17,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: h1 * 0.2,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Text(
                        "GST",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w600),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: GSTpr.map((e) {
                          return InkWell(
                            onTap: () {
                              setState(() {
                                if (e == "3%") {
                                  FinalPrice = (RS1 * 3 ~/ 100) + RS1;
                                  GST = (FinalPrice - RS1) ~/ 2;
                                  Box1 = 1;
                                  Box2 = 0;
                                  Box3 = 0;
                                  Box4 = 0;
                                  Box5 = 0;
                                } else if (e == "5%") {
                                  FinalPrice = (RS1 * 5 ~/ 100) + RS1;
                                  GST = (FinalPrice - RS1) ~/ 2;
                                  Box2 = 1;
                                  Box1 = 0;
                                  Box3 = 0;
                                  Box4 = 0;
                                  Box5 = 0;
                                } else if (e == "12%") {
                                  FinalPrice = (RS1 * 12 ~/ 100) + RS1;
                                  GST = (FinalPrice - RS1) ~/ 2;
                                  Box3 = 1;
                                  Box1 = 0;
                                  Box2 = 0;
                                  Box4 = 0;
                                  Box5 = 0;
                                } else if (e == "18%") {
                                  FinalPrice = (RS1 * 18 ~/ 100) + RS1;
                                  GST = (FinalPrice - RS1) ~/ 2;
                                  Box4 = 1;
                                  Box1 = 0;
                                  Box2 = 0;
                                  Box3 = 0;
                                  Box5 = 0;
                                } else if (e == "28%") {
                                  FinalPrice = (RS1 * 28 ~/ 100) + RS1;
                                  GST = (FinalPrice - RS1) ~/ 2;
                                  Box5 = 1;
                                  Box1 = 0;
                                  Box2 = 0;
                                  Box3 = 0;
                                  Box4 = 0;
                                }
                              });
                            },
                            child: Container(
                              height: h1 * 0.05,
                              width: w1 * 0.09,
                              alignment: Alignment.center,
                              decoration: (e == "3%" && Box1 == 1)
                                  ? Decoration1
                                  : (e == "5%" && Box2 == 1)
                                  ? Decoration1
                                  : (e == "12%" && Box3 == 1)
                                  ? Decoration1
                                  : (e == "18%" && Box4 == 1)
                                  ? Decoration1
                                  : (e == "28%" && Box5 == 1)
                                  ? Decoration1
                                  : const BoxDecoration(),
                              child: Text(
                                e,
                                style: const TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: h1 * 0.04,
                  width: w1 * 0.487,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                  ),
                  child: Row(
                    children: [
                      const SizedBox(
                        width: 30,
                      ),
                      const Text(
                        "FINAL PRICE",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 17,
                        ),
                      ),
                      const SizedBox(
                        width: 160,
                      ),
                      Text(
                        "$FinalPrice Rs.",
                        style: const TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 17,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: h1 * 0.09,
                  width: w1 * 0.25,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Text(
                        "CGST/SGST",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        "${GST}",
                        style: const TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 17,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Expanded(
                flex: 4,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            InkWell(
                                onTap: () {
                                  setState(() {
                                    RS1 = (RS1 * 10) + 7;
                                  });
                                },
                                child: Button(
                                    "7", Colors.black, w1 * 0.12, h1 * 0.12)),
                            InkWell(
                                onTap: () {
                                  setState(() {
                                    RS1 = (RS1 * 10) + 4;
                                  });
                                },
                                child: Button(
                                    "4", Colors.black, w1 * 0.12, h1 * 0.12)),
                            InkWell(
                                onTap: () {
                                  setState(() {
                                    RS1 = (RS1 * 10) + 1;
                                  });
                                },
                                child: Button(
                                    "1", Colors.black, w1 * 0.12, h1 * 0.12)),
                            InkWell(
                                onTap: () {
                                  setState(() {
                                    RS1 = RS1 * 100;
                                  });
                                },
                                child: Button(
                                    "00", Colors.black, w1 * 0.12, h1 * 0.12)),
                            const SizedBox(
                              height: 20,
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            InkWell(
                                onTap: () {
                                  setState(() {
                                    RS1 = (RS1 * 10) + 8;
                                  });
                                },
                                child: Button(
                                    "8", Colors.black, w1 * 0.12, h1 * 0.12)),
                            InkWell(
                                onTap: () {
                                  setState(() {
                                    RS1 = (RS1 * 10) + 5;
                                  });
                                },
                                child: Button(
                                    "5", Colors.black, w1 * 0.12, h1 * 0.12)),
                            InkWell(
                                onTap: () {
                                  setState(() {
                                    RS1 = (RS1 * 10) + 2;
                                  });
                                },
                                child: Button(
                                    "2", Colors.black, w1 * 0.12, h1 * 0.12)),
                            InkWell(
                                onTap: () {
                                  setState(() {
                                    RS1 = (RS1 * 10) + 0;
                                  });
                                },
                                child: Button(
                                    "0", Colors.black, w1 * 0.12, h1 * 0.12)),
                            const SizedBox(
                              height: 20,
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            InkWell(
                                onTap: () {
                                  setState(() {
                                    RS1 = (RS1 * 10) + 9;
                                  });
                                },
                                child: Button(
                                    "9", Colors.black, w1 * 0.12, h1 * 0.12)),
                            InkWell(
                                onTap: () {
                                  setState(() {
                                    RS1 = (RS1 * 10) + 6;
                                  });
                                },
                                child: Button(
                                    "6", Colors.black, w1 * 0.12, h1 * 0.12)),
                            InkWell(
                                onTap: () {
                                  setState(() {
                                    RS1 = (RS1 * 10) + 3;
                                  });
                                },
                                child: Button(
                                    "3", Colors.black, w1 * 0.12, h1 * 0.12)),
                            InkWell(
                              onTap: () {
                                setState(() {});
                              },
                              child: Button(
                                  ".", Colors.black, w1 * 0.12, h1 * 0.12),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    InkWell(
                      onTap: () {
                        setState(() {
                          FinalPrice = 0;
                          GST = 0;
                          RS1 = 0;
                          Box1 = 0;
                          Box2 = 0;
                          Box3 = 0;
                          Box4 = 0;
                          Box5 = 0;
                        });
                      },
                      child: Container(
                        height: h1 * 0.23,
                        width: w1 * 0.12,
                        decoration: BoxDecoration(
                          color: Colors.orange,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        alignment: Alignment.center,
                        child: const Text(
                          "AC",
                          style: TextStyle(fontSize: 25, color: Colors.white),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          RS1 = RS1 ~/ 10;
                        });
                      },
                      child: Container(
                        height: h1 * 0.23,
                        width: w1 * 0.12,
                        decoration: BoxDecoration(
                          color: Colors.orange,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        alignment: Alignment.center,
                        child: const Text(
                          "⌫",
                          style: TextStyle(
                            fontSize: 25,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                width: 8,
              ),
            ],
          ),
        ],
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Widget Button(
      String text,
      Color fontcolor,
      double w1,
      double h1,
      ) {
    return Container(
      alignment: Alignment.center,
      height: h1,
      width: w1,
      decoration: const BoxDecoration(
        color: Colors.white, //color: color1,
      ),
      child: Text(
        text,
        style: TextStyle(fontSize: 30, color: fontcolor),
      ),
    );
  }
}
