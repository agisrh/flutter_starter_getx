import 'package:get/get.dart';
import '../controllers/helper_controller.dart';

class ExampleBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(SplashController());
  }
}
