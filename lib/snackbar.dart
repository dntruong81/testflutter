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
        actions: [
          IconButton(
            icon: Icon(Icons.search), // Biểu tượng tìm kiếm
            onPressed: () {
              // Xử lý khi nhấn nút tìm kiếm
              print('Đã nhấn tìm kiếm');
            },
          ),
          IconButton(
            icon: Icon(Icons.notifications), // Biểu tượng thông báo
            onPressed: () {
              // Xử lý khi nhấn nút thông báo
              print('Đã nhấn thông báo');
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Xin chào thế giới!',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            Text('Test Snackbar'),
            ElevatedButton(
                onPressed: (){
                  var  mySnackbarContent  = SnackBar(content: Text('Hello 16DTH01'));
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