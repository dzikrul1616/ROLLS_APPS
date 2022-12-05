import 'package:get/get.dart';

import '../controllers/forgot_password_page_controller.dart';

class ForgotPasswordPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ForgotPasswordPageController>(
      () => ForgotPasswordPageController(),
    );
  }
}
