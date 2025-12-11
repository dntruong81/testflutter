import 'package:flutter/material.dart';

class MyRadio extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MyRadioState();
  }
}

class MyRadioState extends State<MyRadio> {
  int? _gioitinh = 1; //Nam = 0,Nữ = 1
  int? _gioitinh2 = 1; //Nam = 0,Nữ = 1
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Demo Radio Button'),
            ListTile(
              title: Text('Nam'),
              leading: Radio(value: 0,groupValue: _gioitinh, onChanged: (newValue){
                setState(() {
                  _gioitinh = newValue;
                });
              },)
            ),
            ListTile(
                title: Text('Nữ'),
                leading: Radio(value: 1,groupValue: _gioitinh, onChanged: (newValue){
                  setState(() {
                    _gioitinh = newValue;
                  });
                },)
            ),
            Text('Demo Radio List Title '),
            RadioListTile(
              title: Text('Nam'),
              value: 0,
              groupValue: _gioitinh2,
              onChanged: (newvalue){
               setState(() {
                 _gioitinh2 = newvalue;
               });
              },
            ),
            RadioListTile(
              title: Text('Nữ'),
              value: 1,
              groupValue: _gioitinh2,
              onChanged: (newvalue){
                setState(() {
                  _gioitinh2 = newvalue;
                });

              },
            ),
          ],
        )
      ),
    );
  }
}
