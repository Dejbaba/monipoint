import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


class SampleMapViewModel extends ChangeNotifier{

  String _mapTheme = '';
  String get mapTheme => _mapTheme;
  set mapTheme(String val) => _mapTheme = val;


  bool _selected = true;
  bool get selected => _selected;
  set selected(bool val){
    _selected = val;
    notifyListeners();
  }

  bool _toggleText = true;
  bool get toggleText => _toggleText;


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