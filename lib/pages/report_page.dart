import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tunegem_io/controller/structure_controller.dart';
import 'package:tunegem_io/pages/common.dart';

import 'break_point.dart';

class ReportPage extends StatelessWidget {
  ReportPage({Key? key}) : super(key: key);
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
        color: const Color(0xffF8F8FA),
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
              imageWidget(w, h, BreakPoint.desktop),
              textWidget(w, h, BreakPoint.desktop),
            ],
          ),
        ),
      );
    } else if (w > BreakPoint.tablet) {
      return Center(
        child: SizedBox(
          width: structureController.initWidth.value * 0.63,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: w * 60 / 1440),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                imageWidget(w, h, BreakPoint.desktop),
                textWidget(w, h, BreakPoint.desktop),
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
              title: '보컬 분석 체계를 바탕으로 한\n프리미엄 리포트',
              subTitle:
                  '보컬 영역별 (음정, 템포, 호흡컨트롤, 리듬감, 고음 안정감,\n표현력) 상세분석, 성장 가능성, FMSO유형, 추천 K-POP\n소속사 등을 알고 싶다면 프리미엄 리포트를 확인해보세요!',
              subTitle2:
                  '보컬 분석 체계는 K-POP 전문 보컬 트레이너가\n15년 이상 연구한 내용을 바탕으로 만들어졌습니다.',
              textPadding2: 26),
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
              title: '보컬 분석 체계를 바탕으로 한\n프리미엄 리포트',
              subTitle:
                  '보컬 영역별 (음정, 템포, 호흡컨트롤, 리듬감, 고음 안정감,\n표현력) 상세분석, 성장 가능성, FMSO유형, 추천 K-POP\n소속사 등을 알고 싶다면 프리미엄 리포트를 확인해보세요!',
              subTitle2:
                  '보컬 분석 체계는 K-POP 전문 보컬 트레이너가\n15년 이상 연구한 내용을 바탕으로 만들어졌습니다.',
              textPadding2: 26),
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
        'assets/images/content_3.png',
        fit: BoxFit.fitHeight,
      ),
    );
  }
}
