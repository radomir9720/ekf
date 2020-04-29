import 'package:ekf/data/main_data.dart';
import 'package:ekf/widgets/custom_flat_button.dart';
import 'package:ekf/widgets/text_input_field.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class AddNewCardPage extends StatefulWidget {
  AddNewCardPage({this.parent, this.parentKey});

  final bool parent;
  final int parentKey;

  @override
  _AddNewCardPageState createState() => _AddNewCardPageState();
}

class _AddNewCardPageState extends State<AddNewCardPage> {
  TextEditingController firstNameController;
  TextEditingController lastNameController;
  TextEditingController middleNameController;
  TextEditingController birthDateController;
  TextEditingController positionController;

  List<Widget> pageWidgets = [];

  @override
  void initState() {
    firstNameController = TextEditingController();
    lastNameController = TextEditingController();
    middleNameController = TextEditingController();
    birthDateController = TextEditingController();
    positionController = widget.parent ? TextEditingController() : null;
    super.initState();
  }

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    middleNameController.dispose();
    birthDateController.dispose();
    if (widget.parent) positionController.dispose();
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
                children: <Widget>[
                  Text(
                    "Заполните поля:",
                    style: TextStyle(fontSize: 20.0),
                  ),
                  SizedBox(
                    height: 4.0,
                  ),
                  TextInputField(
                    hintText: "Фамилия",
                    controller: lastNameController,
                  ),
                  TextInputField(
                    hintText: "Имя",
                    controller: firstNameController,
                  ),
                  TextInputField(
                    hintText: "Отчество",
                    controller: middleNameController,
                  ),
                  TextInputField(
                    hintText: "Дата рождения",
                    controller: birthDateController,
                  ),
                  widget.parent
                      ? TextInputField(
                          hintText: "Должность",
                          controller: positionController,
                        )
                      : SizedBox(),
                  CustomFlatButton(
                    buttonTitle: "Добавить",
                    onPressed: () {
                      addDataToBox(widget.parent ? parentBox : childBox);
                      Navigator.of(context).pop();
                    },
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void addDataToBox(Box box) {
    if (widget.parent) {
      box.add(
        {
          "firstName": firstNameController.text,
          "lastName": lastNameController.text,
          "middleName": middleNameController.text,
          "birthDate": birthDateController.text,
          "position": positionController.text,
        },
      );
    } else {
      box.add(
        {
          "firstName": firstNameController.text,
          "lastName": lastNameController.text,
          "middleName": middleNameController.text,
          "birthDate": birthDateController.text,
          "parentId": widget.parentKey
        },
      );
    }
  }
}
