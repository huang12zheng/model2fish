part of 'effect.dart';

class EffectMethodHandle extends DomainHandle<Actions>{
  Actions actions;
  Map<String,String> map;
  EffectMethodHandle({this.actions,this.map}):super(domain:actions,map:map){
    template();
  }
  template(){
    StartConfig();
    for (Action action in actions.datas){
      EffectMethodItemHandle handle = EffectMethodItemHandle(action:action);
      map['EFFECT_METHOD']=map['EFFECT_METHOD']+handle.map['EFFECT_METHOD_ITEM'];
    }
    strBuild('EFFECT_METHOD');
  }
  // EFFECT_METHOD_ITEM
  // void _#{ACTION_TYPE}(Action action, Context<#{DOMAINNAME_TYPE}> ctx) {}
  void StartConfig() => map['EFFECT_METHOD']='';
}