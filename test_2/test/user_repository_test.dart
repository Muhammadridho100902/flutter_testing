import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test_2/user_model.dart';

import 'user_repository_test.mocks.dart';

@GenerateMocks([Dio])
void main() {
  test('Get user (Success)', () {
    Dio dio = MockDio();
    String url = "https://reqres.in/api/users/2";
    when(dio.get(url)).thenAnswer((_) async {
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
          requestOptions: RequestOptions(path: url),
        ),
      );
    });

    User user = await UserRepository(dio: Dio).getUser(2);

    expect(user, isNotNull);
    expect(user.Id, equals(2));
    expect(user.Name, equals("Janet Weaver"));

  });
}
