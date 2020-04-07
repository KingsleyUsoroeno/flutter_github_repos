import 'package:get_it/get_it.dart';
import 'package:provider_architecture/core/services/api.dart';
import 'package:provider_architecture/core/viewmodel/home_viewmodel.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  // we will not be creating a new instance of these object every time we need it
  locator.registerLazySingleton(() => ApiService());

  // Will create a new instance of our HomeViewModel every time it is requested for
  locator.registerFactory(() => HomeViewModel());
}
