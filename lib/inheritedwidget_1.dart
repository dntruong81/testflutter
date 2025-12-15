import 'package:flutter/material.dart';
//import 'package:testflutter/truyenthamsochaxuongcon.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(home: MyHomepage(isLoading: false, counter: 0));
  }
}

class MyHomepage extends StatefulWidget {
  final int counter;
  final bool isLoading;

  MyHomepage({required this.counter, required this.isLoading});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return (MyHomepageStage());
  }
}

class MyHomepageStage extends State<MyHomepage> {
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
    // TODO: implement build
    print('build MyHomepage');
    return Scaffold(
      body: MyInheritedWidget(
        counter: _counter,
        isLoading: _isLoading,
        con: MyCenterWidget(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: ButtonClicked,
        child: Text('Click'),
      ),
    );
  }

  void ButtonClicked() {
    setState(() {
      _counter++;
      if (_counter % 2 == 0)
        _isLoading = false;
      else
        _isLoading = true;
    });
  }
}

class MyCenterWidget extends StatelessWidget {
  //final int counter;
  //final bool isLoading;
  //MyCenterWidget({required this.counter, required this.isLoading});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    print('build MyCenterWidget');
    return (Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [MyCounterWidget()],
      ),
    ));
  }
}

class MyCounterWidget extends StatelessWidget {
  //final int counter;
  //final bool isLoading;
  //CounterWidget({required this.isLoading, required this.counter});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    print('build CounterWidget');
    final inheritedWidget = MyInheritedWidget.of(context);
    if (inheritedWidget == null)
      return Text('Khong tim thay My InheritedWidget');
    else
      return inheritedWidget.isLoading
          ? CircularProgressIndicator()
          : Text('${inheritedWidget.counter}');
  }
}

// Tao Class InheritedWidget
class MyInheritedWidget extends InheritedWidget {
  final int counter;
  final bool isLoading;
  final Widget con;

  //yeu cau add ham xay dung cua lop cha, ham xay dung lop cha yeu cau tham so child la 1 Widget
  MyInheritedWidget({
    required this.counter,
    required this.isLoading,
    required this.con,
  }) : super(child: con);

  //Viet ham tim kiem Widget cha tu Context cua Widget con, phuong thuc tinh static (de goi thong qua ten lop)
  static MyInheritedWidget? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<MyInheritedWidget>();
  }

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    // TODO: implement updateShouldNotify
    return false;
  }
}
