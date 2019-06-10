import 'package:model2fish/util_package/index.dart';
import 'package:test/test.dart';


void main() {
  group('action test', () {
    test('simple test', () {
      Map<String,String> initMap={
        'OUTSTR_ACTIONS':OUTSTR_ACTIONS,
        'DOMAINNAME':'TodoEdit',
      };
      
      Handle handle=Handle(initMap);
      handle.strBuild('OUTSTR_ACTIONS');
      expect(handle.map['OUTSTR_ACTIONS'], expect_str);
    });
    test('null test', () {
      Handle handle=Handle();
      expect(handle.map, {});
    });
  });

}


const String OUTSTR_ACTIONS=
'''import 'package:fish_redux/fish_redux.dart';
enum #{DOMAINNAME}Action { #{ACTION_TYPE} }
class #{DOMAINNAME}ActionCreator {
#{ACTION_METHOR_STR}
}''';
String expect_str='''import 'package:fish_redux/fish_redux.dart';
enum TodoEditAction { #{ACTION_TYPE} }
class TodoEditActionCreator {
#{ACTION_METHOR_STR}
}''';