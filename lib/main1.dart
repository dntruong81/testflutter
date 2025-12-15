import 'package:flutter/material.dart';
import 'snackbar.dart';
import 'card.dart';
import 'testfieldtext.dart';

void main() {
  runApp(MyApp1());
}

class MyApp1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(home: TestFieldText());
  }
}

class MyHomePage1 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MyHomePage1Sate();
  }
}

class MyHomePage1Sate extends State<MyHomePage1> {
  int dem = 0;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Text('text 1'),
            Text('text 2'),
            Text('text 3'),
            Text('text 4'),
        
          ],
        ),
      ),

    );
  }
}
