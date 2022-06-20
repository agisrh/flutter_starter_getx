import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'src/routes/routes.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.root,
      getPages: routes,
      enableLog: true,
      logWriterCallback: localLogWriter,
    );
  }

  void localLogWriter(String text, {bool isError = false}) {
    //print('LOG : ' + text);
  }
}
