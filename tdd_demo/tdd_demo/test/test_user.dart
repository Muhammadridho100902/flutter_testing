import 'package:flutter_test/flutter_test.dart';
import 'package:tdd_demo/user.dart';

void main() {
  group('Class User', () {
    User user = User();

    test("The type of Id must be int", () {
      expect(user.id, isA<int>());
    });
    test("The type of name must be String", () {
      expect(user.name, isA<String>());
    });
    test("The default value from id is = 0 : name is = No Name", () {
      expect(user.id, equals(0));
      expect(user.name, equals("No Name"));
    });
  });
}
