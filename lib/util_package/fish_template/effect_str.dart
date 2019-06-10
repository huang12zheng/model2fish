const String OUTSTR_EFFECT='''import 'package:fish_redux/fish_redux.dart';\nimport 'action.dart';\nimport 'state.dart';\n
Effect<#{DOMAINNAME_TYPE}> buildEffect() {
  return combineEffects(<Object, Effect<#{DOMAINNAME}State>>{#{EFFECT_DECLARE}});
}
#{EFFECT_METHOD}
''';
String EFFECT_METHOD_ITEM = '''

void _#{ACTION_TYPE}(Action action, Context<#{DOMAINNAME}State> ctx) {}
''';
