part of 'reducer.dart';

class ReducerCloneItemHandle extends DomainHandle<Action>{
  Map<String,String> map;
  String attr;
  ReducerCloneItemHandle(this.attr,{this.map}):super(map:map){
    template();
  }
  template(){
      StartConfig();
      PAYLOAD_TYPE();
      replaceAll('REDUCER_CLONE_ITEM','PAYLOAD_TYPE');
  }
  // '''newState.#{parent}.#{PAYLOAD_TYPE} = payload['#{PAYLOAD_TYPE}'] ?? newState.#{parent}.#{PAYLOAD_TYPE};
  void StartConfig() {
    map['REDUCER_CLONE_ITEM']=REDUCER_CLONE_ITEM;
  }
  void PAYLOAD_TYPE() => map['PAYLOAD_TYPE']=attr;
}