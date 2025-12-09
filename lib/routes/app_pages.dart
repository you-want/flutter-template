import 'package:get/get.dart';

import '../feature/main/bindings/main_binding.dart';
import '../feature/main/views/main_view.dart';
import '../feature/main/views/profile_view.dart';
import '../feature/update/bindings/update_binding.dart';
import '../feature/update/views/update_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static final routes = [
    GetPage(
      name: _Paths.MAIN,
      page: () => const MainView(),
      binding: MainBinding(),
    ),
    // Demo routes temporarily removed to unblock Material migration preview
    GetPage(
      name: _Paths.PROFILE,
      page: () => const ProfileView(),
    ),
    GetPage(
      name: _Paths.UPDATE,
      page: () => const UpdateView(),
      binding: UpdateBinding(),
    ),
  ];
}
