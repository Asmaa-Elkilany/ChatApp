import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'core/routing/my_route.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  bool onboarding = prefs.getBool("onboarding") ?? false;
  MaterialApp materialApp = MaterialApp(
    builder: DevicePreview.appBuilder,
    useInheritedMediaQuery: true,
    debugShowCheckedModeBanner: false,
    onGenerateRoute: MyRoute.onNavigateByName,
    onGenerateInitialRoutes: (_) => MyRoute.initialRoutes,
  );
  runApp(
    DevicePreview(enabled: true, builder: (context) => materialApp),
    // MyApp(onboarding: onboarding)
  );
}