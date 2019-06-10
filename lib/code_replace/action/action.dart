import 'package:model2fish/util_package/index.dart';

part 'action_creator.dart';
part 'action_creator_item.dart';

class ActionHandle extends DomainHandle<Domain>{
  // need declare type, or it would be dynamic
  ActionHandle({Map<String,dynamic> json,Map<String,String> map}):
    super(json:json,map:map){
      template();
    }

  void startConfig() {
    map['OUTSTR_ACTIONS']=OUTSTR_ACTIONS;
  }

  void DOMAINNAME(){
    map['DOMAINNAME'] = domain.domainName;
  }
  void ACTION_TYPE(){
    map['ACTION_TYPE'] = domain.actions.toDefindStr();
  }

  void template(){
    startConfig();
    DOMAINNAME();
    ACTION_TYPE();
    ACTION_METHOR_STR();
    strBuild('OUTSTR_ACTIONS');
  }

  void ACTION_METHOR_STR() {
    ActionCreatorHandle handle = ActionCreatorHandle(actions:domain.actions,map:map);
    map['ACTION_METHOR_STR']=handle.map['ACTION_METHOR_STR'];
  }
}

