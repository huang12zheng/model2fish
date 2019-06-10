import 'package:model2fish/util_package/index.dart';
part 'effect_method.dart';
part 'effect_method_item.dart';

class EffectHandle extends DomainHandle<Domain>{
  Effects effects;
  EffectHandle({Map<String,dynamic> json,Map<String,String> map}):super(json:json,map:map)
  {
    effects= Effects(domain.actions.datas);
    template();
  }

  void startConfig() {
    map['OUTSTR_EFFECT']=OUTSTR_EFFECT;
  }

  void DOMAINNAME() => map['DOMAINNAME'] = domain.domainName;
  void DOMAINNAME_TYPE() => map['DOMAINNAME_TYPE'] = domain.domainName+'Effect';
  /// 'ToDoEditAction.onChangeTheme: _onChangeTheme,'
  void EFFECT_DECLARE(){
    map['EFFECT_DECLARE']=effects.toDefindStr();
    if (map['EFFECT_DECLARE']!='') map['EFFECT_DECLARE']+='\n  ';
  }
  void template(){
    startConfig();

    DOMAINNAME();
    DOMAINNAME_TYPE();
    EFFECT_DECLARE();
    EFFECT_METHOD();
    strBuild('OUTSTR_EFFECT');
  }

  void EFFECT_METHOD() {
    EffectMethodHandle handle = EffectMethodHandle(actions:effects,map:map);
    map['EFFECT_METHOD']=handle.map['EFFECT_METHOD'];
  }
}

