part of 'reducer.dart';

class ReducerMethodItemHandle extends DomainHandle<Action>{
  Action action;
  Map<String,String> map;
  ReducerMethodItemHandle({this.action,this.map}):super(domain:action,map:map){
    template();
  }
  template(){
      StartConfig();
      ACTION_TYPE();
      REDUCER_CLONE();

      strBuild('REDUCER_METHOD_ITEM');
  }
  // void _#{ACTION_TYPE}(Action action, Context<#{DOMAINNAME_TYPE}> ctx) {}
  void StartConfig() {
    map['REDUCER_METHOD_ITEM']=REDUCER_METHOD_ITEM;
    map['PAYLOAD_DEFINE']= action.payload.datas.isNotEmpty ?
    PAYLOAD_DEFINE : '';
  }
  void ACTION_TYPE() => map['ACTION_TYPE']=action.type;
  void REDUCER_CLONE(){
    ReducerCloneHandle handle = ReducerCloneHandle(attrs:action.payload);
    map['REDUCER_CLONE'] = handle.map['REDUCER_CLONE'];
  }
}