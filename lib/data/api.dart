import 'package:week2_state_manager/models/user.dart';

abstract class Api {
  Future<User> login(String email, String password);
}

class ApiImpl implements Api {
  final _users = [
    User(name: 'Developer', email: 'developer@gmail.com'),
    User(name: 'Wahyu', email: 'wahyu@gmail.com'),
    User(name: 'Daniel', email: 'daniel'),
  ];

  @override
  Future<User> login(String email, String password) async {
    return Future.delayed(
      const Duration(seconds: 1),
      () {
        return _users.firstWhere(
          (element) => element.email == email && password == 'crocodichebat',
          orElse: () => throw Exception('Login failed'),
        );
      },
    );
  }
}
