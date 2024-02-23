import 'package:get/get.dart';

import '../view/bottom_navigation.dart';
import '../view/detail_show.dart';
import '../view/homescreen.dart';
import '../view/startpage.dart';

class DetailController extends GetxController {
  final List<String> image = [
    'assets/images/priceimage1.png',
    'assets/images/priceimage-2.jpeg',
    'assets/images/priceimage3.jpg',
  ].obs;
  final List<String> text2 =
      ['with Milk', 'with Cream+Cookies', 'without Milk'].obs;

  final List<String> price = [
    '\$6.75',
    '\$7.55',
    '\$6.15',
  ].obs;
  final List<String> name = [
    'BigMac + Fries',
    'BigMac + Fries + Coke',
  ].obs;

  final List<String> images = [
    'assets/images/dealimage1.jpeg',
    'assets/images/dealimage2.jpeg',
  ].obs;
  final List<String> prices = [
    '\$12.75',
    '\$13.75',
  ].obs;
  final List<String> reducedPrices = [
    '\$20.55',
    '\$22.25',
  ].obs;
}

final view = Get.put(DetailController());
appRoutes() => [
      GetPage(
        name: '/start',
        page: () => OpenScreen(),
        transition: Transition.zoom,
      ),
      GetPage(
        name: '/home',
        page: () => BottomNavigationScreen(),
        transition: Transition.zoom,
      ),
    ];
