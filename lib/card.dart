import 'package:flutter/material.dart';

class MyCard extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MyCartState();
  }
}

class MyCartState extends State<MyCard> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 50),
          InkWell(
            child: Card(child: Text('Danh thiep 1')),
            onTap: () {
              var  mySnackbarContent  = SnackBar(content: Text('Hello 16DTH01'));
              ScaffoldMessenger.of(context).showSnackBar(mySnackbarContent);
            },
          ),
        ],
      ),
    );
  }
}
