import 'attrs.dart';

part 'attr.g.dart';

class Attr {

  String type;

  String attr;

  Attr(this.type,this.attr,);

  factory Attr.fromJson(Map<String, dynamic> srcJson) => _$AttrFromJson(srcJson);

  Map<String, String> toJson() => _$AttrToJson(this);

  String toStringTemplate(ToStringStragery stragery) {
    switch (stragery) {
      // <String, String>
      case ToStringStragery.NO_ATTR: return "$type";
      // payload: <String, String>{
      //   'name': name,
      case ToStringStragery.ATTR_LIST: return "\n        '$attr': $attr";
      // String name,
      case ToStringStragery.DEFAULT: {
        if (type == "Parent") return "#{PARENT_TYPE} $attr";
        return "$type $attr";
      }
      default: return "$type $attr";
    }
  }
}

  
