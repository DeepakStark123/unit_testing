import 'package:api_test_using_unit_test/models/user_model.dart';
import 'package:api_test_using_unit_test/repository/user_repository.dart';
import 'package:mocktail/mocktail.dart';
import 'package:http/http.dart';
import 'package:flutter_test/flutter_test.dart';

// Mock HTTP Client
class MockHTTPClient extends Mock implements Client {}

void main() {
  late UserRepository userRepository;
  late MockHTTPClient mockHTTPClient;

  setUp(() {
    mockHTTPClient = MockHTTPClient();
    userRepository = UserRepository(mockHTTPClient);

    // Register the Client's get method for mocktail
    registerFallbackValue(Uri.parse("https://jsonplaceholder.typicode.com/users"));
  });

  group("UserRepository - ", () {
    test("should return a list of UserModel when status code is 200", () async {
      // Arrange
      when(() => mockHTTPClient.get(any())).thenAnswer((_) async {
        return Response('''
          [
            {
              "id": 1,
              "name": "Leanne Graham",
              "email": "Sincere@april.biz",
              "website": "hildegard.org"
            }
          ]
        ''', 200);
      });

      // Act
      final users = await userRepository.getUsers();

      // Assert
      expect(users, isA<List<UserModel>>());
      expect(users.isNotEmpty, true);
      expect(users.first, isA<UserModel>());
    });

    test("should throw an exception when status code is not 200", () async {
      // Arrange
      when(() => mockHTTPClient.get(any())).thenAnswer((_) async {
        return Response('{}', 500);
      });

      // Act & Assert
      expect(() async => await userRepository.getUsers(), throwsException);
    });
  });
}
