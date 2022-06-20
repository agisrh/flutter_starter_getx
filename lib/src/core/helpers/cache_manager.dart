import '../config/env.dart';
import 'package:get_storage/get_storage.dart';

mixin CacheManager {
  GetStorage box = GetStorage(Env.keyApps);

  // Save Cache
  Future<bool> setLocalStorage(String key, var value) async {
    await box.write(key, value);
    return true;
  }

  // Get Cahce
  getLocalStorage(String key) {
    return box.read(key);
  }

  // Remove Cache
  Future<void> removeLocalStorage(String key) async {
    await box.remove(key);
  }

  // Erase cache
  Future<void> eraseLocalStorage() async {
    await box.erase();
  }
}
