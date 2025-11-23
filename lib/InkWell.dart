import 'package:flutter/material.dart';
class TestInkWell extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return TestInkWellState();
  }
  }

class TestInkWellState extends State <TestInkWell> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Center(
        child: InkWell(
          child: Text('InkWell Test'),
          onTap: (){
            var  mySnackbarContent  = SnackBar(content: Text('InkWell Test'));
            ScaffoldMessenger.of(context).showSnackBar(mySnackbarContent);
            }
        ),
      ),
    );
  }
}