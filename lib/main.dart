import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

void main() {
  runApp(
    MaterialApp(
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
  String sum = "0", res = "0", exp1 = "";
  String ACval = "AC";
  double Fontsize1 = 35, Fontsize2 = 45;

  @override
  Widget build(BuildContext context) {
    double   w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color(0xff2D2E32),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              sum,
              style: TextStyle(color: Color(0xff8D8D8D), fontSize: Fontsize1),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              res,
              style: TextStyle(color: Colors.white, fontSize: Fontsize2),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                width: 20,
              ),
              InkWell(
                onTap: () {
                  if (ACval == "AC") {
                    sum = "0";
                    res = "0";
                    setState(() {});
                  }
                },
                child: Container(
                  height: 65,
                  width: 170,
                  alignment: Alignment.center,
                  child: Text(
                    ACval,
                    style: TextStyle(
                      fontSize: 35,
                      color: Colors.white,
                    ),
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: const Color(0xffff5a66),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  sum+="%";
                  setState(() {

                  });
                },
                child: Container(
                  height: 100,
                  width: 100,
                  alignment: Alignment.center,
                  child: const Text(
                    "%",
                    style: TextStyle(
                      fontSize: 35,
                      color: Color(0xff929292),
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: (){
                  sum+="/";
                  setState(() {

                  });
                },
                child: Container(
                  height: 100,
                  width: 100,
                  alignment: Alignment.center,
                  child: Text(
                    "/",
                    style: TextStyle(
                      fontSize: 35,
                      color: Color(0xffff5a66),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Button(
                "7",
                Colors.white,
                w * 0.25,
              ),
              Button(
                "8",
                Colors.white,
                w * 0.25,
              ),
              Button(
                "9",
                Colors.white,
                w * 0.25,
              ),
              Button(
                "x",
                Color(0xffFF5A66),
                w * 0.25,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Button(
                "4",
                Colors.white,
                w * 0.25,
              ),
              Button(
                "5",
                Colors.white,
                w * 0.25,
              ),
              Button(
                "6",
                Colors.white,
                w * 0.25,
              ),
              Button(
                "-",
                Color(0xffFF5A66),
                w * 0.25,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Button(
                "1",
                Colors.white,
                w * 0.25,
              ),
              Button(
                "2",
                Colors.white,
                w * 0.25,
              ),
              Button(
                "3",
                Colors.white,
                w * 0.25,
              ),
              Button(
                "+",
                Color(0xffFF5A66),
                w * 0.25,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Button(
                "00",
                Colors.white,
                w * 0.25,
              ),
              Button(
                "0",
                Colors.white,
                w * 0.25,
              ),
              Button(
                ".",
                Colors.white,
                w * 0.25,
              ),
              EqualSign(
                "=",
                Colors.white,
                w * 0.20,
                BoxDecoration(borderRadius: BorderRadius.circular(100),color: Color(0xffFF5A66),),
              ),
              SizedBox(width: 19,),
            ],
          ),
          SizedBox(
            height: 30,
          ),
        ],
      ),
    );
  }

  Widget Button(
      String text,
      Color fontcolor,
      double w1,
      ) {
    double h = MediaQuery.of(context).size.height;
    return InkWell(
      onTap: () {
        if (text == "=") {
          try {
            exp1 = sum;
            exp1 = exp1.replaceAll("x", "*");
            Parser P = Parser();
            Expression exp2 = P.parse(exp1);
            ContextModel con = ContextModel();
            res = "${exp2.evaluate(EvaluationType.REAL, con)}";

            Fontsize2 = 45;
            Fontsize1 = 35;
            setState(() {});
          } catch (e) {
            Fontsize2 = 45;
            Fontsize1 = 35;
            res = "0";
            setState(() {});
          }
        } else {
          Fontsize2 = 35;
          Fontsize1 = 45;
          if (sum == "0") {
            sum = text;
            setState(() {});
          } else {
            sum += text;
            setState(() {});
          }
        }
      },
      child: Container(
        alignment: Alignment.center,
        height: h * 0.1,
        width: w1,
        decoration: BoxDecoration(
          color: Color(0xff2D2E32), //color: color1,
        ),
        child: Text(
          text,
          style: TextStyle(fontSize: 30, color: fontcolor),
        ),
      ),
    );
  }

  Widget EqualSign(
      String text,
      Color fontcolor,
      double w1,
      BoxDecoration b1,
      ) {
    double h = MediaQuery.of(context).size.height;
    return InkWell(
      onTap: () {
        if (text == "=") {
          try {
            exp1 = sum;
            exp1 = exp1.replaceAll("x", "*");
            Parser P = Parser();
            Expression exp2 = P.parse(exp1);
            ContextModel con = ContextModel();
            res = "${exp2.evaluate(EvaluationType.REAL, con)}";

            Fontsize2 = 45;
            Fontsize1 = 35;
            setState(() {});
          } catch (e) {
            Fontsize2 = 45;
            Fontsize1 = 35;
            res = "0";
            setState(() {});
          }
        } else {
          Fontsize2 = 35;
          Fontsize1 = 45;
          if (sum == "0") {
            sum = text;
            setState(() {});
          } else {
            sum += text;
            setState(() {});
          }
        }
      },
      child: Container(
        alignment: Alignment.center,
        height: h * 0.1,
        width: w1,
        decoration: b1,
        child: Text(
          text,
          style: TextStyle(fontSize: 30, color: fontcolor),
        ),
      ),
    );
  }
}
