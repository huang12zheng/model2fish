import 'package:model2fish/util_package/index.dart';
import 'package:test/test.dart';

void main() {
  Map<String,dynamic> UseCase = {
    "DomainName" : "TodoEdit",
    "Attrs":[
      {"toDo":"Parent"},
      {"nameEditController": "TextEditingController"},
      {"descEditController": "TextEditingController"},
      {"focusNodeName":"FocusNode"},
      {"focusNodeDesc":"FocusNode"},
    ],
    "Actions":[
      {"onEdit":[]},
      {"edit":[{"name":"String"},{"desc":"String"}]},
      {"done":[]},
      {"onRemove":[]},
      {"remove":[]},
    ],
  };
 
  group('Actions:A extra Method', () {
    Actions actions = Domain.fromJson(UseCase).actions;
    test('getType: Effect', () {
      Effects effects = Effects(actions.datas);
      expect(effects.toDefindStr(), ExpectEffectStr);
    });
    test('getType: Reducer', () {
      Reducers reducers = Reducers(actions.datas);
      // print(reducers.toDefindStr());
      expect(reducers.toDefindStr(), ReducerEffectStr);
    });
      // expect(Effects(actions.datas).datas., ["onEdit", "onRemove"]);
    test('getTypeStr', () {
      expect(actions.toDefindStr(), "onEdit,edit,done,onRemove,remove");
    });
  });
}
String ExpectEffectStr='''

    #{DOMAINNAME}Action.onEdit: _onEdit,
    #{DOMAINNAME}Action.onRemove: _onRemove''';

String ReducerEffectStr='''

      #{DOMAINNAME}Action.edit: _edit,
      #{DOMAINNAME}Action.done: _done,
      #{DOMAINNAME}Action.remove: _remove''';