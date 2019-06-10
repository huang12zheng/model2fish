import 'action.dart'; 
  
// part 'actions.m.dart';

/// instance 
/// var tmp = [{"update":[{"attr":"String"}]}];
/// Actions actions  = Actions.fromJson(tmp);
/// print(actions.toJson()); /// [{"update":[{"attr":"String"}]}]
class Actions {

  List<Action> datas;

  Actions(this.datas);

  factory Actions.fromJson(List<Object> srcJson) => _$ActionsFromJson(srcJson);
  
  List<Map<String, dynamic>> toJson() => _$ActionsToJson(this);
  
  /// 'update, onDone, onChangeTheme'
  String toDefindStr() => getStrList().map((e)=>e).join(',');
  List<String> getStrList() => datas.map((action)=>action.type).toList();

}

Actions _$ActionsFromJson(List<Object> json) {
  return Actions(json.map(
        (e) => Action.fromJson(e)
      )?.toList());
}
    
List<Map<String, dynamic>> _$ActionsToJson(Actions instance) {
  return instance.datas.map(
    (e) => e==null ? null : e.toJson()
  )?.toList();
}