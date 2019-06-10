part of 'reducer.dart';

class ReducerCloneHandle extends DomainHandle<Attrs>{
  Attrs attrs;
  Map<String,String> map;
  ReducerCloneHandle({this.attrs,this.map}):super(domain:attrs,map:map){
    template();
  }
  template(){
    StartConfig();
    for (Attr attr in attrs.datas){
      ReducerCloneItemHandle handle = ReducerCloneItemHandle(attr.attr);
      map['REDUCER_CLONE']=map['REDUCER_CLONE']+'  '+handle.map['REDUCER_CLONE_ITEM'];
    }
    // strBuild('REDUCER_CLONE');
  }
  // REDUCER_METHOD_ITEM
  // void _#{ACTION_TYPE}(Action action, Context<#{DOMAINNAME_TYPE}> ctx) {}
  void StartConfig() => map['REDUCER_CLONE']='';
}