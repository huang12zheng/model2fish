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
  group('A group of domain tests about swith', () {
    test('Attrs', () {
      expect(Attrs.fromJson(UseCase['Attrs']).toJson(),UseCase['Attrs']);
    });
    test('Actions', () {
      expect(Actions.fromJson(UseCase['Actions']).toJson(),UseCase['Actions']);
    });
    test('Domain', () {
      expect(Domain.fromJson(UseCase).toJson(),UseCase);
    });
  });

  group('A group of domain tests about attrs', () {
    test('DomainName', () {
      expect(Domain.fromJson(UseCase).domainName,"TodoEdit");
    });
    test('Attrs: Parent', () {
      expect(Domain.fromJson(UseCase).attrs.datas[0].type,"Parent");
      expect(Domain.fromJson(UseCase).attrs.datas[0].attr,"toDo");
    });
    test('Attrs: simple attr', () {
      expect(Domain.fromJson(UseCase).attrs.datas[1].type,"TextEditingController");
      expect(Domain.fromJson(UseCase).attrs.datas[1].attr,"nameEditController");
    });
    //  "Actions":[
    //   {"onEdit":[]},
    //   {"edit":[{"name":"String"},{"desc":"String"}]},
    //   {"done":[]},
    //   {"onRemove":[]},
    //   {"remove":[]},
    test('Actions: null Payload', () {
      expect(Domain.fromJson(UseCase).actions.datas[0].type,"onEdit");
      expect(Domain.fromJson(UseCase).actions.datas[0].payload.datas.length,0);
    });
    test('Actions: Payload have attrs', () {
      expect(Domain.fromJson(UseCase).actions.datas[1].type,"edit");
      expect(Domain.fromJson(UseCase).actions.datas[1].payload.datas.length,2);
      expect(Domain.fromJson(UseCase).actions.datas[1].payload.datas[0].toJson(),{"name":"String"});
      expect(Domain.fromJson(UseCase).actions.datas[1].payload.datas[1].toJson(),{"desc":"String"});
    });
    test('A simple use of Attr', () {
      expect(Domain.fromJson(UseCase).actions.datas[1].payload.datas[0].type,"String");
      expect(Domain.fromJson(UseCase).actions.datas[1].payload.datas[0].attr,"name");
    });
  });

}
