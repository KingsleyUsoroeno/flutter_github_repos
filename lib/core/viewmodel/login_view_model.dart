import 'package:provider_architecture/core/services/authenticator.dart';
import 'package:provider_architecture/core/viewmodel/base_model.dart';

import '../../locator.dart';
import '../viewstate.dart';

class LoginViewModel extends BaseModel {
  // Inject our Api
  final _authenticationService = locator<AuthenticationService>();
  String errorMessage = "";

  Future<bool> login(String userIdText) async {
    if (userIdText.isEmpty || userIdText == null) {
      errorMessage = "Value entered is not a number";
      notifyListeners();
      return false;
    }

    setState(ViewState.Busy);

    int userId = int.tryParse(userIdText);
    var success = await _authenticationService.login(userId);

    setState(ViewState.Idle);
    return success;
  }
}
