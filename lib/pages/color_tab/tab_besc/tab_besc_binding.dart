import 'package:get/get.dart';

import 'tab_besc_logic.dart';

class TabBescBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(
      PageLogic(),
      permanent: true,
    );
  }
}
