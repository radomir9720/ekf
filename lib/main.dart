import 'package:ekf/data/main_data.dart';
import 'package:ekf/pages/child_page.dart';
import 'package:ekf/pages/parents_page.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Widget currentWidget;

  @override
  void initState() {
    currentWidget = Loading();
    awaitAndChangeWidget();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter EKF job interview',
      debugShowCheckedModeBanner: false,
      routes: {
        ChildPage.id: (context) => ChildPage(),
      },
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: currentWidget,
    );
  }

  void awaitAndChangeWidget() async {
    await initMainData();
//    Future.delayed(Duration(seconds: 2));
    setState(() {
      currentWidget = ParentsPage();
    });
  }
}

class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: CircularProgressIndicator(backgroundColor: Colors.teal,),
        ),
      ),
    );
  }
}
