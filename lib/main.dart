import 'package:flutter/material.dart';

void main() => runApp(Myapp());

class Myapp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Calculator(),
    );
  }
}

class Calculator extends StatefulWidget {
  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  Widget calcbutton(String btntxt, Color btncolor, Color txtcolor) {
    return Container(
      child: RaisedButton(
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
        shape: CircleBorder(),
        color: btncolor,
        padding: EdgeInsets.all(20),
      ),
    );
  }

  Widget calcbutton0(String btntxt, Color btncolor, Color txtcolor) {
    return Container(
      child: RaisedButton(
        padding: EdgeInsets.fromLTRB(34, 20, 128, 20),
        onPressed: () {
          calculation(btntxt);
        },
        shape: StadiumBorder(),
        child: Text(
          btntxt,
          style: TextStyle(
            fontSize: 35,
            color: txtcolor,
          ),
        ),
        color: Color.fromARGB(255, 66, 66, 66),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text("Calculator"),
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            //calculator main display
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text(
                    text,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 100,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                //button functions are called here as some arguments are passed
                calcbutton("AC", Colors.grey, Colors.black),
                calcbutton("???/???", Colors.grey, Colors.black),
                calcbutton("%", Colors.grey, Colors.black),
                calcbutton("??", Color.fromARGB(255, 255, 160, 0), Colors.white),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            //copy row code

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                //button functions are called here as some arguments are passed
                calcbutton("7", Color.fromARGB(255, 66, 66, 66), Colors.white),
                calcbutton("8", Color.fromARGB(255, 66, 66, 66), Colors.white),
                calcbutton("9", Color.fromARGB(255, 66, 66, 66),
                    Color.fromRGBO(255, 255, 255, 1)),
                calcbutton("x", Color.fromARGB(255, 255, 160, 0), Colors.white),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                //button functions are called here as some arguments are passed
                calcbutton("4", Color.fromARGB(255, 66, 66, 66), Colors.white),
                calcbutton("5", Color.fromARGB(255, 66, 66, 66), Colors.white),
                calcbutton("6", Color.fromARGB(255, 66, 66, 66), Colors.white),
                calcbutton("-", Color.fromARGB(255, 255, 160, 0), Colors.white),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                //button functions are called here as some arguments are passed
                calcbutton("1", Color.fromARGB(255, 66, 66, 66), Colors.white),
                calcbutton("2", Color.fromARGB(255, 66, 66, 66), Colors.white),
                calcbutton("3", Color.fromARGB(255, 66, 66, 66), Colors.white),
                calcbutton("+", Color.fromARGB(255, 255, 160, 0), Colors.white),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            //last row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                calcbutton0("0", Color.fromARGB(255, 66, 66, 66), Colors.white),
                calcbutton(".", Color.fromARGB(255, 66, 66, 66), Colors.white),
                calcbutton("=", Color.fromARGB(255, 255, 160, 0), Colors.white),
              ],
            )
          ],
        ),
      ),
    );
  }

  //logical section of calculator
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
      } else if (preOpr == '??') {
        finalResult = div();
      }
    } else if (btnText == '+' ||
        btnText == '-' ||
        btnText == 'x' ||
        btnText == '??' ||
        btnText == '=') {
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
      } else if (opr == '??') {
        finalResult = div();
      }
      preOpr = opr;
      opr = btnText;
      result = '';
    } else if (btnText == '??') {
      result = numOne / 100;
      finalResult = doesContainDecimal(result);
    } else if (btnText == '.') {
      if (!result.toString().contains('.')) {
        result = result.toString() + '.';
      }
      finalResult = result;
    } else if (btnText == '???/???') {
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
      if (!(int.parse(splitDecimal[1]) > 0))
        return result = splitDecimal[0].toString();
    }
    return result;
  }
}
