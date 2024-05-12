


import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../core/routing/my_route.dart';
import 'modules/settings/view/color.dart';
import 'modules/settings/view/themenotifier.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences.getInstance().then((pref) {
    var themeColor = pref.getString('ThemeMode');
    if (themeColor=="Dark") {
      activeTheme = darkTheme;
    }else if (themeColor=="Light"){
      activeTheme = lightTheme;
    }else{
      activeTheme = purpleTheme;
    }
  });

  //final themeNotifier = Provider.of<ThemeNotifier>(context);
  MaterialApp materialApp = MaterialApp(
    debugShowCheckedModeBanner: false,
   // home: DashboardPage(),
    onGenerateInitialRoutes: (_)=> MyRoute.initialRoutes,
    onGenerateRoute: MyRoute.onNavigateByName,
    theme: ThemeData(primaryColor: Colors.purple),
   // theme: themeNotifier.getTheme,
  );
  runApp(
      MultiProvider(
       providers: [
       ChangeNotifierProvider(create: (context)=>ThemeNotifier(darkTheme)),
      ],
          child: materialApp));
}


