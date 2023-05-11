import 'dart:async';

import 'package:crm_app/common_widgets/common_widgets_view.dart';
import 'package:crm_app/theme/theme_service.dart';
import 'package:crm_app/utility/assets_utility.dart';
import 'package:crm_app/utility/color_utility.dart';
import 'package:crm_app/utility/constants.dart';
import 'package:crm_app/utility/screen_utility.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'app_binding/app_bindings.dart';
import 'common_widgets/common_methods.dart';
import 'controllers/general_controller.dart';
import 'home/home_screen.dart';
import 'login/login_screen.dart';
import 'utility/common_methods.dart';

final getPreferences = GetStorage();

pref() async {
  await GetStorage.init();
}

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  pref();
  if (readThemePref() == systemDefault) {
    if (SchedulerBinding.instance.window.platformBrightness ==
        Brightness.dark) {
      ThemeService().saveThemeToBox(true);
    } else {
      ThemeService().saveThemeToBox(false);
    }
  }
  // runApp(DevicePreview(
  //   enabled: true,
  //   builder: (context) =>  const MyApp(), // Wrap your app
  // ),);
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'CRM App',
      useInheritedMediaQuery: true,
      // locale: DevicePreview.locale(context),
      // builder: DevicePreview.appBuilder,
      debugShowCheckedModeBanner: false,
      initialBinding: AppBinding(),
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      builder: (context, child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
          child: child!,
        );
      },
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with WidgetsBindingObserver {

  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    Future.delayed(const Duration(milliseconds: 10), () {
      GeneralController.to.isDarkMode.value = ThemeService().loadThemeFromBox();
    });
    Timer(const Duration(seconds: 3), () {
      if (getIsLogin()) {
        Get.off(() => const HomeScreen());
      } else {
        Get.off(() => const LoginScreen());
      }
    });
    SystemChrome.setApplicationSwitcherDescription(const ApplicationSwitcherDescription(
      label: "200",
      primaryColor: 4
    ));
    super.initState();
  }

  @override
  void didChangePlatformBrightness() {
    if (readThemePref() == systemDefault) {
      systemDefaultTheme();
    }
    super.didChangePlatformBrightness();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image(image: splashImage,height: getScreenHeight(context) / 3),
            commonVerticalSpacing(spacing: 30),
            commonHeaderTitle(
              title: "Let’s accelerate your",
              fontSize: 1.8,
              fontWeight: 1
            ),
            commonVerticalSpacing(spacing: 6),
            commonHeaderTitle(
              title: "Digital Transformation",
              fontSize: 2,
              fontWeight: 2,
              isChangeColor: true,
              color: yellowColor
            ),
          ],
        ),
      ),
    );
  }
}
