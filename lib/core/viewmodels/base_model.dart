import 'package:flutter/foundation.dart';
import 'package:provider_architecture/core/enums/viewState.dart';

class BaseModel extends ChangeNotifier {
  //All state management code
  viewState _state = viewState.Idle;

  viewState get state => _state; //Getter method to get the sate

  //Setter method to set the sate

   void setState(viewState s) {
    _state = s;
    notifyListeners();
  }
}
