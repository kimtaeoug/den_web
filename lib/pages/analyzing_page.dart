import 'package:flutter/material.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:tunegem_io/controller/structure_controller.dart';
import 'package:tunegem_io/pages/common.dart';

import 'break_point.dart';

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
        height: totalWidth > 1024 ? Get.height : null,
        color: Colors.white,
        child: nowStructure(totalWidth, totalHeight),
      );
    });
  }

  Widget nowStructure(double w, double h) {
    if (w > BreakPoint.smallDeskTop) {
      return Center(
        child: SizedBox(
          width: structureController.initWidth.value * 0.63,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              textWidget(w, h, BreakPoint.desktop),
              imageWidget(w, h, BreakPoint.desktop)
            ],
          ),
        ),
      );
    } else if (w > BreakPoint.tablet) {
      return Center(
        child: SizedBox(
          width: structureController.initWidth.value,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: w * 60 / 1440),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                textWidget(w, h, BreakPoint.desktop),
                imageWidget(w, h, BreakPoint.desktop)
              ],
            ),
          ),
        ),
      );
    } else if (w > BreakPoint.smallTablet) {
      return Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: h * 85 / 1409,
            ),
            imageWidget(w, h, BreakPoint.tablet),
            SizedBox(
              height: h * 73 / 1409,
            ),
            textWidget(w, h, BreakPoint.tablet),
            SizedBox(
              height: h * 100 / 1409,
            )
          ],
        ),
      );
    } else if (w > BreakPoint.mobile) {
      return Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: h * 85 / 1371,
            ),
            imageWidget(w, h, BreakPoint.smallTablet),
            SizedBox(
              height: h * 73 / 1371,
            ),
            textWidget(w, h, BreakPoint.smallTablet),
            SizedBox(
              height: h * 100 / 1371,
            )
          ],
        ),
      );
    } else {
      return Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: h * 45 / 900,
            ),
            imageWidget(w, h, BreakPoint.smallTablet),
            SizedBox(
              height: h * 35 / 900,
            ),
            textWidget(w, h, BreakPoint.smallTablet),
            SizedBox(
              height: h * 40 / 900,
            )
          ],
        ),
      );
    }
  }

  Widget textWidget(double w, double h, double input) {
    double height = structureController.initHeight.value * 370 / 1080;
    if (input == BreakPoint.tablet || input == BreakPoint.smallTablet) {
      height = h * 391 / 1459;
    } else if (input == BreakPoint.mobile) {
      height = h * 269 / 900;
    } else {
      height = structureController.initHeight.value * 370 / 1080;
    }
    if (input == BreakPoint.desktop || input == BreakPoint.smallDeskTop) {
      return SizedBox(
        height: height,
        child: FittedBox(
          child: common.textContent(
              title: structureController.isKorean.value
                  ? 'KPOP 전문\n보컬 트레이너들에게 받는\n보컬 분석'
                  : 'Special report from\nthe KPOP Vocal Coach\nGroup',
              subTitle: structureController.isKorean.value
                  ? '짧은 노래 영상을 올려보세요!\nSM, YG등 4대 기획사에서 아이돌 보컬 트레이닝을 담당한\n전문 보컬 트레이너들이 직접 분석한 리포트를 제공합니다'
                  : 'Upload a short song video!\nThe K-POP Vocal Coach Group from the major\nentertainment in Korea gives you a vocal report!',
              textPadding: 32, isDeskTop: true),
        ),
      );
    } else {
      double width = w * 578 / 1024;
      if (input == BreakPoint.tablet) {
        width = w * 578 / 1024;
      } else if (input == BreakPoint.smallTablet) {
        width = w * 485 / 601;
      } else {
        width = w * 312 / 360;
      }
      return SizedBox(
        width: width,
        height: height,
        child: FittedBox(
          child: common.textContent(
              title: structureController.isKorean.value
                  ? 'KPOP 전문\n보컬 트레이너들에게 받는\n보컬 분석'
                  : 'Special report from\nthe KPOP Vocal Coach\nGroup',
              subTitle: structureController.isKorean.value
                  ? '짧은 노래 영상을 올려보세요!\nSM, YG등 4대 기획사에서 아이돌 보컬 트레이닝을 담당한\n전문 보컬 트레이너들이 직접 분석한 리포트를 제공합니다'
                  : 'Upload a short song video!\nThe K-POP Vocal Coach Group from the major\nentertainment in Korea gives you a vocal report!',
              textPadding: 32),
        ),
      );
    }
  }

  Widget imageWidget(double w, double h, double input) {
    double height = structureController.initHeight.value * 809 / 1080;
    if (input == BreakPoint.tablet || input == BreakPoint.smallTablet) {
      height = h * 809 / 1459;
    } else if (input == BreakPoint.mobile) {
      height = h * 505 / 900;
    } else {
      height = structureController.initHeight.value * 809 / 1080;
    }
    return SizedBox(
      height: height,
      child: Image.asset(
        structureController.isKorean.value ? 'assets/images/content_2.png' : 'assets/images/content_2_en.png',
        fit: BoxFit.fitHeight,
      ),
    );
  }
}
