import 'package:flutter/material.dart';
import 'package:system_infos/pages/index.dart';

void main(List<String> args) {
  runApp( MaterialApp(
    title: "SYSTEM INFOS",
    debugShowCheckedModeBanner: false,
    theme:ThemeData.dark(),
    home: const Index(),
  ));
}
