part of 'state.dart';

String attrHandle(Attr attr){
  String value = valueHandle(attr);
  return "state.${attr.attr} = $value";
}

String valueHandle(Attr attr){
  return {
    "Parent": "arg?.clone() ?? #{PARENT}State();",
    "TextEditingController": "TextEditingController(text: arg?.${attr.attr});",
    "FocusNode":"FocusNode();",
  }[attr.type];
}