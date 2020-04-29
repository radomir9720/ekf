import 'package:flutter/cupertino.dart';

class ParentDataModel {
  ParentDataModel({@required this.data});
  final Map data;

  String get firstName => data["firstName"];
  String get lastName => data["lastName"];
  String get middleName => data["middleName"];
  String get birthDate => data["birthDate"];
  String get position => data["position"];
}