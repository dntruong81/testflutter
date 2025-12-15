import 'package:flutter/material.dart';

void main(){
  runApp(MyApp());
}

class MyApp  extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return(
        Scaffold(
          body: Center(
            child: ElevatedButton(onPressed: (){
              Scaffold.of(context).showBottomSheet((BuildContext context) => Text('Hello'));
            }, child: Text('+')),
          ),
        )
    );
  }
}