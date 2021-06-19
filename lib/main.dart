import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(title: 'CALCULATOR'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String output = "0";

  String output_ = "0"; //psuedo output
  double num1 = 0.0;
  double num2 = 0.0;
  String operand = "";

  Widget buttonPressed(String num) {
    if (num == "CLEAR") {
      output_ = "0";
      num1 = 0.0;
      num2 = 0.0;
      operand = "";
    } else if (num == "+" || num == "-" || num == "X" || num == "/") {
      num1 = double.parse(output);
      output_ = "";
      operand = num;
    } else if (num == ".") {
      if (output_.contains(".")) {
        print("Already present");
      } else {
        output_ = output_ + num;
      }
    } else if (num == "=") {
      num2 = double.parse(output);

      if (operand == "+") {
        output_ = (num1 + num2).toString();
      }
      if (operand == "-") {
        output_ = (num1 - num2).toString();
      }
      if (operand == "X") {
        output_ = (num1 * num2).toString();
      }
      if (operand == "/") {
        output_ = (num1 / num2).toString();
      }

      num1 = 0.0;
      num2 = 0.0;
      operand = "";
    } else {
      output_ = output_ + num;
    }
    print(output_);
    setState(() {
      output = double.parse(output_).toStringAsFixed(2);
    });
  }

  Widget buildButton(String num) {
    return new Expanded(
      child: Material(
        elevation: 18.0,
        color: Colors.blueGrey[700],
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          side: BorderSide(color: Colors.white, width: 2),
        ),
        child: new OutlinedButton(
          child: Padding(
            child: new Text(
              num,
              style: TextStyle(
                color: Colors.white,
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            padding: EdgeInsets.all(21.0),
          ),
          onPressed: () => buttonPressed(num),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          backgroundColor: Colors.blueGrey[700],
          leading: Icon(Icons.calculate),
        ),
        body: new Container(
          child: new Column(
            children: <Widget>[
              new Container(
                alignment: Alignment.centerRight,
                child: new Text(
                  output,
                  style: TextStyle(fontSize: 40.0, fontWeight: FontWeight.bold),
                ),
                padding: EdgeInsets.all(24.0),
              ),
              new Expanded(
                child: new Divider(),
              ),
              new Column(
                children: [
                  new Row(
                    children: [
                      buildButton("7"),
                      buildButton("8"),
                      buildButton("9"),
                      buildButton("/"),
                    ],
                  ),
                  new Row(
                    children: [
                      buildButton("4"),
                      buildButton("5"),
                      buildButton("6"),
                      buildButton("X"),
                    ],
                  ),
                  new Row(
                    children: [
                      buildButton("1"),
                      buildButton("2"),
                      buildButton("3"),
                      buildButton("-"),
                    ],
                  ),
                  new Row(
                    children: [
                      buildButton("."),
                      buildButton("0"),
                      buildButton("00"),
                      buildButton("+"),
                    ],
                  ),
                  new Row(
                    children: [
                      buildButton("CLEAR"),
                      buildButton("="),
                    ],
                  ),
                ],
              )
            ],
          ),
        ));
  }
}
