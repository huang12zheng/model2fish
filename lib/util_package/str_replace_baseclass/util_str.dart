typedef GetVal = String Function(String k,String v);
typedef SwitchStr = String Function(String str);

GetVal getShortName = (k,v) => k.split(v)[0];

List<String> getMatchList(String str,[String pattern=DEFAULT_PATTERN]){
  RegExp reg = new RegExp(pattern);
  var matches = reg.allMatches(str);
  return matches.map( (Match m)=>m.group(0)).toList();
}
const String DEFAULT_PATTERN='(?<=#{).*?(?=})';