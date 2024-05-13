import 'dart:math';

class Utilities{

  ///list or random images
  static List<String> images = [
    'assets/images/sample_interior_1.jpeg',
    'assets/images/sample_interior_2.jpeg',
    'assets/images/sample_interior_3.jpeg',
    'assets/images/sample_interior_4.jpeg'
  ];

  ///list of bottom nav icons
  static List<String> navIcons = [
    'assets/icons/search.svg',
    'assets/icons/message.svg',
    'assets/icons/home.svg',
    'assets/icons/favorite.svg',
    'assets/icons/profile.svg',
  ];

  ///list of icons for action menu on sample map
  static List<String> options = [
    'assets/icons/areas.svg',
    'assets/icons/wallet.svg',
    'assets/icons/infastructure.svg',
    'assets/icons/stack_2.svg',
  ];

  ///list of 'descriptions' for action menu on sample map
  static List<String> optionDescription = [
    'Cosy areas',
    'Price',
    'Infrastructure',
    'Without any layer',
  ];

  ///adds a space btw the first character of a string and the other characters
  static String formatInput({required String input}){
    final _input = input.trim();
    if(_input.length > 1)
      return input.substring(0, 1) + ' ' + input.substring(1);
    return _input;
  }

  ///picks and return an image asset at random from the image list
  static String randomImage(){
    final randomIndex = Random().nextInt(images.length);
    return images[randomIndex];
  }

  ///returns a navIcon asset based on position(index)
  static String navIcon({required int index}){
    return navIcons[index];
  }
}