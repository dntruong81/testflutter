import 'package:flutter/material.dart';
import 'snackbar.dart';
import 'InkWell.dart';
import 'listview.dart';
import 'testfieldtext.dart';
import 'Navigator.dart';
import 'PushNamed_truyenthamso.dart';
import 'gridview.dart';
import 'card.dart';
import 'ListTitle.dart';
import 'flexible.dart';
import 'stack.dart';
import 'radiodemo.dart';
import 'checkbox.dart';
import 'drawermenu.dart';
import 'package:testflutter/MediaQuery.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: MyMediaQueryWidget() //MyHomePage(title: 'Ứng dụng 1'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int biendem = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme
            .of(context)
            .colorScheme
            .inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('So lan ban da bam vao: $biendem '),
            SizedBox(height: 10,),
            TextButton(onPressed: () {
             setState(() {
               biendem = biendem + 1;
             });
            }, child: Text('+1'))
          ],
        ),
      ),
    );
  }
}
