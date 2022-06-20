import 'package:get/get.dart';
import '../helpers/helpers.dart';

class SplashController extends GetxController with CacheManager {
  @override
  void onInit() {
    requestPermission();
    super.onInit();
  }

  Future init() async {
    final _isLoggedIn = await getLocalStorage('LOGIN');
    if (_isLoggedIn != null && _isLoggedIn != false) {
      Get.offAllNamed('/home');
    } else {
      Get.offAllNamed('/auth/login');
    }
  }

  // Request Permission
  Future<void> requestPermission() async {
    // Map<Permission, PermissionStatus> statuses = await [
    //   Permission.location,
    //   Permission.camera,
    // ].request();
    // print(statuses[Permission.camera]);
  }
}
