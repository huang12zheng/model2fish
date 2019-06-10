
import 'package:test/test.dart';

import '../../../example/model2code_example.dart';
import 'package:model2fish/code_replace/index.dart';

void main() {
  group('DomainHandle test', () {
    test('action test', () {
      EffectHandle handle =EffectHandle(json:TodoEdit);
      handle.strBuild('OUTSTR_EFFECT');
      // print(handle.map['OUTSTR_EFFECT']);
      expect(expect_str,handle.map['OUTSTR_EFFECT']);
    });
    
  });

}

String expect_str='''import 'package:fish_redux/fish_redux.dart';
import 'action.dart';
import 'state.dart';

Effect<TodoEditEffect> buildEffect() {
  return combineEffects(<Object, Effect<TodoEditState>>{
    TodoEditAction.onEdit: _onEdit,
    TodoEditAction.onRemove: _onRemove
  });
}

void _onEdit(Action action, Context<TodoEditState> ctx) {}

void _onRemove(Action action, Context<TodoEditState> ctx) {}

''';