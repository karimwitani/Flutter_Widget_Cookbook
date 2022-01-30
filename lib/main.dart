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
      home: const MyHomePage13(),
    );
  }
}

//ShowSearch
class MyHomePage13 extends StatefulWidget {
  const MyHomePage13({Key? key}) : super(key: key);

  final title = 'FLUTTER MAP';
  @override
  _MyHomePage13State createState() => _MyHomePage13State();
}

class _MyHomePage13State extends State<MyHomePage13> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          IconButton(
              onPressed: () {
                showSearch(context: context,
                delegate: CustomSearchDelegate(),);
              },
              icon: const Icon(Icons.search),
          ),
        ],
      ),
    );
  }
}

class CustomSearchDelegate extends SearchDelegate {
  List<String> searchterms = [
    'Deadlift',
    'Shoulder Press',
    'Bench Press',
    'Row',
    'Hammer Curl',
    'Bicep Curl',
  ];

  @override
  List <Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: const Icon(Icons.clear),
      )
    ];
  }

  @override
  IconButton buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: const Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    List<String> matchQuery = [];
    for (var exercise in searchterms) {
      if (exercise.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(exercise);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        return ListTile(
          title: Text(result),
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> matchQuery = [];
    for (var exercise in searchterms) {
      if (query.toLowerCase() == ''){
        continue;
      }
      else if (exercise.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(exercise);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        return ListTile(
          title: Text(result),
        );
      },
    );
  }
}


// Fitted Box
class MyHomePage26 extends StatefulWidget {
  const MyHomePage26({Key? key}) : super(key: key);
  final title = 'FLUTTER MAP';

  @override
  _MyHomePage26State createState() => _MyHomePage26State();
}

class _MyHomePage26State extends State<MyHomePage26> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Container(
          width: 300,
          height: 150,
          color: Colors.red,
          padding: const EdgeInsets.all(10.0),
          child: const FittedBox(
            child: Text(
              'FLUTTER MAP',
              style: TextStyle(
                fontSize: 100,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
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
       title: const Text('Stepper'),
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
