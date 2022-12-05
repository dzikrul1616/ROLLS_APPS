import 'package:get/get.dart';

import '../controllers/konten_controller.dart';

class KontenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<KontenController>(
      () => KontenController(),
    );
  }
}
