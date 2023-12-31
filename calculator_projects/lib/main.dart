// ignore_for_file: use_key_in_widget_constructors, library_private_types_in_public_api, prefer_const_constructors, unused_local_variable

import 'package:calculator_project/color.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

void main() {
  runApp(CalculatorApp());
}

class CalculatorApp extends StatefulWidget {
  @override
  _CalculatorAppState createState() => _CalculatorAppState();
}

class _CalculatorAppState extends State<CalculatorApp> {
  double firstNumber = 0.0;
  double secondNumber = 0.0;
  var inputExpression = '';
  var outputResult = '';
  var operation = '';

  onButtonPressed(value) {
    if (value == 'C') {
      inputExpression = '';
      outputResult = '';
    } else if (value == '=') {
      if (inputExpression.isNotEmpty) {
        var userInput = inputExpression;
        userInput = inputExpression.replaceAll('x', '*');
        Parser parser = Parser();
        Expression expression = parser.parse(userInput);
        ContextModel contextModel = ContextModel();
        var finalValue = expression.evaluate(EvaluationType.REAL, contextModel);
        outputResult = finalValue.toString();
      }
    } else {
      inputExpression = inputExpression + value;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.black,
        body: Column(
          children: [
            Expanded(
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      inputExpression,
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 30),
                    Text(
                      outputResult,
                      style: TextStyle(
                        fontSize: 40,
                        color: Colors.white38,
                      ),
                    ),
                    SizedBox(height: 30),
                    MaterialButton(
                      onPressed: () {
                        if (inputExpression.isNotEmpty) {
                          inputExpression = inputExpression.substring(0, inputExpression.length - 1);
                        }
                      },
                      child: Icon(Icons.backspace_outlined, color: greenColor),
                    ),
                    Container(
                      child: Divider(),
                      padding: EdgeInsets.only(top: 5),
                    ),
                  ],
                ),
              ),
            ),
            Row(
              children: [
                button(text: 'C', textColor: Colors.red),
                button(text: '( )', textColor: greenColor),
                button(text: '%', textColor: greenColor),
                button(text: '/', textColor: greenColor),
              ],
            ),
            Row(
              children: [
                button(text: '7'),
                button(text: '8'),
                button(text: '9'),
                button(text: 'x', textColor: greenColor),
              ],
            ),
            Row(
              children: [
                button(text: '4'),
                button(text: '5'),
                button(text: '6'),
                button(text: '-', textColor: greenColor),
              ],
            ),
            Row(
              children: [
                button(text: '1'),
                button(text: '2'),
                button(text: '3'),
                button(text: '+', textColor: greenColor),
              ],
            ),
            Row(
              children: [
                button(text: '+/-'),
                button(text: '0'),
                button(text: '.'),
                button(text: '=', greyColor: Colors.green),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget button({
    text,
    textColor = Colors.white,
    greyColor = greyColor,
  }) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.all(8),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
            padding: EdgeInsets.all(22),
            backgroundColor: greyColor,
          ),
          onPressed: () => onButtonPressed(text),
          child: Text(
            text,
            style: TextStyle(
              color: textColor,
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
