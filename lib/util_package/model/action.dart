import 'attrs.dart';

part 'action.g.dart';
/// instance
/// var tmp = {"update":[{"attr":"String"},{"ad":"Int"}]};
/// Action payload  = Action.fromJson(tmp);
/// print(payload.toJson()); /// {update: [{attr: String}, {ad: Int}]}
class Action {

  String type;

  Attrs payload;

  Action(this.type,this.payload);

  factory Action.fromJson(Map<String,dynamic> srcJson) => _$ActionFromJson(srcJson);
  
  Map<String, List<Map<String,String>> > toJson() => _$ActionToJson(this);
}