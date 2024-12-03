import 'package:get/get.dart';

import '../color_first/color_first_logic.dart';
import '../color_second/color_second_logic.dart';
import 'color_tab_logic.dart';

class ColorTabBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ColorTabLogic());
    Get.lazyPut(() => ColorFirstLogic());
    Get.lazyPut(() => ColorSecondLogic());
  }
}
