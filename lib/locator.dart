import 'package:get_it/get_it.dart';
import 'package:provider_architecture/core/services/authenticator.dart';
import 'package:provider_architecture/core/viewmodel/comment_view_model.dart';
import 'package:provider_architecture/core/viewmodel/home_view_model.dart';
import 'package:provider_architecture/core/viewmodel/login_view_model.dart';

import 'core/services/api.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  // we will not be creating a new instance of these object every time we need it
  locator.registerLazySingleton(() => AuthenticationService());
  locator.registerLazySingleton(() => Api());

  locator.registerLazySingleton(() => LoginViewModel());

  // Will create a new instance of our HomeViewModel every time it is requested for
  locator.registerFactory(() => HomeViewModel());

  locator.registerFactory(() => CommentsModel());
}
