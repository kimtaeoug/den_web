import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:tunegem_io/pages/structure.dart';



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
      home: Structure(),
    );
  }
}
