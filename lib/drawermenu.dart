import 'package:flutter/material.dart';

class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext ctxt) {
    return Scaffold(
      appBar: AppBar(title: Text("First Page"),),
      body: Center(child: Text("I belongs to First Page"),) ,
    );
  }
}

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext ctxt) {
    return Scaffold(
      appBar: AppBar(title: Text("Second Page"),),
      body: Center(child: Text("I belongs to Second Page"),) ,
    );
  }
}

class MyDrawerMenu extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MyDrawerMenuState();
  }
}

class MyDrawerMenuState extends State<MyDrawerMenu> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        drawer: Drawer(
            child: ListView(
              children: [
                DrawerHeader(
                  child: Text("DRAWER HEADER.."),
                  decoration: BoxDecoration(
                      color: Colors.orange
                  ),
                ),
                ListTile(
                  title: Text("Item => 1"),
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(
                        builder: (context) => FirstPage()));
                  },
                ),
                ListTile(
                  title: Text("Item => 2"),
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(
                        builder: (context) => SecondPage()));
                  },
                ),
              ],
            )
        ),
            appBar: AppBar(title: Text('Drawer Menu Demo')),
            body: Center(child: Text("Drawer Body"
    )
    )
    ,
    );
  }
}
