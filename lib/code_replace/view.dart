import 'package:model2fish/util_package/index.dart';

class ViewHandle extends DomainHandle<Domain>{
  ViewHandle({Map<String,dynamic> json,Map<String,String> map}):super(json:json,map:map)
  {
    template();
  }

  void startConfig() {
    map['OUTSTR_VIEW']=OUTSTR_VIEW;
  }

  void template(){
    startConfig();
    DOMAINNAME();
    strBuild('OUTSTR_VIEW');
  }

  void DOMAINNAME() => map['DOMAINNAME'] = domain.domainName;
}

