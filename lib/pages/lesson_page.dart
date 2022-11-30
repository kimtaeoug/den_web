import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tunegem_io/controller/structure_controller.dart';
import 'package:tunegem_io/pages/common.dart';
import 'package:tunegem_io/pages/end_container.dart';

import 'break_point.dart';

class LessonPage extends StatelessWidget {
  LessonPage({Key? key}) : super(key: key);
  final Common common = Common();
  double totalWidth = 0;
  double totalHeight = 0;
  final StructureController structureController = Get.find();

  @override
  Widget build(BuildContext context) {
    totalWidth = MediaQuery.of(context).size.width;
    totalHeight = MediaQuery.of(context).size.height;
    return Obx(() {
      if (totalWidth > BreakPoint.tablet) {
        return SizedBox(
          width: structureController.initWidth.value,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  width: structureController.initWidth.value,
                  height: totalHeight,
                  color: const Color(0xffF8F8FA),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      _bigImage(totalHeight, BreakPoint.desktop),
                      const SizedBox(
                        width: 21,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          _deskTopTextWidget(
                              totalWidth, totalHeight, BreakPoint.desktop),
                          SizedBox(
                            height: structureController.initHeight.value *
                                80 /
                                1080,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              _deskTopImageItem(
                                  totalHeight, 'assets/images/content_5_1.png'),
                              _deskTopImageItem(
                                  totalHeight, 'assets/images/content_5_2.png'),
                              _deskTopImageItem(
                                  totalHeight, 'assets/images/content_5_3.png')
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                ),
                _bottomContainer(totalWidth, totalHeight, BreakPoint.desktop),
                EndContainer(input: BreakPoint.desktop)
              ],
            ),
          ),
        );
      } else if (totalWidth > BreakPoint.smallTablet) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: totalHeight * 80 / 1302,
            ),
            _bigImage(totalHeight, BreakPoint.tablet),
            SizedBox(
              height: totalHeight * 73 / 1302,
            ),
            _deskTopTextWidget(totalWidth, totalHeight, BreakPoint.tablet),
            SizedBox(
              height: totalHeight * 100 / 1302,
            ),
            _bottomContainer(totalWidth, totalHeight, BreakPoint.tablet),
            EndContainer(input: BreakPoint.tablet)
          ],
        );
      } else if (totalWidth > BreakPoint.mobile) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: totalHeight * 83 / 1371,
            ),
            _bigImage(totalHeight, BreakPoint.smallTablet),
            SizedBox(
              height: totalHeight * 73 / 1371,
            ),
            _deskTopTextWidget(totalWidth, totalHeight, BreakPoint.smallTablet),
            SizedBox(
              height: totalHeight * 100 / 1371,
            ),
            _bottomContainer(totalWidth, totalHeight, BreakPoint.smallTablet),
            EndContainer(input: BreakPoint.smallTablet)
          ],
        );
      } else {
        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            _bigImage(totalHeight, BreakPoint.mobile),
            _deskTopTextWidget(totalWidth, totalHeight, BreakPoint.mobile),
            _bottomContainer(totalWidth, totalHeight, BreakPoint.mobile),
            EndContainer(input: BreakPoint.mobile)
          ],
        );
      }
    });
  }

  Widget _bottomContainer(double w, double h, double input) {
    double containerHeight = h * 425 / 1080;
    double contentWidth = structureController.initWidth.value * 0.4;
    if (input == BreakPoint.tablet) {
      containerHeight = h * 383 / 1302;
      contentWidth = w * 0.75;
    } else if (input == BreakPoint.smallTablet) {
      containerHeight = h * 383 / 1371;
      contentWidth = w * 0.86;
    } else if (input == BreakPoint.mobile) {
      containerHeight = h * 318 / 843;
      contentWidth = w * 294 / 360;
    } else {
      containerHeight = h * 425 / 1080;
      contentWidth = structureController.initWidth.value * 0.4;
    }
    return Container(
      width: structureController.initWidth.value,
      height: containerHeight,
      color: const Color(0xffFC3A81),
      child: Center(
        child: SizedBox(
          width: contentWidth,
          child: FittedBox(
            child: _bottomContent(w, h, input),
          ),
        ),
      ),
    );
  }

  Widget _bottomContent(double w, double h, double input) {
    double titleFontSize = 48;
    double subTitleFontSize = 34;
    double centerPadding = 40;
    double buttonPadding = 24;
    double buttonHeight = 80;
    if (input == BreakPoint.tablet) {
      titleFontSize = 38;
      subTitleFontSize = 34;
      centerPadding = 40;
      buttonPadding = 24;
      buttonHeight = 80;
    } else if (input == BreakPoint.smallTablet) {
      titleFontSize = 30;
      subTitleFontSize = 30;
      centerPadding = 40;
      buttonPadding = 16;
      buttonHeight = 66.29;
    } else if (input == BreakPoint.mobile) {
      titleFontSize = 28;
      subTitleFontSize = 24;
      centerPadding = 32;
      buttonPadding = 8;
      buttonHeight = 41.14;
    } else {
      titleFontSize = 48;
      subTitleFontSize = 34;
      centerPadding = 40;
      buttonPadding = 24;
      buttonHeight = 80;
    }
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 91),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'K-POP PLAYGROUND TUNEGEM',
            style: GoogleFonts.notoSans(
                color: Colors.white,
                fontSize: titleFontSize,
                fontWeight: FontWeight.w700),
          ),
          Text(
            '지금 시작해보세요!',
            style: GoogleFonts.notoSans(
                color: Colors.white,
                fontSize: subTitleFontSize,
                fontWeight: FontWeight.w400),
          ),
          SizedBox(
            height: centerPadding,
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: buttonHeight,
                child: Image.asset(
                  'assets/images/app_store.png',
                  fit: BoxFit.fitHeight,
                ),
              ),
              SizedBox(
                width: buttonPadding,
              ),
              SizedBox(
                height: buttonHeight,
                child: Image.asset(
                  'assets/images/play_store.png',
                  fit: BoxFit.fitHeight,
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  Widget _deskTopTextWidget(double w, double h, double input) {
    double height = structureController.initHeight.value * 236 / 1080;
    if (input == BreakPoint.tablet) {
      height = h * 231 / 1302;
    } else if (input == BreakPoint.smallTablet) {
      height = h * 300 / 1371;
    } else if (input == BreakPoint.mobile) {
      height = h * 207 / 843;
    } else {
      height = structureController.initHeight.value * 236 / 1080;
    }
    if (input == BreakPoint.smallTablet) {
      return Padding(
        padding: EdgeInsets.symmetric(horizontal: w * 60 / 601),
        child: SizedBox(
          height: height,
          child: FittedBox(
            child: common.textContent(
                title: '현직 아이돌 보컬 선생님에게\n직접 받는 KPOP 노래 레슨',
                subTitle: '검증된 KPOP 전문가 집단인 현직 아이돌 보컬 선생님에게\n직접 노래 레슨을 받아보세요.'),
          ),
        ),
      );
    } else if (input == BreakPoint.mobile) {
      return Padding(
        padding: EdgeInsets.symmetric(horizontal: w * 24 / 360),
        child: SizedBox(
          height: height,
          child: FittedBox(
            child: common.textContent(
                title: '현직 아이돌 보컬 선생님에게\n직접 받는 KPOP 노래 레슨',
                subTitle: '검증된 KPOP 전문가 집단인 현직 아이돌 보컬 선생님에게\n직접 노래 레슨을 받아보세요.'),
          ),
        ),
      );
    } else {
      return SizedBox(
        height: height,
        child: FittedBox(
          child: common.textContent(
              title: '현직 아이돌 보컬 선생님에게\n직접 받는 KPOP 노래 레슨',
              subTitle: '검증된 KPOP 전문가 집단인 현직 아이돌 보컬 선생님에게\n직접 노래 레슨을 받아보세요.'),
        ),
      );
    }
  }

  Widget _deskTopImageItem(double h, String asset) {
    return SizedBox(
      height: h * 412 / 1080,
      child: Image.asset(
        asset,
        fit: BoxFit.fitHeight,
      ),
    );
  }

  Widget _bigImage(double h, double input) {
    double height = structureController.initHeight.value * 765 / 1080;
    if (input == BreakPoint.tablet) {
      height = h * 765 / 1302;
    } else if (input == BreakPoint.smallTablet) {
      height = h * 765 / 1371;
    } else if (input == BreakPoint.mobile) {
      height = h * 490 / 843;
    } else {
      height = structureController.initHeight.value * 765 / 1080;
    }
    return SizedBox(
      height: height,
      child: Image.asset(
        'assets/images/content_5.png',
        fit: BoxFit.fitHeight,
      ),
    );
  }
}
