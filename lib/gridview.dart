import 'package:flutter/material.dart';

class TestGridView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return TestGridViewState();
  }
}

class TestGridViewState extends State<TestGridView> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Vi du GridView'),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 200,
              width: 200,
              child: GridView.count(crossAxisCount: 2,
                children: [
                  Container(color: Colors.blue,child: Image.asset('assets/trolaitruonghoc_1.png')),
                  Container(color: Colors.blue,child: Image.asset('images/trolaitruonghoc_2.png')),
                  Container(color: Colors.amber),
                  Container(color: Colors.blue)
                ]
              ),
            ),
            SizedBox(height: 20),
            //GridView.builder
            SizedBox(
              height: 200,
              width: 200,
              child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                  ),
                  itemCount: 10,
                  itemBuilder: (context,index){
                    return Container(
                      color: Colors.primaries[index % Colors.primaries.length],
                      child: Text('item: $index'),
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}
