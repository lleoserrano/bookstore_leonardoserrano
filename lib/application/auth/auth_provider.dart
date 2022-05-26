import 'package:flutter/material.dart';

import '../../models/user/user_model.dart';

class AuthProvider extends ChangeNotifier {
  late UserModel _userModel;
  UserModel get user => _userModel;

  Future<void> initialLoad() async {
    //Load data local Ex (Flutter Security Storage)
    //We use a default user, but the architecture is ready to support multiple users.
    // For test change ID
    _userModel = UserModel(id: 0, userName: 'Leonardo Serrano');
    notifyListeners();
  }
}
