
=
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../core/routing/my_route.dart';
import 'core/cubit/parent_cubit.dart';
import 'core/extentions/build_context_extension.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  MaterialApp materialApp = MaterialApp(
    debugShowCheckedModeBanner: false,
   // home: DashboardPage(),
    onGenerateInitialRoutes: (_)=> MyRoute.initialRoutes,
    onGenerateRoute: MyRoute.onNavigateByName,
    theme: MyTheme.instance.light,
    darkTheme: MyTheme.instance.light ,
    themeMode: ParentCubit.instance.themeMode,
  );
  runApp( materialApp);
}


