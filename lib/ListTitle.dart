import 'package:flutter/material.dart';

class MyListTitle extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MyListTitleState();
  }
}

class MyListTitleState extends State<MyListTitle> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Card(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ListTile(
              leading: Icon(Icons.person),
              title: Text('Ten nguoi dung'),
              subtitle: Text('Thong tin bo sung'),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: (){
                var  mySnackbarContent  = SnackBar(content: Text('Xin chao lop 16DTH1'));
                ScaffoldMessenger.of(context).showSnackBar(mySnackbarContent);
              },
            ),
          ],
        ),
      ),
    );
  }
}
