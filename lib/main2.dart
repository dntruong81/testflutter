import 'package:flutter/material.dart';

void main() {
  runApp(MyTestApp());
}

class MyTestApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: 'Flutter Demo',
      home: MyTestAppHomePage(title: 'Ung dung dau tien'),
    );
  }
}

class MyTestAppHomePage extends StatefulWidget {
  late String title;

  MyTestAppHomePage({required this.title});

  @override
  State<MyTestAppHomePage> createState() {
    // TODO: implement createState
    return (MyTestAppHomePageSate());
  }
}

class MyTestAppHomePageSate extends State<MyTestAppHomePage> {
  TextEditingController controller = TextEditingController();
  String? textTextField;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.search)),
          TextButton(onPressed: () {}, child: Text('Quay lai')),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 50,
              child: TextField(
                controller: controller,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Nhap thong tin',
                  hintText: 'Nhap thong tin',
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        textTextField = '';
                      });
                      ;
                      controller.clear();
                    },
                    icon: Icon(Icons.clear),
                  ),
                ),
                onChanged: (value) {
                  setState(() {
                    textTextField = value;
                  });
                },
              ),
            ),
            Text('Gia tri ban nhap vao  $textTextField'),
            Card(
              color: Colors.red,
              child: Padding(
                padding: EdgeInsets.all(20.0),
                child: Text('Lap trinh UD Mobile'),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
