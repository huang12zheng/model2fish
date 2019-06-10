
import 'package:model2fish/code_replace/index.dart';
import 'package:test/test.dart';

import '../../../example/model2code_example.dart';

void main() {
    test('reducer test', () {
      ReducerHandle handle =ReducerHandle(json:TodoEdit);
      handle.strBuild('OUTSTR_REDUCER');
      expect(expect_str,handle.map['OUTSTR_REDUCER']);
    });
}

String expect_str='''import 'package:fish_redux/fish_redux.dart';

Reducer<TodoEditState> buildReducer() {
  return asReducer<TodoEditState>(
    <Object, Reducer<TodoEditState>>{
      TodoEditAction.edit: _edit,
      TodoEditAction.done: _done,
      TodoEditAction.remove: _remove
    }
  );
}

TodoEditState _edit(TodoEditState state, Action action) {
  final Map<String, String> payload = action.payload ?? <String, String>{};
  final TodoEditState newState = state.clone();
  newState.toDo.name = payload['name'] ?? newState.toDo.name;
  newState.toDo.desc = payload['desc'] ?? newState.toDo.desc;

  return newState;
}
TodoEditState _done(TodoEditState state, Action action) {
  
  final TodoEditState newState = state.clone();

  return newState;
}
TodoEditState _remove(TodoEditState state, Action action) {
  
  final TodoEditState newState = state.clone();

  return newState;
}
''';