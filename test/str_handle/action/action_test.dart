
import 'package:model2fish/code_replace/index.dart';
import 'package:test/test.dart';

import '../../../example/model2code_example.dart';

void main() {
  group('DomainHandle test', () {
    test('action test', () {
      ActionHandle handle =ActionHandle(json:TodoEdit);
      // handle.template();
      handle.strBuild('OUTSTR_ACTIONS');
      // print(handle.map['OUTSTR_ACTIONS']);
      expect(expect_str,handle.map['OUTSTR_ACTIONS']);
    });
    
  });

}

String expect_str='''import 'package:fish_redux/fish_redux.dart';

enum TodoEditAction { onEdit,edit,done,onRemove,remove }

class TodoEditActionCreator {
  static Action onEdit() {
    return Action(TodoEditAction.onEdit);
  }
  static Action edit(String name,String desc) {
    return Action(TodoEditAction.edit,payload: <String,String>{
        'name': name,
        'desc': desc
      });
  }
  static Action done() {
    return Action(TodoEditAction.done);
  }
  static Action onRemove() {
    return Action(TodoEditAction.onRemove);
  }
  static Action remove() {
    return Action(TodoEditAction.remove);
  }

}
''';