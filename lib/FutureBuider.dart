import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return (MaterialApp(
      home: MyHomePage(),
    ));
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MyHomePageState();
  }
}

class MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return (Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('Test Future Builder'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //
            FutureBuilder(
                future: makeOrderMessage(),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting)
                    return CircularProgressIndicator();
                  if (snapshot.hasData)
                    return Text('Gia tri nhan: ${snapshot.data}');
                  return Container();
                })
            //
          ],
        ),
      ),
    ));
  }
}

Future<String> getUserOder() {
  return (Future.delayed(Duration(seconds: 20), () => 'Ket qua tra ve cua ham'));
}

Future<String> makeOrderMessage() async {
  return await getUserOder();
}
