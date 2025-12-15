import 'package:flutter/material.dart';
void main(){
  runApp(MyApp ());
}
class MyApp  extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: MyHomepage(isLoading: false, counter: 0,),
    );
  }
}
class MyHomepage extends StatefulWidget{
  final int counter;
  final bool isLoading;
  MyHomepage({required this.counter, required this.isLoading});
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return (MyHomepageStage());
  }
}
class MyHomepageStage  extends State<MyHomepage> {
  late int _counter;
  late bool _isLoading;
  @override
  void initState() {
    super.initState();
    _counter = widget.counter;
    _isLoading = widget.isLoading;
  }
  @override
  Widget build(BuildContext context) {
    print ('build MyHomePage');
    // TODO: implement build
    return Scaffold(
      body: MyCenterWidget(counter: _counter, isLoading: _isLoading),
      floatingActionButton: FloatingActionButton(onPressed: ButtonClicked,child: Text('Click'),),
    );
  }
  void ButtonClicked(){
    setState(() {
      _counter++;
      if (_counter % 2 == 0) _isLoading = false;
      else _isLoading = true;
    });
  }
}

class MyCenterWidget  extends StatelessWidget{
  final int counter;
  final bool isLoading;
  MyCenterWidget({required this.counter, required this.isLoading});
  @override
  Widget build(BuildContext context) {
    print ('build MyCenterWidget');
    // TODO: implement build

    return Center(
      child: CounterWidget(counter:counter , isLoading: isLoading) ,
    );

  }
}
class CounterWidget extends StatelessWidget {
  final int counter;
  final bool isLoading;
  CounterWidget({required this.isLoading, required this.counter});
  @override
  Widget build(BuildContext context) {
    print ('build CounterWidget');
    // TODO: implement build
    return isLoading? CircularProgressIndicator(): Text('$counter');
  }
}