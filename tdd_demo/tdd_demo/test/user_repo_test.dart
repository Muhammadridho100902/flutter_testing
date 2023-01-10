import 'package:dio/dio.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:tdd_demo/user.dart';
import 'package:tdd_demo/user_repo.dart';

import 'user_repo_test.mocks.dart';

import 'package:flutter_test/flutter_test.dart';

@GenerateMocks([Dio])
void main() {
  test("Get user test (success)", () async {
    Dio dio = MockDio();

    when(dio.get("https://reqres.in/api/users/2")).thenAnswer((_) async {
      return Future.value(
        Response<dynamic>(
            data: {
              "data": {
                "id": 2,
                "email": "janet.weaver@reqres.in",
                "first_name": "Janet",
                "last_name": "Weaver",
                "avatar": "https://reqres.in/img/faces/2-image.jpg"
              },
              "support": {
                "url": "https://reqres.in/#support-heading",
                "text":
                    "To keep ReqRes free, contributions towards server costs are appreciated!"
              }
            },
            statusCode: 200,
            requestOptions:
                RequestOptions(path: "https://reqres.in/api/users/2")),
      );
    });

    User? user = await UserRepository(dio: dio).getUser(2);

    expect(user, isNotNull);
    expect(user?.id, equals(2));
    expect(user?.name, "JanetWeaver");
  });

  test(
    "Get User Test (Failed)",
    () async {
      Dio dio = MockDio();


      when(dio.get("https://reqres.in/api/users/23")).thenAnswer((_) async {
        return Future.value(
          Response<dynamic>(
              data: {},
              statusCode: 404,
              requestOptions:
                  RequestOptions(path: "https://reqres.in/api/users/23")),
        );
      });

      User? user = await UserRepository(dio: dio).getUser(23);

      expect(user, isNull);
    },
  );
}
