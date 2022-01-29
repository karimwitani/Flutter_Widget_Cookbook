import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage10(),
    );
  }
}

// Fitter Box
class MyHomePage26 extends StatefulWidget {
  const MyHomePage26({Key? key}) : super(key: key);

  @override
  _MyHomePage26State createState() => _MyHomePage26State();
}

class _MyHomePage26State extends State<MyHomePage26> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}



//Stepper Class
class MyHomePage10 extends StatefulWidget {
  const MyHomePage10({Key? key}) : super(key: key);



  @override
  _MyHomePage10State createState() => _MyHomePage10State();
}

class _MyHomePage10State extends State<MyHomePage10> {
  int _currentStep = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
       title: Text('Stepper'),
      ),
      body: Center(
        child: Stepper(
          steps: const [
            Step(
                title: Text("Step 1"),
                content: Text("Information for Step 1")),
            Step(
                title: Text("Step 2"),
                content: Text("Information for Step 2")),
            Step(
                title: Text("Step 3"),
                content: Text("Information for Step 3")),
            Step(
                title: Text("Step 4"),
                content: Text("Information for Step 4")),
          ],
          onStepTapped: (int newIndex) {
            setState(() {
              _currentStep = newIndex;
            });
          },
          currentStep :  _currentStep,
          onStepContinue: () {
            if (_currentStep != 3) {
              setState(() {
                _currentStep += 1;
              });
            }
          },
          onStepCancel: () {
            if (_currentStep != 0) {
              setState(() {
                _currentStep -= 1;
              });
            }
          },
        ),
      ),
    );
  }
}
