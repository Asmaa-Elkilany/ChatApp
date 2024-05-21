import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'core/routing/my_route.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );


  final prefs = await SharedPreferences.getInstance();
  bool onboarding = prefs.getBool("onboarding") ?? false;
  MaterialApp materialApp = MaterialApp(
    builder: DevicePreview.appBuilder,
    debugShowCheckedModeBanner: false,
    onGenerateRoute: MyRoute.onNavigateByName,
    onGenerateInitialRoutes: (_) => MyRoute.initialRoutes,
  );
  runApp(
    DevicePreview(enabled:kReleaseMode, builder: (context) => materialApp),
    // MyApp(onboarding: onboarding)
  );
}
// void main(){
//   WidgetsFlutterBinding.ensureInitialized();
//   runApp(Test());
// }
// class Test extends StatelessWidget {
//   const Test({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(),
//     );
//   }
// }
