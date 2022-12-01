import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tunegem_io/controller/structure_controller.dart';
import 'package:tunegem_io/page_contents_data.dart';
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
          width: structureController.initWidth.value,
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
              title: structureController.isKorean.value
                  ? reportTitle
                  : reportTitleEn,
              subTitle: structureController.isKorean.value
                  ? reportSubTitle
                  : reportSubTitleEn,
              subTitle2: structureController.isKorean.value
                  ? reportSubTitle2
                  : reportSubTitle2En,
              textPadding2: 26,
              isDeskTop: true),
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
                  ? reportTitle
                  : reportTitleEn,
              subTitle: structureController.isKorean.value
                  ? reportSubTitle
                  : reportSubTitleEn,
              subTitle2: structureController.isKorean.value
                  ? reportSubTitle2
                  : reportSubTitle2En,
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
        structureController.isKorean.value
            ? 'assets/images/content_3.png'
            : 'assets/images/content_3_en.png',
        fit: BoxFit.fitHeight,
      ),
    );
  }
}
