// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:system_infos/pages/desktop.dart';
import 'package:system_infos/pages/mobile.dart';

class Index extends StatefulWidget {
  const Index({Key? key}) : super(key: key);

  @override
  State<Index> createState() => _IndexState();
}

bool color_d = false;

class _IndexState extends State<Index> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: ((context, constraints) {
      if (constraints.maxWidth < 600) {
        return Mobile();
      } else {
        return Desktop();
      }
    }));
  }
}
