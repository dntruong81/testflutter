import 'package:flutter/material.dart';

class  MyMediaQueryWidget  extends  StatelessWidget  {
  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    var screenWidth = mediaQuery.size.width;
    var screenHeight = mediaQuery.size.height;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('Test MediaQuery'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Chieu rong thiet bi: $screenWidth pixel'),
          Text('Chieu cao thiet bi: $screenHeight pixel')
        ],
      ),
    );
  }
}