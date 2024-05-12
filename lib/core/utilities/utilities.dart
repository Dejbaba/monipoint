import 'dart:math';

class Utilities{

  static List<String> images = [
    'assets/images/sample_interior_1.jpeg',
    'assets/images/sample_interior_2.jpeg',
    'assets/images/sample_interior_3.jpeg',
    'assets/images/sample_interior_4.jpeg'
  ];

  static List<String> navIcons = [
    'assets/icons/search.svg',
    'assets/icons/message.svg',
    'assets/icons/home.svg',
    'assets/icons/favorite.svg',
    'assets/icons/profile.svg',
  ];

  static List<String> options = [
    'assets/icons/areas.svg',
    'assets/icons/wallet.svg',
    'assets/icons/infastructure.svg',
    'assets/icons/stack_2.svg',
  ];

  static List<String> optionDescription = [
    'Cosy areas',
    'Price',
    'Infrastructure',
    'Without any layer',
  ];

  static String formatInput({required String input}){
    return input.substring(0, 1) + ' ' + input.substring(1);
  }

  static String randomImage(){
    final randomIndex = Random().nextInt(images.length);
    return images[randomIndex];
  }

  static String navIcon({required int index}){
    return navIcons[index];
  }
}