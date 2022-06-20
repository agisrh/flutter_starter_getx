import 'app.dart';
import 'package:get/get.dart';
import 'src/core/config/env.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'src/core/controllers/helper_controller.dart';

void main() async {
  await GetStorage.init(Env.keyApps);
  WidgetsFlutterBinding.ensureInitialized();
  Get.put(SplashController());
  runApp(const App());
}
