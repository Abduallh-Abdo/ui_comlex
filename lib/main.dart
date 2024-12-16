import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: UI(),
    );
  }
}

class UI extends StatefulWidget {
  const UI({super.key});

  @override
  State<UI> createState() => _UIState();
}

class _UIState extends State<UI> {
  var num1Controller = TextEditingController();
  var num2Controller = TextEditingController();
  double result = 0;
  dynamic sum(double num1, double num2) {
    return num1 + num2;
  }

  dynamic mins(double num1, double num2) {
    return num1 - num2;
  }

  dynamic muiltuply(double num1, double num2) {
    return num1 * num2;
  }

  dynamic divition(double num1, double num2) {
    if (num2 == 0) {
      return 0;
    } else {
      return num1 / num2;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true, // Adjusts UI to prevent keyboard overlap

      body: Stack(
        children: [
          Center(
            child: Container(
              height: 20,
              width: double.infinity,
              color: Colors.teal,
            ),
          ),
          Column(
            children: [
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(30),
                  decoration: const BoxDecoration(
                    color: Colors.teal,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30),
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextFormField(
                        controller: num1Controller,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          hintText: 'Num 1',
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.black,
                              width: 2,
                            ),
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        controller: num2Controller,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          hintText: 'Num 2',
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.black,
                              width: 2,
                            ),
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                alignment: Alignment.center,
                width: 320,
                height: 150,
                color: Colors.white,
                child: Text(
                  'Result = ${result.toStringAsFixed(2)}',
                  style: const TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.teal,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      FloatingActionButton(
                        onPressed: () {
                          setState(() {
                            result = sum(
                              double.parse(num1Controller.text),
                              double.parse(num2Controller.text),
                            );
                          });
                        },
                        child: const Text(
                          '+',
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ),
                      FloatingActionButton(
                        onPressed: () {
                          setState(() {
                            result = mins(
                              double.parse(num1Controller.text),
                              double.parse(num2Controller.text),
                            );
                          });
                        },
                        child: const Text(
                          '-',
                          style: TextStyle(
                            fontSize: 35,
                          ),
                        ),
                      ),
                      FloatingActionButton(
                        onPressed: () {
                          setState(() {
                            result = muiltuply(
                              double.parse(num1Controller.text),
                              double.parse(num2Controller.text),
                            );
                          });
                        },
                        child: const Text(
                          'x',
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ),
                      FloatingActionButton(
                        onPressed: () {
                          setState(() {
                            result = divition(
                              double.parse(num1Controller.text),
                              double.parse(num2Controller.text),
                            );
                          });
                        },
                        child: const Text(
                          '/',
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
