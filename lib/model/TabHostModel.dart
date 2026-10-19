

import 'package:flutter/cupertino.dart';

class TabHostModel{
  final Widget page;
  final String selectedIconUrl;
  final String unselectedIconUrl;
  final String tabName;
  TabHostModel({
    required this.page,
    required this.selectedIconUrl,
    required this.tabName,
  required this.unselectedIconUrl});
}