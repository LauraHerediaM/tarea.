// ignore_for_file: deprecated_member_use, unused_local_variable

import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Roboto'),
      home: const Calculator(),
    );
  }
}

class Calculator extends StatefulWidget {
  const Calculator({Key? key}) : super(key: key);

  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  dynamic displaytxt = 20;
  //Button Widget
  Widget calcbutton(String btntxt, Color btncolor, Color txtcolor) {
    return RaisedButton(
      onPressed: () {
        calculation(btntxt);
      },
      child: Text(
        btntxt,
        style: TextStyle(
          fontSize: 35,
          color: txtcolor,
        ),
      ),
      color: btncolor,
      padding: const EdgeInsets.all(15),
    );
  }

  @override
  Widget build(BuildContext context) {
    //Calculator
    Color color;
    return Scaffold(
      backgroundColor: color = Color.fromARGB(255, 195, 126, 223),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            // Calculator display
            SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Text(
                      '$text',
                      textAlign: TextAlign.left,
                      style: const TextStyle(
                        color: Color.fromARGB(255, 255, 255, 255),
                        fontSize: 50,
                      ),
                    ),
                  )
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                calcbutton('%', color = Color.fromARGB(255, 255, 255, 255),
                    Colors.black),
                calcbutton('/', color = Color.fromARGB(255, 253, 253, 253),
                    Colors.black),
                calcbutton('AC', color = Color.fromARGB(255, 248, 150, 243),
                    Colors.black),
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                calcbutton('7', color = Color.fromARGB(255, 255, 255, 255),
                    Color.fromARGB(255, 5, 5, 5)),
                calcbutton('8', color = Color.fromARGB(255, 255, 255, 255),
                    Color.fromARGB(255, 0, 0, 0)),
                calcbutton('9', color = Color.fromARGB(255, 255, 255, 255),
                    Color.fromARGB(255, 7, 7, 7)),
                calcbutton('x', color = Color.fromARGB(255, 255, 255, 255),
                    Colors.black),
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                calcbutton('4', color = Color.fromARGB(255, 255, 255, 255),
                    Color.fromARGB(255, 0, 0, 0)),
                calcbutton('5', color = Color.fromARGB(255, 255, 255, 255),
                    Color.fromARGB(255, 0, 0, 0)),
                calcbutton('6', color = Color.fromARGB(255, 255, 255, 255),
                    Color.fromARGB(255, 0, 0, 0)),
                calcbutton('-', color = Color.fromARGB(255, 255, 255, 255),
                    Colors.black),
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                calcbutton('1', color = Color.fromARGB(255, 255, 255, 255),
                    Color.fromARGB(255, 0, 0, 0)),
                calcbutton('2', color = Color.fromARGB(255, 255, 255, 255),
                    Color.fromARGB(255, 7, 7, 7)),
                calcbutton('3', color = Color.fromARGB(255, 255, 255, 255),
                    Color.fromARGB(255, 0, 0, 0)),
                calcbutton('+', color = Color.fromARGB(255, 255, 255, 255),
                    Colors.black),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                //this is button Zero
                RaisedButton(
                  padding: const EdgeInsets.fromLTRB(34, 20, 128, 20),
                  onPressed: () {
                    calculation('0');
                  },
                  child: const Text(
                    '0',
                    style: TextStyle(
                        fontSize: 35, color: Color.fromARGB(255, 0, 0, 0)),
                  ),
                  color: color = Color.fromARGB(255, 252, 252, 252),
                ),
                calcbutton('.', color = Color.fromARGB(255, 255, 255, 255),
                    Color.fromARGB(255, 0, 0, 0)),
                calcbutton('=', color = Color.fromARGB(255, 255, 255, 255),
                    Colors.black),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }

  //Calculator logic
  dynamic text = '0';
  double numOne = 0;
  double numTwo = 0;

  dynamic result = '';
  dynamic finalResult = '';
  dynamic opr = '';
  dynamic preOpr = '';
  void calculation(btnText) {
    if (btnText == 'AC') {
      text = '0';
      numOne = 0;
      numTwo = 0;
      result = '';
      finalResult = '0';
      opr = '';
      preOpr = '';
    } else if (opr == '=' && btnText == '=') {
      if (preOpr == '+') {
        finalResult = add();
      } else if (preOpr == '-') {
        finalResult = sub();
      } else if (preOpr == 'x') {
        finalResult = mul();
      } else if (preOpr == '/') {
        finalResult = div();
      }
    } else if (btnText == '=' ||
        btnText == '+' ||
        btnText == '-' ||
        btnText == 'x' ||
        btnText == '/') {
      if (numOne == 0) {
        numOne = double.parse(result);
      } else {
        numTwo = double.parse(result);
      }

      if (opr == '+') {
        finalResult = add();
      } else if (opr == '-') {
        finalResult = sub();
      } else if (opr == 'x') {
        finalResult = mul();
      } else if (opr == '/') {
        finalResult = div();
      }
      preOpr = opr;
      opr = btnText;
      result = '';
    } else if (btnText == '%') {
      result = numOne / 100;
      finalResult = doesContainDecimal(result);
    } else if (btnText == '.') {
      if (!result.toString().contains('.')) {
        result = result.toString() + '.';
      }
      finalResult = result;
    } else if (btnText == '+/-') {
      result.toString().startsWith('-')
          ? result = result.toString().substring(1)
          : result = '-' + result.toString();
      finalResult = result;
    } else {
      result = result + btnText;
      finalResult = result;
    }

    setState(() {
      text = finalResult;
    });
  }

  String add() {
    result = (numOne + numTwo).toString();
    numOne = double.parse(result);
    return doesContainDecimal(result);
  }

  String sub() {
    result = (numOne - numTwo).toString();
    numOne = double.parse(result);
    return doesContainDecimal(result);
  }

  String mul() {
    result = (numOne * numTwo).toString();
    numOne = double.parse(result);
    return doesContainDecimal(result);
  }

  String div() {
    result = (numOne / numTwo).toString();
    numOne = double.parse(result);
    return doesContainDecimal(result);
  }

  String doesContainDecimal(dynamic result) {
    if (result.toString().contains('.')) {
      List<String> splitDecimal = result.toString().split('.');
      if (!(int.parse(splitDecimal[1]) > 0)) {
        return result = splitDecimal[0].toString();
      }
    }
    return result;
  }
}
