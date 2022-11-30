import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:tunegem_io/pages/structure.dart';
import 'package:tunegem_io/routes.dart';



void main() {
  runApp(const TunegemIO());
}

class TunegemIO extends StatelessWidget {
  const TunegemIO({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      builder: (context, child) {
        return ResponsiveWrapper.builder(
          Structure(),
          minWidth: 360,
          maxWidth: 1920,
        );
      },
      onGenerateRoute: (settings) {
        return Routes.fadeThrough(settings, (context) => Structure());
      },
    );
  }
}
