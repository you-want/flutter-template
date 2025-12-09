import 'package:get/get.dart';

import '../logics/main_logic.dart';
import '../logics/base_demo_logic.dart';
import '../logics/network_demo_logic.dart';
import '../logics/utils_demo_logic.dart';
import '../logics/theme_demo_logic.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MainLogic>(() => MainLogic());

    // Register demo controllers used by MainView's PageView children
    Get.lazyPut<BaseDemoLogic>(() => BaseDemoLogic(), fenix: true);
    Get.lazyPut<NetworkDemoLogic>(() => NetworkDemoLogic(), fenix: true);
    Get.lazyPut<UtilsDemoLogic>(() => UtilsDemoLogic(), fenix: true);
    Get.lazyPut<ThemeDemoLogic>(() => ThemeDemoLogic(), fenix: true);
  }
}
