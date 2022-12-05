import 'package:get/get.dart';

import '../controllers/editdata_controller.dart';

class EditdataBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EditdataController>(
      () => EditdataController(),
    );
  }
}
