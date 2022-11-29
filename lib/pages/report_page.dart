import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tunegem_io/controller/structure_controller.dart';
import 'package:tunegem_io/pages/common.dart';

class ReportPage extends StatelessWidget {
  ReportPage({Key? key}) : super(key: key);
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
        color: const Color(0xffF8F8FA),
        child: _nowStructure(totalWidth, totalHeight),
      );
    });
  }
  Widget _nowStructure(double w, double h) {
    if (w > 1024) {
      return Center(
        child: SizedBox(
          width: structureController.initWidth.value * 0.63,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [imageWidget(w, h), textWidget(w, h)],
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
      height: h * 370 / 1080,
      child: FittedBox(
        child: common.textContent(
            title: '보컬 분석 체계를 바탕으로 한\n프리미엄 리포트',
            subTitle:
            '보컬 영역별 (음정, 템포, 호흡컨트롤, 리듬감, 고음 안정감,\n표현력) 상세분석, 성장 가능성, FMSO유형, 추천 K-POP\n소속사 등을 알고 싶다면 프리미엄 리포트를 확인해보세요!',
            subTitle2: '보컬 분석 체계는 K-POP 전문 보컬 트레이너가\n15년 이상 연구한 내용을 바탕으로 만들어졌습니다.', textPadding2: 26),
      ),
    );
  }
  Widget imageWidget(double w, double h) {
    return SizedBox(
      height: h * 810 / 1080,
      child: Image.asset(
        'assets/images/content_3.png',
        fit: BoxFit.fitHeight,
      ),
    );
  }
}
