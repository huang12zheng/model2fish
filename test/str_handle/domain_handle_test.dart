
import 'package:model2fish/util_package/index.dart';
import 'package:test/test.dart';

import '../../example/model2code_example.dart';

void main() {
  group('DomainHandle test', () {
    test('null test', () {
      DomainHandle<Domain> handle=DomainHandle<Domain>();
      expect(handle.map, {});
    });
    test('json test', () {
      DomainHandle<Domain> handle=DomainHandle<Domain>(json:TodoEdit);
      expect(handle.map, {});
      expect(handle.domain.toString(), Domain.fromJson(TodoEdit).toString());
    });
    test('map test', () {
      DomainHandle<Domain> handle=DomainHandle<Domain>(map:{});
      expect(handle.map, {});
    });
    
  });

}