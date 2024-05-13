import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


class SampleMapViewModel extends ChangeNotifier{

  ///map style theme
  String _mapTheme = '';
  String get mapTheme => _mapTheme;
  set mapTheme(String val) => _mapTheme = val;


  ///shows/hide action menu on sample map
  bool _selected = true;
  bool get selected => _selected;
  set selected(bool val){
    _selected = val;
    notifyListeners();
  }

  ///toggles the state of the custom marker on the sample map
  bool _toggleText = true;
  bool get toggleText => _toggleText;


  ///updates the state of the toggle of the custom marker
  updateToggle({bool firstCall = true, bool refreshUi = false}){

    if(firstCall){
      _toggleText = true;
      return;
    }

    _toggleText = !_toggleText;

    if(refreshUi)
      notifyListeners();
  }



}

final mapVm = ChangeNotifierProvider<SampleMapViewModel>((ref){
  return SampleMapViewModel();
});