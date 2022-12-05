import 'package:get/get.dart';

import '../controllers/group_controller.dart';

class GroupBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GroupController>(
      () => GroupController(),
    );
  }
}
