import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'localization.dart';
import 'pages.dart';
import 'services/alice_service.dart';
import 'services/app_lifecycle_service.dart';
import 'services/connectivity_service.dart';
import 'services/device_info_service.dart';
import 'services/dio_service.dart';
import 'services/location_service.dart';
import 'services/logger_service.dart';
import 'services/package_info_service.dart';
import 'services/storage_service.dart';
import 'theme.dart';

///
/// Function first called when running our project
///

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  /// Initialize [Logger] and [Alice]
  Get
    ..put(LoggerService())
    ..put(AliceService());

  /// Run the `FlutterDriverAssistanceApp` app
  runApp(FlutterDriverAssistanceApp());
}

///
/// This binding will get triggered once the app is running
/// It will initialize all services we need throughout the app
///

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    Get
      ..put(AppLifecycleService())
      ..put(DeviceInfoService())
      ..put(DioService())
      ..put(PackageInfoService())
      ..put(StorageService())
      ..put(LocationService())
      ..put(ConnectivityService());
  }
}

///
/// Starting point of our Flutter application
///

class FlutterDriverAssistanceApp extends StatelessWidget {
  final logger = Get.find<LoggerService>();
  final alice = Get.find<AliceService>().alice;

  /// Logs everything using [Logger] package
  void loggingWithLogger(String text, {bool isError = false}) =>
      isError ? logger.e(text) : logger.d(text);

  @override
  Widget build(BuildContext context) => ScreenUtilInit(
        /// Size of `iPhone 14`
        designSize: const Size(390, 844),
        builder: (_, __) => GetMaterialApp(
          navigatorKey: alice.getNavigatorKey(),
          onGenerateTitle: (_) => 'appName'.tr,
          theme: theme,
          darkTheme: darkTheme,
          themeMode: ThemeMode.light,
          initialRoute: DARoutes.splashScreen,
          initialBinding: InitialBinding(),
          getPages: pages,
          logWriterCallback: loggingWithLogger,
          locale: Localization.locale,
          fallbackLocale: Localization.fallbackLocale,
          translations: Localization(),
          debugShowCheckedModeBanner: false,
        ),
      );
}
