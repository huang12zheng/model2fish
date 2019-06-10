import 'util_str.dart';

class Handle {
  Map<String,String> map={};

  replaceAll(String parent,String son){
    map[parent]=map[parent].replaceAll('#{${son}}', map[son]);
  }

  strBuild(String parent){
    if (map[parent]==null){
      throw('$parent is need');
    }
    
    List<String> sons = getSons(map[parent]);

    if (sons.isEmpty) return map[parent];
    for (String son in sons) {
      if (map[son]==null) {
        if (parent.startsWith('OUT')) print("$son is need");
        continue;
      }
      strBuild(son);
      replaceAll(parent, son);
    }
  }

  getSons(String parent){
    return getMatchList(parent).toSet().toList();
  }

  Handle([Map<String,String> map]) {
    if (map==null) { this.map={}; return;} else
    { this.map=map; }
  }
  
}


