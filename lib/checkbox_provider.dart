import 'package:flutter/material.dart';

//Check box için ayrı bir provider oluşturma işlemi
class CheckboxProvider with ChangeNotifier{

  //CheckBox Seçili Mi?
  bool _checkboxIsItSelected = false;

  //Checkbox get
  bool get checkboxIsItSelected => _checkboxIsItSelected;

  //Checkbox set
  set checkboxIsItSelected(bool value) {
    _checkboxIsItSelected = value;
    notifyListeners();
  }
}