


import 'package:dashboard/core/cubit/parent_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

extension MyTheme on BuildContext{
  ThemeData get getTheme => Theme.of(this);
}

extension MyLocalization on String {
  String get tr => ParentCubit.instance.local[this] ?? toUpperCase();
}