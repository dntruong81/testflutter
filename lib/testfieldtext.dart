import 'package:flutter/material.dart';

class TestFieldText extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return TestFieldTextState();
  }
}

class TestFieldTextState extends State<TestFieldText> {
  final TextEditingController _controler = TextEditingController();
  String noidungnhap = '';
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Container(
        margin: EdgeInsets.all(10.0),
        child: Column(
          children: [
            SizedBox(height: 100),
            TextField(
              controller: _controler,
              style: TextStyle(fontFamily: 'Roboto'),
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Nhap ho va ten',
                labelText: 'Nhap thong tin',
                prefixIcon: Icon(Icons.add_call),
              ),
            ),
            TextButton(onPressed: (){
              setState(() {
                noidungnhap = _controler.text;
              });
            }, child: Text('Lay thong tin vua nhap')),
            SizedBox(height: 50,),
            Text('Noi dung vua nhap vao:  $noidungnhap')
          ],
        ),
      ),
    );
  }
}
