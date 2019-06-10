const String OUTSTR_REDUCER=
'''import 'package:fish_redux/fish_redux.dart';

Reducer<#{DOMAINNAME_TYPE}> buildReducer() {
  return asReducer<#{DOMAINNAME_TYPE}>(
    <Object, Reducer<#{DOMAINNAME_TYPE}>>{#{REDUCER_DECLARE}}
  );
}
#{REDUCER_METHOD}
''';
String REDUCER_METHOD_ITEM = '''
#{DOMAINNAME_TYPE} _#{ACTION_TYPE}(#{DOMAINNAME_TYPE} state, Action action) {
  #{PAYLOAD_DEFINE}
  final #{DOMAINNAME_TYPE} newState = state.clone();
#{REDUCER_CLONE}
  return newState;
}''';
String REDUCER_CLONE_ITEM=
'''newState.#{parent}.#{PAYLOAD_TYPE} = payload['#{PAYLOAD_TYPE}'] ?? newState.#{parent}.#{PAYLOAD_TYPE};
''';
String PAYLOAD_DEFINE='final Map<String, String> payload = action.payload ?? <String, String>{};';
  // newState.toDo.title = payload['name'] ?? newState.toDo.title;
  // newState.toDo.desc = payload['desc'] ?? newState.toDo.desc;
