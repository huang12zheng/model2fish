part of 'effect.dart';

class EffectMethodItemHandle extends DomainHandle<Action>{
  Action action;
  Map<String,String> map;
  EffectMethodItemHandle({this.action,this.map}):super(domain:action,map:map){
    template();
  }
  template(){
      StartConfig();
      ACTION_TYPE();
      strBuild('EFFECT_METHOD_ITEM');
  }
  // void _#{ACTION_TYPE}(Action action, Context<#{DOMAINNAME_TYPE}> ctx) {}
  void StartConfig() {
    map['EFFECT_METHOD_ITEM']=EFFECT_METHOD_ITEM;
  }
  void ACTION_TYPE() => map['ACTION_TYPE']=action.type;
}