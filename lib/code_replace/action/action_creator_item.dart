part of 'action.dart';

class ActionCreatorItemHandle extends DomainHandle<Action>{
  Action action;
  Map<String,String> map;
  ActionCreatorItemHandle({this.action,this.map}):super(domain:action,map:map){
    template();
  }
  template(){
      StartConfig();
      ACTION_MATHOR_DECLARE();
      TYPE();
      PAYLOAD();
      strBuild('ACTION_METHOR_STR_ITEM');
  }

  void StartConfig() {
    map['ACTION_METHOR_STR_ITEM']=ACTION_METHOR_STR_ITEM;
    map['ACTION_MATHOR_IMPLEMENT']=ACTION_MATHOR_IMPLEMENT;
  }
  void TYPE() => map['TYPE']=action.type;
  void ACTION_MATHOR_DECLARE(){
    String arg = action.payload.toStringTemplate();
    map['ACTION_MATHOR_DECLARE'] = "${action.type}($arg)";
  }
  void PAYLOAD(){
    map['PAYLOAD']=action.payload.toStringTemplate(ToStringStragery.PAYLOAD);
  }
}