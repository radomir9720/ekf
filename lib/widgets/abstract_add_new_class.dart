import 'package:flutter/material.dart';

abstract class AddNewCard extends State {

  TextEditingController firstNameController;
  TextEditingController lastNameController;
  TextEditingController middleNameController;
  TextEditingController birthDateController;
  TextEditingController positionController;

  List<Widget> pageWidgets = [];

  void initControllers();

  void disposeControllers();

  @override
  void initState() {
    initControllers();
    super.initState();
  }

  @override
  void dispose() {
    disposeControllers();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.white),
              padding: EdgeInsets.all(8.0),
              child: Column(
                children: pageWidgets,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
