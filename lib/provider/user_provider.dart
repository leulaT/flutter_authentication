import 'package:flutter/material.dart';

class CurrentUser {
  final String userToken;

  CurrentUser({
    required this.userToken,
  });
}

class UserProvider with ChangeNotifier {
  CurrentUser? _currentUser;

  CurrentUser? get getCurrentUserInfo => _currentUser;

  //update in time of user change!
  addCurrentUser(CurrentUser currentUser) {
    _currentUser = currentUser;
    notifyListeners();
  }
}
