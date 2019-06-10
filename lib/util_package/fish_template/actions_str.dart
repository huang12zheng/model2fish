const String OUTSTR_ACTIONS=
'''import 'package:fish_redux/fish_redux.dart';

enum #{DOMAINNAME}Action { #{ACTION_TYPE} }

class #{DOMAINNAME}ActionCreator {
#{ACTION_METHOR_STR}
}
''';
// ACTION_METHOR_STR=sum(ACTION_METHOR_STR_ITEM)
String ACTION_METHOR_STR_ITEM ='''
  static Action #{ACTION_MATHOR_DECLARE} {
    return Action(#{DOMAINNAME}Action#{ACTION_MATHOR_IMPLEMENT});
  }
''';
// String ACTION_MATHOR_DECLARE;
String ACTION_MATHOR_IMPLEMENT=
'''.#{TYPE}#{PAYLOAD}''';

