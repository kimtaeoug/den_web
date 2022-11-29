import 'package:flutter/material.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:tunegem_io/controller/structure_controller.dart';
import 'package:tunegem_io/pages/common.dart';

class AnalyzingPage extends StatelessWidget {
  AnalyzingPage({Key? key}) : super(key: key);
  final Common common = Common();
  final StructureController structureController = Get.find();

  @override
  Widget build(BuildContext context) {
    double totalWidth = MediaQuery.of(context).size.width;
    double totalHeight = MediaQuery.of(context).size.height;
    return Obx(() {
      return Container(
        width: structureController.initWidth.value,
        color: Colors.white,
        child: _nowStructure(totalWidth, totalHeight),
      );
    });
  }

  Widget _nowStructure(double w, double h) {
    if (w > 1024) {
      return Center(
        child: SizedBox(
          width: structureController.initWidth.value * 0.63,
          height: Get.height,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [textWidget(w, h), imageWidget(w, h)],
          ),
        ),
      );
    } else if (w > 360) {
      return Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: structureController.initHeight.value * 80 / 1409,
            ),
            imageWidget(w, h),
            SizedBox(
              height: structureController.initHeight.value * 70 / 1409,
            ),
            textWidget(w, h),
            SizedBox(
              height: structureController.initHeight.value * 100 / 1409,
            )
          ],
        ),
      );
    } else {
      return Container();
    }
  }

  Widget textWidget(double w, double h) {
    return SizedBox(
      height: h * 374 / 1080,
      child: FittedBox(
        child: common.textContent(
            title: 'KPOP 전문\n보컬 트레이너들에게 받는\n보컬 분석 ',
            subTitle:
                '짧은 노래 영상을 올려보세요!\nSM, YG등 4대 기획사에서 아이돌 보컬 트레이닝을 담당한\n전문 보컬 트레이너들이 직접 분석한 리포트를 제공합니다',
            textPadding: 32),
      ),
    );
  }

  Widget imageWidget(double w, double h) {
    return SizedBox(
      height: h * 810 / 1080,
      child: Image.asset(
        'assets/images/content_2.png',
        fit: BoxFit.fitHeight,
      ),
    );
  }
}
