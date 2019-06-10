import 'package:model2fish/util_package/index.dart';

part 'reducer_method.dart';
part 'reducer_method_item.dart';
part 'reducer_clone_item.dart';
part 'reducer_clone.dart';

class ReducerHandle extends DomainHandle<Domain>{
  Reducers reducers;
  ReducerHandle({Map<String,dynamic> json,Map<String,String> map}):super(json:json,map:map)
  {
    reducers= Reducers(domain.actions.datas);
    template();
  }

  void startConfig() {
    map['OUTSTR_REDUCER']=OUTSTR_REDUCER;
  }

  void DOMAINNAME() => map['DOMAINNAME'] = domain.domainName;
  void DOMAINNAME_TYPE() => map['DOMAINNAME_TYPE'] = domain.domainName+'State';
  void REDUCER_DECLARE(){
    map['REDUCER_DECLARE']=reducers.toDefindStr();
    if (map['REDUCER_DECLARE']!='') map['REDUCER_DECLARE']+='\n    ';
  }
  void template(){
    startConfig();

    DOMAINNAME();
    DOMAINNAME_TYPE();
    REDUCER_DECLARE();
    REDUCER_METHOD();
    parent();
    strBuild('OUTSTR_REDUCER');
  }

  void REDUCER_METHOD() {
    ReducerMethodHandle handle = ReducerMethodHandle(actions:reducers,map:map);
    map['REDUCER_METHOD']=handle.map['REDUCER_METHOD'];
  }
  void parent(){
    map['parent']= domain.parent;
  }
}

