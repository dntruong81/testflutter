import 'package:flutter/material.dart';

class TestNavigator extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return (TestNavigatorState());
  }
}

class TestNavigatorState extends State<TestNavigator> {

  String hoten_1 = ''; //Đặt trên hàm build để nhận giá trị trả về

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return (Scaffold(
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 100),
            TextButton.icon(
              onPressed: () async {
                hoten_1 = await Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SeconDisplay_1()),
                ) as String;
                setState(() {
                  hoten_1;
                });
              },
              icon: Icon(Icons.navigate_next),
              label: Text('Chuyển sang màn hình 1'),
            ),
            SizedBox(height: 20),
            TextButton.icon(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SeconDisplay_2()),
                );
              },
              icon: Icon(Icons.navigate_next),
              label: Text('Chuyển sang màn hình 2'),
            ),
            Text('Gia tri nhan ve: $hoten_1'),
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
      appBar: AppBar(title: Text('Màn hình 1')),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 100),
            TextField(
              controller: controller,
              decoration: InputDecoration(hintText: 'Nhập họ và tên'),
            ),
            IconButton(
              onPressed: () {
                Navigator.pop(context, controller.text);
              },
              icon: Icon(Icons.arrow_back),
            ),
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
      appBar: AppBar(title: Text('Man hinh 2')),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 100),
            TextField(
              controller: controller,
              decoration: InputDecoration(hintText: 'Nhập họ và tên'),
            ),
          ],
        ),
      ),
    ));
  }
}
