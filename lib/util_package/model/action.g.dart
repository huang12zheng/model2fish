part of 'action.dart';
// {"update":["arr":"type"]}
Action _$ActionFromJson(Map<String, dynamic> srcJson) {
  return Action(srcJson.keys.first,Attrs.fromJson(srcJson.values.first));
}

Map<String, List<Map<String, String>>> _$ActionToJson(Action action) {
  return {action.type:action.payload.toJson()};
}