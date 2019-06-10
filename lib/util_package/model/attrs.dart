import 'attr.dart'; 
  
part 'attrs.g.dart';

// part 'attrs.m.dart';

/// instance 
/// var tmp = [{"attr":"String"},{"ad":"Int"}];
/// Attrs payload  = Attrs.fromJson(tmp);
/// print(payload.toJson()); /// [{attr: String}, {ad: Int}]
class Attrs {

  List<Attr> datas;

  Attrs(this.datas);

  factory Attrs.fromJson(List<Object> srcJson) => _$AttrsFromJson(srcJson);

  List<Map<String, String>> toJson() => _$AttrsToJson(this);

  String toStringTemplate([ToStringStragery stragery=ToStringStragery.DEFAULT]){
    if (datas.isEmpty) return '';
    if (stragery==ToStringStragery.PAYLOAD){
      String str1 = toStringTemplate(ToStringStragery.NO_ATTR);
      String str2 = toStringTemplate(ToStringStragery.ATTR_LIST);
      //  'desc': desc,
      //},
      return ",payload: <$str1>{${str2}\n      }";
    }
    if (stragery==ToStringStragery.DEFINE) {
      return datas.map((attr)=>attr.toStringTemplate(ToStringStragery.DEFAULT)).join(';\n  ');
    }
    return datas.map((attr)=>attr.toStringTemplate(stragery)).join(',');
  }

  get PAYLOAD => toStringTemplate(ToStringStragery.PAYLOAD);
}

enum ToStringStragery{
  NO_ATTR,
  DEFAULT, // method declare
  ATTR_LIST,
  PAYLOAD,
  DEFINE, // muti line
}