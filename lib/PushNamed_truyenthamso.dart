import 'package:flutter/material.dart';

import 'main.dart';

//Tao lop de truyen doi tuong
class Student{
  String hovaten = '';
  String mssv = '';
  Student(this.hovaten, this.mssv);
}

//Tao lop Routs cho de qua ly cac man hinh
class Routs{
 static  String Screen_1 = '/SeconDisplay_1';
 static String Screen_2 = '/SeconDisplay_2';
}

void main(){
  runApp(MyApp_1());
}

class MyApp_1  extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      routes: {
        '/SeconDisplay_1':(context) => SeconDisplay_1(),
        '/SeconDisplay_2':(context) => SeconDisplay_2()
      },
      home: TestPushNamed(),
    );
  }
}

class TestPushNamed extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return (TestPushNamedState());
  }
}

class TestPushNamedState extends State<TestPushNamed> {
  String data1 = 'Doan Nhut Truong';
  Student data2 = Student('Doan Nhut Truong','1990784');
  String _getValue ='';
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return (Scaffold(
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 100),
            TextButton.icon(
              onPressed: ()  async {
                _getValue = await Navigator.pushNamed(context, Routs.Screen_1,arguments: data1) as String;
                setState(() {
                  _getValue;
                });
              },
              icon: Icon(Icons.navigate_next),
              label: Text('Trang kế tiếp 1'),
            ),
            SizedBox(height: 100,),
            TextButton.icon(
              onPressed: () {
                Navigator.pushNamed(context, Routs.Screen_2,arguments: data2);
              },
              icon: Icon(Icons.navigate_next),
              label: Text('Trang kế tiếp 2'),
            ),
            Text('Gia tri nhan ve: $_getValue'),
          ],
        ),
      ),
    ));
  }
}

class SeconDisplay_1 extends StatelessWidget {
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var _args = ModalRoute.of(context)!.settings.arguments as String;
    // TODO: implement build
    return (Scaffold(
      appBar: AppBar(
        title: Text('Man hinh 1 pushNamed'),
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 100),
            Text('Nha gia tri truyen qua: $_args'),
            TextField(
              controller: controller,
              decoration: InputDecoration(hintText: 'Nhập họ và tên'),
            ),
            IconButton(onPressed: () {
              Navigator.pop(context,controller.text);
            }, icon: Icon(Icons.arrow_back)),
          ],
        ),
      ),
    ));
  }
}

class SeconDisplay_2 extends StatelessWidget {
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var _args = ModalRoute.of(context)!.settings.arguments as Student;
    // TODO: implement build
    return (Scaffold(
      appBar: AppBar(
        title: Text('Man hinh 2 pushNamed'),
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 100),
            Text('Nha gia tri truyen qua: ${_args.hovaten} ${_args.mssv}'),
            TextField(
              controller: controller,
              decoration: InputDecoration(hintText: 'Nhập họ và tên'),
            ),
            IconButton(onPressed: () {
              Navigator.pop(context);
            }, icon: Icon(Icons.arrow_back)),
          ],
        ),
      ),
    ));
  }
}
