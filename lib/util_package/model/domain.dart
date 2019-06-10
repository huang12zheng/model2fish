import 'actions.dart';
import 'attrs.dart';

part 'domain.g.dart';


// Map tmp = {
//   "DomainName": "todo",
//   "Attrs": null,
//   "Actions": [
//     {
//       "update": [
//         {"attr": "String"},
//         {"ad": "Int"}
//       ]
//     }
//   ]
// };

/// domain
/// var tmp = {"DomainName":"todo",
/// "Attrs":[{"attr":"String"},{"ad":"Int"}]
/// ,"Actions":[{"update":[{"attr":"String"},{"ad":"Int"}]}]};
/// Domain domian  = Domain.fromJson(tmp);
/// print(domian.toJson()); /// {DomainName: todo, Attrs: [{attr: String}, {ad: Int}], Actions: [{update: [{attr: String}, {ad: Int}]}]}

class Domain {
  String domainName;

  String parent;

  Attrs attrs;

  Actions actions;

  Domain(this.domainName, this.attrs, this.actions){
    if (attrs.datas[0].type.toUpperCase()=="PARENT"){
      parent = attrs.datas[0].attr;
    };
  }
  get Parent => getFirstUpper(parent);
  factory Domain.fromJson(Map<String, dynamic> srcJson) =>
      _$DomainFromJson(srcJson);

  Map<String, dynamic> toJson() => _$DomainToJson(this);
}


String getFirstUpper(String str) {
  String firstCase = str.substring(0,1).toString().toUpperCase();
  String other = str.substring(1,str.length);
  return "$firstCase$other";
}
