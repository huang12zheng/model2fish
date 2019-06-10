
import 'package:model2fish/code_replace/index.dart';
import 'package:test/test.dart';

import '../../../example/model2code_example.dart';

void main() {
    test('state test', () {
      StateHandle handle =StateHandle(json:TodoEdit);
      handle.strBuild('OUTSTR_STATE');
      // print(handle.map['OUTSTR_STATE']);
      expect(expect_str,handle.map['OUTSTR_STATE']);
    });
}

String expect_str='''import 'package:flutter/material.dart';

class TodoEditState implements Cloneable<TodoEditState> {
  ToDoState toDo;
  TextEditingController nameEditController;
  TextEditingController descEditController;
  FocusNode focusNodeName;
  FocusNode focusNodeDesc

  @override
  TodoEditState clone() {
    return TodoEditState()
      ..toDo = toDo
      ..nameEditController = nameEditController
      ..descEditController = descEditController
      ..focusNodeName = focusNodeName
      ..focusNodeDesc = focusNodeDesc;
  }
}

TodoEditState initState(ToDo arg) {
  final TodoEditState state = TodoEditState();

  state.toDo = arg?.clone() ?? ToDoState();
  state.nameEditController = TextEditingController(text: arg?.nameEditController);
  state.descEditController = TextEditingController(text: arg?.descEditController);
  state.focusNodeName = FocusNode();
  state.focusNodeDesc = FocusNode();

  return state;
}
''';