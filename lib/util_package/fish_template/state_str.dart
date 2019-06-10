const String OUTSTR_STATE='''import 'package:flutter/material.dart';

class #{DOMAINNAME_TYPE} implements Cloneable<#{DOMAINNAME_TYPE}> {
  #{STATE_DEFINE}

  @override
  #{DOMAINNAME_TYPE} clone() {
    return #{DOMAINNAME_TYPE}()#{STATE_CLONE};
  }
}

#{DOMAINNAME_TYPE} initState(#{PARENT} arg) {
  final #{DOMAINNAME_TYPE} state = #{DOMAINNAME_TYPE}();
#{INITSTATE}

  return state;
}
''';
// String INITSTATE='''
//   #{INITSTATE_PARENT}
//   #{INITSTATE_OTHER_STATE}
// ''';

// String INITSTATE_OTHER='''''';
