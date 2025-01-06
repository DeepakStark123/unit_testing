import 'package:api_test_using_unit_test/models/user_model.dart';
import 'package:api_test_using_unit_test/repository/user_repository.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class MyHomePage extends StatelessWidget {
  final UserRepository userRepository = UserRepository(Client());

  MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Homepage'),
      ),
      body: FutureBuilder<List<UserModel>>(
        future: userRepository.getUsers(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No users found'));
          } else {
            final users = snapshot.data!;
            return ListView.builder(
              itemCount: users.length,
              itemBuilder: (context, index) {
                final user = users[index];
                return ListTile(
                  title: Text(user.name),
                  subtitle: Text(user.website),
                );
              },
            );
          }
        },
      ),
    );
  }
}
