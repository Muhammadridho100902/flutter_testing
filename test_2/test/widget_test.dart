// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:test_2/main.dart';
import 'package:test_2/user_model.dart';

void main() {
  // testWidgets('Counter increments smoke test', (WidgetTester tester) async {
  //   // Build our app and trigger a frame.
  //   await tester.pumpWidget(const MyApp());

  //   // Verify that our counter starts at 0.
  //   expect(find.text('0'), findsOneWidget);
  //   expect(find.text('1'), findsNothing);

  //   // Tap the '+' icon and trigger a frame.
  //   await tester.tap(find.byIcon(Icons.add));
  //   await tester.pump();

  //   // Verify that our counter has incremented.
  //   expect(find.text('0'), findsNothing);
  //   expect(find.text('1'), findsOneWidget);
  // });

  group("Test Class User", (){

    User user = User();

    test('The type of Id must be int', (){
      expect(user.Id, isA<int>());
    });

    test('The type of Name must be String', (){
      expect(user.Name, isA<String>());
    });

    test('The default value from Id is = 0 : Name is = No Name', (){
      expect(user.Id, equals(0));
      expect(user.Name, equals("No Name"));
    });
  });

  group("Test Custom User", (){

    User user1 = User(Id: 1);
    User user2 = User(Name: 'ridho');
    User user3 = User(Id: 1, Name: 'ridho');

    test('The paramater (Id) is valid', (){
      expect(user1.Id, equals(1));
      expect(user1.Name, equals('No Name'));
    });

    test('The paramater (name) is valid', (){
      expect(user2.Id, equals(0));
      expect(user2.Name, equals('ridho'));
    });

    test('The paramater (name) and (Id) is correct', (){
      expect(user3.Id, equals(1));
      expect(user3.Name, equals('ridho'));
    });

    // flutter pub run build_runner build
  });
}
