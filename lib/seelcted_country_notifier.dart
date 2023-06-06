import 'package:flutter/cupertino.dart';

import 'screens/auth_screens/sign_up_screen.dart';

class SelectedCountry extends ValueNotifier<Country?> {
  SelectedCountry() : super(null);

  update(Country country) {
    value = country;
    notifyListeners();
  }
}