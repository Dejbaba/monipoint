import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:monipoint/ui/pages/sample_map.dart';
import 'package:monipoint/ui/pages/statistics.dart';

class BottomNavViewModel extends ChangeNotifier{

  ///current index of the bottom nav-bar
  int _currentIndex = 2;
  int get currentIndex => _currentIndex;
  set setCurrentIndex(int value){
    _currentIndex = value;
  }

  ///shows/hides click effect on bottom nav icons
  bool _showNavEffect = false;
  bool get showNavEffect => _showNavEffect;


  ///children of the bottom Nav
  List<Widget>  _children = [
    FadeIn(
      key: UniqueKey(),
      duration: Duration(milliseconds: 600),
        child: SampleMap()),
    FadeIn(
        key: UniqueKey(),
        duration: Duration(milliseconds: 600),
        child: Container(color: Colors.blue,)),
    FadeIn(
        key: UniqueKey(),
        duration: Duration(milliseconds: 600),
        child: Statistics()),
    FadeIn(
        key: UniqueKey(),
        duration: Duration(milliseconds: 600),
        child: Container(color: Colors.blue,)),
    FadeIn(
        key: UniqueKey(),
        duration: Duration(milliseconds: 600),
        child: Container(color: Colors.blue,))
  ];
  List<Widget> get children => _children;


  ///updates the current index of the bottom nav
  updateIndex(int index){
    _currentIndex = index;
    notifyListeners();
  }

  ///resets current index value
  resetValues(){
    _currentIndex = 0;
  }

  ///updates 'showNavEffect' value
  updateState(){
    _showNavEffect = !showNavEffect;
    notifyListeners();

    Future.delayed(Duration(milliseconds: 400), () {
      _showNavEffect = false;
      print('state reverted>>>>');
    },);
  }


}

final bottomNavVm = ChangeNotifierProvider<BottomNavViewModel>((ref){
  return BottomNavViewModel();
});