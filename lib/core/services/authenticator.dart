import 'dart:async';

import 'package:provider_architecture/core/models/user.dart';

import '../../locator.dart';
import 'api.dart';

class AuthenticationService {
  // Inject our Api
  Api _api = locator<Api>();

  StreamController<User> userController = StreamController<User>();

  Future<bool> login(int userId) async {
    // Get the user profile for id
    User fetchedUser = await _api.getUserProfile(userId);

    print("fetchedUser is $fetchedUser");

    // Check if success
    bool hasUser = fetchedUser != null;

    if (hasUser) {
      userController.add(fetchedUser);
    }

    return hasUser;
  }

  void dispose() {
    userController.close();
  }
}
