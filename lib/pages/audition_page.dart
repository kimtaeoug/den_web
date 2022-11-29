import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tunegem_io/controller/structure_controller.dart';
import 'package:tunegem_io/pages/common.dart';

class AuditionPage extends StatelessWidget {
  AuditionPage({Key? key}) : super(key: key);
  final Common common = Common();

  final StructureController structureController = Get.find();
  @override
  Widget build(BuildContext context) {
    double totalWidth = MediaQuery.of(context).size.width;
    double totalHeight = MediaQuery.of(context).size.height;
    return Obx((){
      return Container(
        width: structureController.initWidth.value,
        height: totalWidth > 1024 ? Get.height : null,
        color: Colors.white,
        child: nowStructure(totalWidth, totalHeight),
      );
    });
  }

  Widget nowStructure(double w, double h){
    if (w > 1024) {
      return Center(
        child: SizedBox(
          width: structureController.initWidth.value * 0.63,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [textWidget(w, h),imageWidget(w, h), ],
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
    };
  }

  Widget textWidget(double w, double h) {
    return SizedBox(
      height: h * 370 / 1080,
      child: FittedBox(
        child: common.textContent(
            title: '프리미엄 리포트를 활용해\n더욱 간편해진\n기획사 오디션 지원',
            subTitle: '프리미엄 리포트를 분석 받고\nK-POP 기획사 오디션에 간편하게 지원해보세요',
            subTitle2: '튠잼 서비스를 통해 실제 K-POP 기획사 오디션에\n합격한 사용자가 점점 많아지고 있어요!', textPadding2: 26),
      ),
    );
  }

  Widget imageWidget(double w, double h) {
    return SizedBox(
      height: h * 810 / 1080,
      child: Image.asset(
        'assets/images/content_4.png',
        fit: BoxFit.fitHeight,
      ),
    );
  }
}
