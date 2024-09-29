import 'package:flutter/material.dart';
import 'package:portfolio/screen/desktop.dart';
import 'package:portfolio/screen/mobile.dart';
import 'package:portfolio/screen/tablet.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth > 1232) {
        return const DesktopScreen();
      } else if (constraints.maxWidth > 990) {
        return const TabletScreen();
      } else {
        return const MobileScreen();
      }
    });
  }
}
