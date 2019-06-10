

import 'package:model2fish/code_replace/index.dart';
import 'package:model2fish/util_package/index.dart';
import 'package:test/test.dart';

import '../../../example/model2code_example.dart';


void main() {
  group('DomainHandle test', () {
    test('action test', () {
      // var json = {"Actions":[{"update":[{"attr":"String"}]}]};
      Domain domain = Domain.fromJson(TodoEdit);
      ActionCreatorHandle handle = ActionCreatorHandle(actions:domain.actions);
      handle.strBuild('ACTION_METHOR_STR');
      // print(handle.map['ACTION_METHOR_STR']);
      expect(handle.map['ACTION_METHOR_STR'],expect_str);
    });
    
  });

}

String expect_str='''
  static Action onEdit() {
    return Action(#{DOMAINNAME}Action.onEdit);
  }
  static Action edit(String name,String desc) {
    return Action(#{DOMAINNAME}Action.edit,payload: <String,String>{
        'name': name,
        'desc': desc
      });
  }
  static Action done() {
    return Action(#{DOMAINNAME}Action.done);
  }
  static Action onRemove() {
    return Action(#{DOMAINNAME}Action.onRemove);
  }
  static Action remove() {
    return Action(#{DOMAINNAME}Action.remove);
  }
''';