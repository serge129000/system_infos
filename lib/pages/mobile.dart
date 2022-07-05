import 'package:flutter/material.dart';
class Mobile extends StatefulWidget {
  const Mobile({Key? key}) : super(key: key);

  @override
  State<Mobile> createState() => _MobileState();
}

class _MobileState extends State<Mobile> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    double textscale = MediaQuery.of(context).textScaleFactor;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(
          top: 10,
          left: 25,
          right: 25
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [],
        ),
      ),
    );
  }
}
