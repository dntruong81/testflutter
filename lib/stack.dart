import 'package:flutter/material.dart';

class MyStack extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MyStackState();
  }
}

class MyStackState extends State<MyStack> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Center(
        child: Stack(
          alignment: AlignmentDirectional.topStart,
          clipBehavior: Clip.none, //Phần tràn ra vẫn thấy
          children: [
            Container(width: 200, height: 200, color: Colors.red),
            Container(width: 180, height: 180, color: Colors.yellow),
            Positioned(
              left: -20,
              bottom: -50,
              child: Container(width: 160, height: 160, color: Colors.green),
            ),
          ],
        ),
      ),
    );
  }
}
