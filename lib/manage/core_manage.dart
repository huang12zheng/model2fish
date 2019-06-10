import 'dart:io';

import 'package:model2fish/code_replace/index.dart';
import 'package:model2fish/manage/fish_option.dart';
import 'package:path/path.dart' as path;

import 'file_tool.dart';
import 'print_tool.dart';

void handleGenerateFiles(FishOption option) async {
  Directory current = Directory.current;

  Directory sourcePath = Directory(path.join(current.path, option.sourceDir));
  // Directory outPath = Directory(path.join(current.path, option.outputDir));

  if (!await sourcePath.exists()) {
    printError('Source path does not exist');
  }

  List<FileSystemEntity> files =
    await dirContents(sourcePath);
  Map<String, FileSystemEntity> validFilesMap = getValidStringFileMap(files);
  for (String key in validFilesMap.keys) {
    Map<String,dynamic> map = await generateJsonMap(File(validFilesMap[key].path));
    String dirpath = "${path.join(current.path,option.outputDir)}$key";
    writeByJsonMap(map,dirpath);
  }
}

writeByJsonMap(Map<String,dynamic> map,String dirpath) async {
  
  Directory outPath = Directory(dirpath);
  if (!await outPath.exists()) {
    await outPath.create(recursive: true);
    writeFile("$dirpath/action.dart", ActionHandle(json:map).map['OUTSTR_ACTIONS']);
    writeFile("$dirpath/effect.dart", EffectHandle(json:map).map['OUTSTR_EFFECT']);
    writeFile("$dirpath/reducer.dart",ReducerHandle(json:map).map['OUTSTR_REDUCER']);
    writeFile("$dirpath/state.dart",  StateHandle(json:map).map['OUTSTR_STATE']);
    writeFile("$dirpath/page.dart",   PageHandle(json:map).map['OUTSTR_PAGE']);
    writeFile("$dirpath/view.dart",   ViewHandle(json:map).map['OUTSTR_VIEW']);
  }
  

  

}

writeFile(String source,String word) async {
  File file = new File(source);
  if(!await file.exists()) {
    file = await file.create();
  }
  file = await file.writeAsString(word);
  printInfo(source+" is OK");
}