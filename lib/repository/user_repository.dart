import 'package:api_test_using_unit_test/models/user_model.dart';
import 'package:http/http.dart';

class UserRepository {
  final Client client;

  UserRepository(this.client);

  Future<List<UserModel>> getUsers() async {
    final response = await client.get(
      Uri.parse('https://jsonplaceholder.typicode.com/users'),
    );

    if (response.statusCode == 200) {
      return userModelFromJson(response.body);
    } else {
      // Ensure an exception is thrown for non-200 responses
      throw Exception(
          'Failed to load users with status code: ${response.statusCode}');
    }
  }
}
