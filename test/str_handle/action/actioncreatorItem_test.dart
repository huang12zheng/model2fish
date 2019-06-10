
import 'package:model2fish/code_replace/index.dart';
import 'package:model2fish/util_package/index.dart';
import 'package:test/test.dart';

import '../../../example/model2code_example.dart';

void main() {
  group('DomainHandle test', () {
    test('action test', () {
      Domain domain = Domain.fromJson(TodoEdit);
      ActionCreatorItemHandle handle = ActionCreatorItemHandle(action:domain.actions.datas[0]);
      // handle.template();
      handle.strBuild('ACTION_METHOR_STR_ITEM');
      // print(handle.map['ACTION_METHOR_STR_ITEM']);
      expect(handle.map['ACTION_METHOR_STR_ITEM'],expect_str);
    });
    
  });

}

String expect_str='''
  static Action onEdit() {
    return Action(#{DOMAINNAME}Action.onEdit);
  }
''';