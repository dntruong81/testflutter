import 'package:flutter/material.dart';

import 'main.dart';

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
      onGenerateRoute: (settings){
        if (settings.name == Routs.Screen_1)
          return MaterialPageRoute(settings:settings , builder: ((context) => SeconDisplay_1()));
        else if (settings.name == Routs.Screen_2)
          return MaterialPageRoute(settings:settings , builder: ((context) => SeconDisplay_2()));

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
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return (Scaffold(
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 100),
            TextButton.icon(
              onPressed: () {
                Navigator.pushNamed(context, Routs.Screen_1);
              },
              icon: Icon(Icons.navigate_next),
              label: Text('Trang kế tiếp 1'),
            ),
            SizedBox(height: 100,),
            TextButton.icon(
              onPressed: () {
                Navigator.pushNamed(context, Routs.Screen_2);
              },
              icon: Icon(Icons.navigate_next),
              label: Text('Trang kế tiếp 2'),
            ),
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
    // TODO: implement build
    return (Scaffold(
      appBar: AppBar(
        title: Text('onGenerateRoute_1'),
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 100),
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

class SeconDisplay_2 extends StatelessWidget {
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return (Scaffold(
      appBar: AppBar(
        title: Text('onGenerateRoute_2'),
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 100),
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
