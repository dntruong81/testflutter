import 'package:flutter/material.dart';
class TestListView extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return TestListViewState();
  }
}

class TestListViewState extends State <TestListView> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Vi du ListView'),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Column(
          children: [
          Flexible(
            child: ListView.builder(
                itemCount: 5,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      title: Text('Muc số $index'),
                      leading: Icon(Icons.add),
                      trailing: Icon(Icons.access_time),
                      onTap: () {
                        var  mySnackbarContent  = SnackBar(content: Text('Bạn đã chọn mục $index'));
                        ScaffoldMessenger.of(context).showSnackBar(mySnackbarContent);
                      },
                    ),
                  );
                },
                shrinkWrap: true,
              ),
          ),
            //Listview có phân cách
            Flexible(
              child: ListView.separated(
                itemCount: 5,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(' Listview có ngăn dòng số $index'),
                    leading: Icon(Icons.star),
                    trailing: Icon(Icons.arrow_forward_ios),
                    onTap: () {
                      var  mySnackbarContent  = SnackBar(content: Text('Bạn đã chọn mục $index'));
                      ScaffoldMessenger.of(context).showSnackBar(mySnackbarContent);
                    },
                  );
                },
                separatorBuilder: (context, position) {
                  return Divider();
                },

                shrinkWrap: true,
              ),
            ),
          ],
        )
      ),
    );
  }
}