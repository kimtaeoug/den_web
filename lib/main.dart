import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:tunegem_io/pages/structure.dart';
import 'package:url_strategy/url_strategy.dart';



void main() {
  setPathUrlStrategy();
  runApp(const TunegemIO());
}

class TunegemIO extends StatelessWidget {
  const TunegemIO({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      home: Structure(),
    );
  }
}
