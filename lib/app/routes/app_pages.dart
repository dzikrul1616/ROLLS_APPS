import 'package:get/get.dart';

import '../modules/ForgotPasswordPage/bindings/forgot_password_page_binding.dart';
import '../modules/ForgotPasswordPage/views/forgot_password_page_view.dart';
import '../modules/LoginView/bindings/login_view_binding.dart';
import '../modules/LoginView/views/login_view_view.dart';
import '../modules/Register/bindings/register_binding.dart';
import '../modules/Register/views/register_view.dart';
import '../modules/add/bindings/add_binding.dart';
import '../modules/add/views/add_view.dart';
import '../modules/calculator/bindings/calculator_binding.dart';
import '../modules/calculator/views/calculator_view.dart';
import '../modules/edit_profil/bindings/edit_profil_binding.dart';
import '../modules/edit_profil/views/edit_profil_view.dart';
import '../modules/editdata/bindings/editdata_binding.dart';
import '../modules/editdata/views/editdata_view.dart';
import '../modules/group/bindings/group_binding.dart';
import '../modules/group/views/group_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/konten/bindings/konten_binding.dart';
import '../modules/konten/views/konten_view.dart';
import '../modules/notification/bindings/notification_binding.dart';
import '../modules/notification/views/notification_view.dart';
import '../modules/product/bindings/product_binding.dart';
import '../modules/product/views/product_view.dart';
import '../modules/profil/bindings/profil_binding.dart';
import '../modules/profil/views/profil_view.dart';
import '../modules/setting/bindings/setting_binding.dart';
import '../modules/setting/views/setting_view.dart';
import '../widgets/splash.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => convexbottombar(),
      // binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN_VIEW,
      page: () => const Login(),
      binding: LoginViewBinding(),
    ),
    GetPage(
      name: _Paths.REGISTER,
      page: () => const RegisterView(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: _Paths.GROUP,
      page: () => GroupView(),
      binding: GroupBinding(),
    ),
    GetPage(
      name: _Paths.PROFIL,
      page: () => const ProfilView(),
      binding: ProfilBinding(),
    ),
    GetPage(
      name: _Paths.NOTIFICATION,
      page: () => NotificationView(),
      binding: NotificationBinding(),
    ),
    GetPage(
      name: _Paths.ADD,
      page: () => AddView(),
      binding: AddBinding(),
    ),
    GetPage(
      name: _Paths.KONTEN,
      page: () => KontenView(),
      binding: KontenBinding(),
    ),
    GetPage(
      name: _Paths.PRODUCT,
      page: () => const ProductView(),
      binding: ProductBinding(),
    ),
    GetPage(
      name: _Paths.EDITDATA,
      page: () => const EditdataView(),
      binding: EditdataBinding(),
    ),
    GetPage(
      name: _Paths.FORGOT_PASSWORD_PAGE,
      page: () => const ForgotPasswordView(),
      binding: ForgotPasswordPageBinding(),
    ),
    GetPage(
      name: _Paths.CALCULATOR,
      page: () => Calculator(),
      binding: CalculatorBinding(),
    ),
    GetPage(
      name: _Paths.EDIT_PROFIL,
      page: () => EditProfilView(),
      binding: EditProfilBinding(),
    ),
    GetPage(
      name: _Paths.SETTING,
      page: () => const SettingView(),
      binding: SettingBinding(),
    ),
  ];
}
