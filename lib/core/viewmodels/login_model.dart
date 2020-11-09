
import 'package:provider_architecture/core/services/authenticationservice.dart';
import 'package:provider_architecture/core/viewmodels/base_model.dart';
import 'package:provider_architecture/locator.dart';
import 'package:provider_architecture/core/enums/viewState.dart';

//There will be two states in the view

class LoginModel extends BaseModel {
  //State management code

  //Initial value will be idle state so put that in the private variable state

  //Calling the authenticationService from the locator
  final AuthenticationService _authenticationService =
      locator<AuthenticationService>();
  String errorMessage;
  Future<bool> login(String userIdText) async {
    setState(viewState.Busy);

    var userId = int.tryParse(userIdText);
    if (userId == null) {
      errorMessage = "value enetered is not a number";
      setState(viewState.Idle);
      return false;
    }
    var success = await _authenticationService.login(userId);

    setState(viewState.Idle);
    return success;
  }
}
