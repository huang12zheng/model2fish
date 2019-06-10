import 'package:model2fish/util_package/index.dart';

class PageHandle extends DomainHandle<Domain>{
  PageHandle({Map<String,dynamic> json,Map<String,String> map}):super(json:json,map:map)
  {
    template();
  }

  void startConfig() {
    map['OUTSTR_PAGE']=OUTSTR_PAGE;
  }

  void template(){
    startConfig();
    DOMAINNAME();
    PARENT();
    strBuild('OUTSTR_PAGE');
  }

  void DOMAINNAME() => map['DOMAINNAME'] = domain.domainName;
  void PARENT() {
    map['PARENT'] = domain.Parent;
  }
}

