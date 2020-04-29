import 'dart:io';
import 'package:ekf/constants.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';


Box parentBox;
Box childBox;

void initMainData() async {
  Directory appDocDir = await getApplicationDocumentsDirectory();
  String path = appDocDir.path;
  Hive.init(path);
  await Hive.openBox(kParentsPageDataBoxKey);
  await Hive.openBox(kChildPageDataBoxKey);
  parentBox = await Hive.box(kParentsPageDataBoxKey);
  childBox = await Hive.box(kChildPageDataBoxKey);
}

