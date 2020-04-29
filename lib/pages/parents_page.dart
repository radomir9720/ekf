import 'package:ekf/data/child_data_model.dart';
import 'package:ekf/data/main_data.dart';
import 'package:ekf/data/parent_data_model.dart';
import 'package:ekf/pages/child_page.dart';
import 'package:ekf/widgets/custom_flat_button.dart';
import 'package:ekf/widgets/parents_page_card.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'add_new_card_page.dart';

class ParentsPage extends StatefulWidget {
  @override
  _ParentsPageState createState() => _ParentsPageState();
}

class _ParentsPageState extends State<ParentsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Parents list"),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            Expanded(
              child: ValueListenableBuilder(
                  valueListenable: parentBox.listenable(),
                  builder: (context, parentBox, widget) {
                    return ListView.builder(
                        itemCount: parentBox.length,
                        itemBuilder: (context, index) {
                          ParentDataModel pdm =
                              ParentDataModel(data: parentBox.getAt(index));
                          return GestureDetector(
                            child: ParentsPageCard(
                              lastName: pdm.lastName,
                              firstName: pdm.firstName,
                              middleName: pdm.middleName,
                              birthDate: pdm.birthDate,
                              position: pdm.position,
                              childrenCnt: returnChildListLength(index),
                            ),
                            onTap: () {
                              Navigator.of(context).pushNamed(ChildPage.id, arguments: {index: pdm});
                            },
                          );
                        });
                  }),
            ),
            CustomFlatButton(
              buttonTitle: "Добавить карточку",
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (_) => AddNewCardPage(
                    parent: true,
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
