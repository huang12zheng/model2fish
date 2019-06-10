part of 'reducer.dart';
class ReducerMethodHandle extends DomainHandle<Actions>{
  Actions actions;
  Map<String,String> map;
  ReducerMethodHandle({this.actions,this.map}):super(domain:actions,map:map){
    template();
  }
  template(){
    StartConfig();
    for (Action action in actions.datas){
      ReducerMethodItemHandle handle = ReducerMethodItemHandle(action:action);
      map['REDUCER_METHOD']=map['REDUCER_METHOD']+'\n'+handle.map['REDUCER_METHOD_ITEM'];
    }
    strBuild('REDUCER_METHOD');
  }
  // REDUCER_METHOD_ITEM
  // void _#{ACTION_TYPE}(Action action, Context<#{DOMAINNAME_TYPE}> ctx) {}
  void StartConfig() => map['REDUCER_METHOD']='';
}