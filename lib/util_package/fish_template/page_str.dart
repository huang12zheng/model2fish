const String OUTSTR_PAGE='''
import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class #{DOMAINNAME}Page extends Page<#{DOMAINNAME}State, #{PARENT}State> {
  #{DOMAINNAME}Page():
  super(
    initState: initState,
    effect: buildEffect(),
    reducer: buildReducer(),
    view: buildView,
    middleware: <Middleware<#{DOMAINNAME}State>>[
      logMiddleware(tag: '#{DOMAINNAME}Page'),
    ],
  );
}
''';