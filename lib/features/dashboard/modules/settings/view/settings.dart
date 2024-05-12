import 'package:auth/features/dashboard/modules/settings/view/themenotifier.dart';
import 'package:flutter/material.dart';
import 'package:group_radio_button/group_radio_button.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:auth/features/dashboard/modules/settings/view/color.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  String _selectedColor= " Purple";
  List<String> _colors =["Dark","Light","Purple"];
void onThemeChange(String value, ThemeNotifier themeNotifier) async{
  if (value=="Dark") {
    themeNotifier = themeNotifier.setTheme (darkTheme);
  }else if (value=="Light"){
    themeNotifier = themeNotifier.setTheme (lightTheme);
  }else{
    themeNotifier = themeNotifier.setTheme (purpleTheme);
  }
  final pref = await SharedPreferences.getInstance();
  pref.setString("ThemeMode", value);
}


  @override
  Widget build(BuildContext context) {
  final themeNotifier =Provider.of<ThemeNotifier>(context);
  themeNotifier.getTheme;

    return Scaffold(
    body: Container(child: Center(
    child: MaterialButton(
    color:Theme.of(context).primaryColor,
    onPressed: () {
           themChangeDialog(themeNotifier);
    },
    child: const Text("Change Theme", style: TextStyle(color: Colors.white),))))
    ); // Scaffold

  }

  themChangeDialog(ThemeNotifier themeNotifier) {
    showDialog(
        context: context,
        builder: (_) => StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) {
           return AlertDialog(
           content: Container(
           height: 250,
            child: Column(mainAxisAlignment: MainAxisAlignment.center,
             crossAxisAlignment: CrossAxisAlignment.center,
             children: [
               RadioGroup<String>.builder(
                   groupValue: _selectedColor,
                   onChanged: (val) {
                     setState(() {
                       _selectedColor = val!;
                     });
                     onThemeChange(_selectedColor,themeNotifier);
                     print(_selectedColor);
                   },
                   items: _colors,
                   itemBuilder: (item) => RadioButtonBuilder(item)
               ),

             ],
                ),
          ),
        actions: [
          MaterialButton(
            child: const Text("Close"),
            onPressed: () {
              Navigator.of (context).pop(true);
            },
          ),
        ],
      );
           },
    ),
    );
  }
}
