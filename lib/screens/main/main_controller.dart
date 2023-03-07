import 'package:get/get.dart';

class MainController extends GetxController {
  /// ------------------------
  /// VARIABLES
  /// ------------------------

  final _selectedIndex = 0.obs;

  /// ------------------------
  /// GETTERS
  /// ------------------------

  int get selectedIndex => _selectedIndex.value;

  /// ------------------------
  /// SETTERS
  /// ------------------------

  set selectedIndex(value) => _selectedIndex.value = value;
}
