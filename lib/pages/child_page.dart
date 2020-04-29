import 'package:ekf/data/child_data_model.dart';
import 'package:ekf/data/main_data.dart';
import 'package:ekf/data/parent_data_model.dart';
import 'package:ekf/widgets/custom_flat_button.dart';
import 'package:ekf/widgets/parents_page_card.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'add_new_card_page.dart';

class ChildPage extends StatelessWidget {
  static String id = 'childPage';

  @override
  Widget build(BuildContext context) {
    final Map<int, ParentDataModel> arguments =
        ModalRoute.of(context).settings.arguments as Map;
    return Scaffold(
      appBar: AppBar(
        title: Text(
            "Дети ${arguments.values.first.lastName} ${arguments.values.first.firstName} ${arguments.values.first.middleName}"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: () {
              parentBox.deleteAt(arguments.keys.first);
              deleteChildren(arguments.keys.first);
//              childBox.delete(arguments.keys.first);
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            Expanded(
              child: ValueListenableBuilder(
                  valueListenable: childBox.listenable(),
                  builder: (context, childBox, widget) {
                    return ListView.builder(
                        itemCount: returnChildListLength(arguments.keys.first),
                        itemBuilder: (context, index) {
                          ChildDataModel cdm =
                          ChildDataModel(data: childBox.getAt(index));
                          return
                            cdm.parentId == arguments.keys.first ? ParentsPageCard(
                            lastName: cdm.lastName ?? "",
                            firstName: cdm.firstName ?? "",
                            middleName: cdm.middleName ?? "",
                            birthDate: cdm.birthDate ?? "",
                          ) : null;
                        });
                  }),
            ),
            CustomFlatButton(
              buttonTitle: "Добавить карточку",
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (_) => AddNewCardPage(
                    parent: false,
                    parentKey: arguments.keys.first,
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
