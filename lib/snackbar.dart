import 'package:flutter/material.dart';
class MySnackBar extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MySnackBarState();
  }

}

class MySnackBarState extends State<MySnackBar>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Test Snackbar'),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Test Snackbar'),
            ElevatedButton(
                onPressed: (){
                  var  mySnackbarContent  = SnackBar(content: Text('Xin chao lop 16DTH'));
                  ScaffoldMessenger.of(context).showSnackBar(mySnackbarContent);
                },
                child: Text('Show Snackbar'))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add_call),
          onPressed: (){
          var  mySnackbarContent  = SnackBar(content: Text('floatingActionButton'));
          ScaffoldMessenger.of(context).showSnackBar(mySnackbarContent);
          }
      ),
    );

  }
}