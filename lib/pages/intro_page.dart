import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';
import 'package:get/route_manager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:logger/logger.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:tunegem_io/controller/intro_controller.dart';
import 'package:tunegem_io/controller/structure_controller.dart';
import 'package:tunegem_io/pages/common.dart';
import 'package:tunegem_io/support_ui.dart';

class IntroPage extends StatelessWidget {
  IntroPage({Key? key}) : super(key: key);

  IntroController introController = Get.put(IntroController());

  final Common common = Common();

  final Logger logger = Logger(printer: PrettyPrinter());

  @override
  Widget build(BuildContext context) {
    double totalWidth = MediaQuery.of(context).size.width;
    double totalHeight = MediaQuery.of(context).size.height;
    return Container(
      width: structureController.initWidth.value,
      color: const Color(0xffFC3A81),
      child: introStructure(totalWidth, totalHeight),
    );
  }

  GlobalKey deskTopWidgetKey = GlobalKey();

  Widget introStructure(double w, double h) {
    return Obx(() {
      if (w > 1024) {
        return Center(
          child: SizedBox(
            width: structureController.initWidth.value * 0.63,
            height: h,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                topWidget(h),
                SizedBox(
                  width: structureController.initWidth.value * 0.63,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      leftContent(h),
                      rightContent(h),
                    ],
                  ),
                ),
                bottomWidget(h)
              ],
            ),
          ),
        );
      } else if (w > 360) {
        return Center(
          child: SizedBox(
            width: structureController.initWidth.value * 0.76,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: structureController.initWidth.value * 0.76,
                  child: topWidget(h),
                ),
                SizedBox(
                  width: structureController.initWidth.value * 0.76,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: h * 50 / 1448,
                      ),
                      rightContent(h),
                      SizedBox(
                        height: h * 40 / 1448,
                      ),
                      leftContent(h),
                      SizedBox(
                        height: h * 90 / 1448,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      } else {
        return Container();
      }
    });
  }

  Widget topWidget(double h) {
    return Padding(
      padding: EdgeInsets.only(top: h * 40 / 1080),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [common.logo(), language()],
      ),
    );
  }

  Widget bottomWidget(double h) {
    return Padding(
      padding: EdgeInsets.only(bottom: h * 32 / 1080),
      child: Image.asset(
        'assets/images/down_button.png',
        width: 24,
        fit: BoxFit.fitWidth,
      ),
    );
  }

  Widget language() {
    TextStyle textStyle = GoogleFonts.notoSans(
      color: Colors.white, fontSize: 14, fontWeight: FontWeight.w700
    );
    return SizedBox(
      width: 107,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'ENG',
            style: textStyle,
          ),
          SizedBox(
            height: SupportUI.getTextSize('E', textStyle).height,
            child: Center(
              child: Container(
                width: 1,
                height: SupportUI.getTextSize('E', textStyle).height/2,
                color: Colors.white,
              ),
            ),
          ),
          Text(
            'KOR',
            style: textStyle,
          )
        ],
      ),
    );
  }

  Widget leftContent(double h) {
    return SizedBox(
      height: h * 480 / 1080,
      child: FittedBox(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'All About\nKpop Vocal\nTUNEGEM',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: 72,
                  fontFamily: 'nexon_b'),
            ),
            SizedBox(
              height: h * 40 / 1080,
            ),
            Text(
              '보컬 분석 및 리포트, 기획사 오디션 지원, 보컬 레슨까지',
              style: GoogleFonts.notoSans(
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                  fontSize: 24),
            ),
            SizedBox(
              height: h * 56 / 1080,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.asset(
                  'assets/images/app_store.png',
                  width: 240,
                  fit: BoxFit.fitWidth,
                ),
                const SizedBox(
                  width: 24,
                ),
                Image.asset(
                  'assets/images/play_store.png',
                  width: 240,
                  fit: BoxFit.fitWidth,
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget rightContent(double h) {
    return SizedBox(
      height: h * 674 / 1080,
      child: Image.asset(
        'assets/images/content_1.png',
        fit: BoxFit.fitHeight,
      ),
    );
  }

  final StructureController structureController = Get.find();
}
