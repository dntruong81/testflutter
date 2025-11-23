import 'package:flutter/material.dart';

class MyCheckbox extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MyCheckboxState();
  }
}

class MyCheckboxState extends State<MyCheckbox> {
  bool? giatri1 = false;
  bool? giatri2 = false;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
                Text('Checkbox Demo'),
              Checkbox(value: giatri1,
                  checkColor: Colors.greenAccent,
                  activeColor: Colors.red,
                  onChanged: (value){
                  setState(() {
                    giatri1 = value;
                });
              }),
              Checkbox(value: giatri2,
                  checkColor: Colors.greenAccent,
                  activeColor: Colors.blue,
                  onChanged: (value){
                    setState(() {
                      giatri2 = value;
                    });
                  })
            ],
          )
      ),
    );
  }
}
