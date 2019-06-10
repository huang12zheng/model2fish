part of 'action.dart';

class ActionCreatorHandle extends DomainHandle<Actions>{
  Actions actions;
  Map<String,String> map;
  ActionCreatorHandle({this.actions,this.map}):super(domain:actions,map:map){
    template();
  }
  template(){
    StartConfig();
    for (Action action in actions.datas){
      ActionCreatorItemHandle handle = ActionCreatorItemHandle(action:action);
      map['ACTION_METHOR_STR']=map['ACTION_METHOR_STR']+handle.map['ACTION_METHOR_STR_ITEM'];
    }
      strBuild('ACTION_METHOR_STR');
  }
  
  void StartConfig() => map['ACTION_METHOR_STR']='';
}