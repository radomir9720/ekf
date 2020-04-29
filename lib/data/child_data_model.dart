import 'package:flutter/cupertino.dart';

import 'main_data.dart';

class ChildDataModel {
  ChildDataModel({@required this.data});

  final Map data;

  String get firstName => data["firstName"];

  String get lastName => data["lastName"];

  String get middleName => data["middleName"];

  String get birthDate => data["birthDate"];

  int get parentId => data["parentId"];
  
}

int returnChildListLength(parentId) {
  int _cnt = 0;
//  print(childBox.keys);
//  childBox.delete(2);
//  print(childBox.get(1));
  childBox.toMap().forEach((k, v) {
    if (v["parentId"] == parentId) _cnt++;
  });
  return _cnt;
}

void deleteChildren(parentId) {
  List<int> toDelete = [];
  childBox.keys.forEach((k) {
    if (childBox.get(k)["parentId"] == parentId) toDelete.add(k);
  });
  childBox.deleteAll(toDelete);
}
