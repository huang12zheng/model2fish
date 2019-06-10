part of 'state.dart';

class InitStateHandle extends DomainHandle<Attrs>{
  Attrs attrs;
  Map<String,String> map;
  InitStateHandle({this.attrs,this.map}):super(domain:attrs,map:map){
    template();
  }
  void StartConfig() => map['INITSTATE']='';
  template(){
    StartConfig();
    for (Attr attr in attrs.datas){
      map['INITSTATE']+='\n  '+attrHandle(attr);;
    }
  }
}