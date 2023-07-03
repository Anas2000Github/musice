import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:project_ecommerce/services/settingssettings.dart';
import 'package:project_ecommerce/view/cartpage.dart';
import 'package:project_ecommerce/view/splash_screen.dart';
import 'package:get/get.dart';
import 'package:project_ecommerce/view/temp1.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'helper/languages.dart';

SettingsServices setServ = Get.put(SettingsServices());
SharedPreferences? sharePrefs;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  sharePrefs= await SharedPreferences.getInstance();
  // await initialServices();
  runApp(DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) => const MyApp(),
  ));
}
// Future initialServices () async {
//
//   // setServ = await Get.putAsync(() => SettingsServices().init());
//   return setServ;
// }
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Blue Diamond',
      translations: Languages(),

      useInheritedMediaQuery: true,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),

      home: const SplashScreen(),
      getPages: [
        GetPage(name: "/Temp1", page: () => Temp1()),
        GetPage(name: "/cartPage", page: ()=>CartPage())
      ],
    );
  }
}
