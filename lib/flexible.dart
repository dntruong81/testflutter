import 'package:flutter/material.dart';

class MyFlexible extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MyFlexibleState();
  }
}

class MyFlexibleState extends State<MyFlexible> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(child: Container(color: Colors.yellow),flex: 3,),
            Flexible(child: Container(color: Colors.green)),
            Flexible(child: Container(color: Colors.red))
          ],
        ),
      ),
    );
  }
}
