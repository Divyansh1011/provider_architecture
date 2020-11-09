import 'package:get_it/get_it.dart';
import 'package:provider_architecture/core/services/api.dart';
import 'package:provider_architecture/core/services/authenticationservice.dart';
import 'package:provider_architecture/core/services/postservices.dart';
import 'package:provider_architecture/core/viewmodels/comments_model.dart';
import 'package:provider_architecture/core/viewmodels/home_model.dart';
import 'package:provider_architecture/core/viewmodels/like_button_model.dart';
import 'package:provider_architecture/core/viewmodels/login_model.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() =>
      LoginModel()); //Registering the login model for the injection dependency
  locator.registerLazySingleton(() => AuthenticationService());

  locator.registerLazySingleton(() => Api());

  locator.registerLazySingleton(
      () => HomeModel()); //Locator registerd affirmative good to go
  locator.registerLazySingleton(() => CommentsModel());
  locator.registerLazySingleton(() => PostServices());
  locator.registerLazySingleton(() => LikeButtonModel());
}
