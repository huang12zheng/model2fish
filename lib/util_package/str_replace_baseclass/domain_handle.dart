import 'dart:mirrors';
import 'handle.dart';

class DomainHandle<T> extends Handle{
  T _domain;
  DomainHandle({T domain,Map<String,dynamic> json,Map<String,String> map}):super(map)
  {
    /// case 1:  set domain;
    if (domain != null) {_domain=domain;   return; }
    /// case 3: input json, You will get a domain now.
    if (json   != null) { _setDomain(json);return; }
    /// case 2: no input json, You need set domain later. just use XX.domain = domain;
    return;
    
    
  }

  void _setDomain(Map<String, dynamic> json) {
    ClassMirror classMirror = reflectClass(T);
    var instance = classMirror.newInstance(Symbol('fromJson'), [json]);
    if (instance.reflectee == null) throw('Domain need a build!!');
    this._domain = instance.reflectee;
  }
  T get domain =>
    _domain == null ? throw('DomainHandle need a build!!') : _domain;
  set domain(T domain) => _domain=domain;
}