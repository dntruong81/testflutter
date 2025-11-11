import 'package:flutter/material.dart';

class TestNavigator extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return (TestNavigatorState());
  }
}

class TestNavigatorState extends State<TestNavigator> {
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
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SeconDisplay_1()),
                );
              },
              icon: Icon(Icons.navigate_next),
              label: Text('Trang kế tiếp 1'),
            ),
            SizedBox(height: 100,),
            TextButton.icon(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SeconDisplay_2()),
                );
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
        title: Text('Man hinh 1'),
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
        title: Text('Man hinh 2'),
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
