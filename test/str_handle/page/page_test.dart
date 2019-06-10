
import 'package:test/test.dart';

import '../../../example/model2code_example.dart';
import 'package:model2fish/code_replace/index.dart';

void main() {
    test('page test', () {
      PageHandle handle =PageHandle(json:TodoEdit);
      handle.strBuild('OUTSTR_PAGE');
      expect(expect_str,handle.map['OUTSTR_PAGE']);
    });
}

String expect_str='''import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class TodoEditPage extends Page<TodoEditState, ToDoState> {
  TodoEditPage():
  super(
    initState: initState,
    effect: buildEffect(),
    reducer: buildReducer(),
    view: buildView,
    middleware: <Middleware<TodoEditState>>[
      logMiddleware(tag: 'TodoEditPage'),
    ],
  );
}
''';