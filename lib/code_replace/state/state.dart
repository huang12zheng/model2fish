import 'package:model2fish/util_package/index.dart';
part 'state_init.dart';
part 'attr.dart';

class StateHandle extends DomainHandle<Domain>{
  // State states;
  Attrs attrs;
  StateHandle({Map<String,dynamic> json,Map<String,String> map}):super(json:json,map:map)
  {
    attrs = domain.attrs;
    template();
  }

  void startConfig() {
    map['OUTSTR_STATE']=OUTSTR_STATE;
  }
  void template(){
    startConfig();

    DOMAINNAME();
    DOMAINNAME_TYPE();
    STATE_DEFINE();
    STATE_CLONE();
    PARENT();
    INITSTATE();
    strBuild('OUTSTR_STATE');
  }
  void DOMAINNAME() => map['DOMAINNAME'] = domain.domainName;
  void DOMAINNAME_TYPE() => map['DOMAINNAME_TYPE'] = domain.domainName+'State';
  /// 'ToDoEditAction.onChangeTheme: _onChangeTheme,'
  void STATE_DEFINE(){
    map['STATE_DEFINE']=attrs.toStringTemplate(ToStringStragery.DEFINE);
    map['PARENT_TYPE']=domain.Parent+'State';
  }

  void STATE_CLONE(){
    map['STATE_CLONE'] = 
      attrs.datas.map(
        (attr)=>'\n      ..${attr.attr} = ${attr.attr}'
      ).join('');
  }
  void PARENT(){
    map['PARENT']=domain.Parent;
  }
  void INITSTATE(){
    InitStateHandle handle = InitStateHandle(attrs:attrs);
    map['INITSTATE']=handle.map['INITSTATE'];
  }
  
}

