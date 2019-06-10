import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'print_tool.dart';
import 'package:path/path.dart' as path;

Future<List<FileSystemEntity>> dirContents(Directory dir) {
  List<FileSystemEntity> files = [];
  var completer = new Completer<List<FileSystemEntity>>();
  var lister = dir.list(recursive: false);
  lister.listen((file) => files.add(file),
      // should also register onError
      onDone: () => completer.complete(files));
  return completer.future;
}

RegExp _FILE_NAMING_REGEXP = RegExp(r'f\..*\.json');

Map<String, FileSystemEntity> getValidStringFileMap(files) {
  Map<String, FileSystemEntity> validMap = {};
  for (FileSystemEntity file in files) {
    String fileName = path.basename(file.path);

    if (_validateStringFileName(fileName)) {
      String locale = getLocale(fileName);
      validMap[locale] = file;
    } else {_printWarning(fileName);}
  }
  return validMap;
}

void _printWarning(String fileName) {
  printWarning(
      '$fileName does not match naming pattern [f.{locale}.json]');
}
String getLocale(String fileName) {
  return fileName.replaceAll('f.', '').replaceAll('.json', '').replaceAll('.', '_');
}

bool _validateStringFileName(String fileName) =>  _FILE_NAMING_REGEXP.hasMatch(fileName);

generateJsonMap(File jsonFile) async {
  String json = await jsonFile.readAsString();
  Map<String, dynamic> jsonMap=jsonDecode(json);
  return jsonMap;
}