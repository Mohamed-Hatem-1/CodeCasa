import 'package:calculator/components/Button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  String currentInput = '';
  String previousInput = '';
  String operator = '';
  bool isDecimalEntered = false;
  String output = '';

  void handleNumberClick(String number) {
    if (currentInput.isEmpty) {
      currentInput = number;
    } else {
      currentInput += number;
    }
    output += currentInput;
    setState(() {});
  }

  void handleOperatorClick(String newOperator) {
    if (previousInput.isNotEmpty) {
      calculate();
    }
    operator = newOperator;
    previousInput = currentInput;
    currentInput = '';
    setState(() {});
  }

  void clear() {
    currentInput = '';
    previousInput = '';
    operator = '';
    setState(() {});
  }

  void calculate() {
    double result = 0.0;
    double num1 = double.parse(previousInput);
    double num2 = double.parse(currentInput);

    switch (operator) {
      case '+':
        result = num1 + num2;
        break;
      case '-':
        result = num1 - num2;
        break;
      case '*':
        result = num1 * num2;
        break;
      case '/':
        if (num2 != 0) {
          result = num1 / num2;
        } else {
          currentInput = 'Error';
          previousInput = '';
          operator = '';
          setState(() {});
          return;
        }
        break;
      case '%':
        result = num1 % num2;
        break;
    }

    currentInput = result.toString();
    previousInput = '';
    operator = '';
    setState(() {});
  }

  void handlePlusMinus() {
    if (currentInput.isNotEmpty) {
      if (currentInput.startsWith('-')) {
        currentInput = currentInput.substring(1);
      } else {
        currentInput = '-$currentInput';
      }
      setState(() {});
    }
  }

  void handleBackspace() {
    if (currentInput.isNotEmpty) {
      currentInput = currentInput.substring(0, currentInput.length - 1);
      setState(() {});
    }
  }

  void handleDecimal() {
    if (!isDecimalEntered) {
      if (!currentInput.contains('.')) {
        currentInput += '.';
      }
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF1F2F3),
      appBar: AppBar(
        backgroundColor: const Color(0xffF1F2F3),
        elevation: 0,
      ),
      body: Column(
        children: [
          Container(
            alignment: Alignment.centerRight,
            height: 150,
            child: Text(
              previousInput + operator + currentInput,
              style: const TextStyle(fontSize: 48, color: Colors.grey),
            ),
          ),
          Container(
            alignment: Alignment.centerRight,
            height: 150,
            child: Text(
              currentInput,
              style: const TextStyle(fontSize: 64),
            ),
          ),
          const Divider(
            indent: 20,
            endIndent: 20,
            color: Colors.grey,
          ),
          Expanded(
            child: Container(
              color: const Color(0xffF1F2F3),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Button(
                        item: 'C',
                        buttonColor: const Color(0xffD2D3DA),
                        onPressed: clear,
                      ),
                      Button(
                          icon: const Icon(Icons.backspace,
                              color: Colors.black, size: 28),
                          buttonColor: const Color(0xffD2D3DA),
                          onPressed: handleBackspace),
                      Button(
                        item: '%',
                        buttonColor: const Color(0xffD2D3DA),
                        onPressed: () => handleOperatorClick('%'),
                      ),
                      Button(
                          icon: const Icon(CupertinoIcons.divide),
                          buttonColor: Colors.blue,
                          onPressed: () => handleOperatorClick('/')),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Button(
                          item: '7', onPressed: () => handleNumberClick('7')),
                      Button(
                          item: '8', onPressed: () => handleNumberClick('8')),
                      Button(
                          item: '9', onPressed: () => handleNumberClick('9')),
                      Button(
                        icon: const Icon(Icons.close),
                        buttonColor: Colors.blue,
                        onPressed: () => handleOperatorClick('*'),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Button(
                          item: '4', onPressed: () => handleNumberClick('4')),
                      Button(
                          item: '5', onPressed: () => handleNumberClick('5')),
                      Button(
                          item: '6', onPressed: () => handleNumberClick('6')),
                      Button(
                          item: '-',
                          buttonColor: Colors.blue,
                          onPressed: () => handleOperatorClick('-')),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Button(
                          item: '1', onPressed: () => handleNumberClick('1')),
                      Button(
                          item: '2', onPressed: () => handleNumberClick('2')),
                      Button(
                          item: '3', onPressed: () => handleNumberClick('3')),
                      Button(
                          item: '+',
                          buttonColor: Colors.blue,
                          onPressed: () => handleOperatorClick('+')),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Button(
                          item: '0', onPressed: () => handleNumberClick('0')),
                      Button(item: '.', onPressed: handleDecimal),
                      Button(
                        item: '+/-',
                        onPressed: handlePlusMinus,
                      ),
                      Button(
                        item: '=',
                        buttonColor: Colors.blue,
                        onPressed: calculate,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
