import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';
import 'package:get/route_manager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tunegem_io/controller/structure_controller.dart';
import 'package:tunegem_io/pages/break_point.dart';
import 'package:tunegem_io/pages/common.dart';

class IntroPage extends StatelessWidget {
  IntroPage({Key? key}) : super(key: key);

  final Common common = Common();

  final StructureController structureController = Get.find();

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Container(
      width: structureController.initWidth.value,
      color: const Color(0xffFC3A81),
      child: Obx(() {
        if (w > BreakPoint.smallDeskTop) {
          return Center(
            child: SizedBox(
              width: structureController.initWidth.value * 0.63,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  topWidget(h, BreakPoint.desktop),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      leftContent(w, h, BreakPoint.desktop),
                      rightContent(w, h, BreakPoint.desktop)
                    ],
                  ),
                  bottomWidget(h)
                ],
              ),
            ),
          );
        } else if (w > BreakPoint.tablet) {
          return Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 60),
              child: SizedBox(
                width: w > 1200
                    ? structureController.initWidth.value * 0.63
                    : w * 12 / 14,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    topWidget(h, BreakPoint.smallDeskTop),
                    SizedBox(
                      width: w > 1200
                          ? structureController.initWidth.value * 0.63
                          : w * 12 / 14,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          leftContent(w, h, BreakPoint.smallDeskTop),
                          rightContent(w, h, BreakPoint.smallDeskTop)
                        ],
                      ),
                    ),
                    bottomWidget(h)
                  ],
                ),
              ),
            ),
          );
        } else if (w > BreakPoint.smallTablet) {
          return Center(
            child: SizedBox(
              width: w * 784 / 1024,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  topWidget(h, BreakPoint.tablet),
                  const SizedBox(
                    height: 50,
                  ),
                  rightContent(w, h, BreakPoint.tablet),
                  const SizedBox(
                    height: 40,
                  ),
                  leftContent(w, h, BreakPoint.tablet),
                  const SizedBox(
                    height: 89,
                  )
                ],
              ),
            ),
          );
        } else if (w > BreakPoint.mobile) {
          return Center(
            child: SizedBox(
              width: w * 480 / 600,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  topWidget(h, BreakPoint.tablet),
                  const SizedBox(
                    height: 75,
                  ),
                  rightContent(w, h, BreakPoint.tablet),
                  const SizedBox(
                    height: 68,
                  ),
                  leftContent(w, h, BreakPoint.tablet),
                  const SizedBox(
                    height: 174,
                  )
                ],
              ),
            ),
          );
        } else {
          return Center(
            child: SizedBox(
              width: w * 312 / 360,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  topWidget(h, BreakPoint.tablet),
                  const SizedBox(
                    height: 34,
                  ),
                  rightContent(w, h, BreakPoint.tablet),
                  const SizedBox(
                    height: 51,
                  ),
                  leftContent(w, h, BreakPoint.tablet),
                  const SizedBox(
                    height: 45,
                  )
                ],
              ),
            ),
          );
        }
      }),
    );
  }

  Widget topWidget(double h, double input) {
    double padding = structureController.initHeight.value * 40 / 1080;
    if (input == BreakPoint.desktop || input == BreakPoint.smallDeskTop) {
      padding = structureController.initHeight.value * 40 / 1080;
    } else {
      if (input == BreakPoint.tablet || input == BreakPoint.smallTablet) {
        padding = h * 40 / 1448;
      } else {
        padding = h * 40 / 859;
      }
    }
    return Padding(
      padding: EdgeInsets.only(top: padding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [common.logo(), language()],
      ),
    );
  }

  Widget bottomWidget(double h) {
    return Padding(
      padding: EdgeInsets.only(
          bottom: structureController.initHeight.value * 32 / 1080),
      child: Image.asset(
        'assets/images/down_button.png',
        width: 24,
        fit: BoxFit.fitWidth,
        filterQuality: FilterQuality.high,
      ),
    );
  }

  TextStyle textStyle = GoogleFonts.notoSans(
      color: Colors.white, fontSize: 14, fontWeight: FontWeight.w700);

  //isKorean
  Widget language() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () => structureController.isKorean.value = false,
          child: Text(
            'ENG',
            style: textStyle,
          ),
        ),
        common.infoItemFence(textStyle, Colors.white),
        GestureDetector(
          onTap: () => structureController.isKorean.value = true,
          child: Text(
            'KOR',
            style: textStyle,
          ),
        )
      ],
    );
  }

  Widget leftContent(double w, double h, double input) {
    if (input == BreakPoint.desktop) {
      return SizedBox(
        width: structureController.initWidth.value * 578 / 1920,
        child: FittedBox(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
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
                structureController.isKorean.value
                    ? '보컬 분석 및 리포트, 기획사 오디션 지원, 보컬 레슨까지'
                    : 'Vocal analysis and Report, application for\nan agency audition and even vocal lessons!',
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
                  GestureDetector(
                    onTap: () {
                      structureController.launchWeb(
                          'https://apps.apple.com/kr/app/tunegem-%EC%BC%80%EC%9D%B4%ED%8C%9D-%EB%85%B8%EB%9E%98-%ED%85%8C%EC%8A%A4%ED%8A%B8/id1572957226');
                    },
                    child: Image.asset(
                      'assets/images/app_store.png',
                      width: 240,
                      fit: BoxFit.fitWidth,
                      filterQuality: FilterQuality.high,
                    ),
                  ),
                  const SizedBox(
                    width: 24,
                  ),
                  GestureDetector(
                    onTap: () {
                      structureController.launchWeb(
                          'https://play.google.com/store/apps/details?id=com.vittio.tunegem');
                    },
                    child: Image.asset(
                      'assets/images/play_store.png',
                      width: 240,
                      fit: BoxFit.fitWidth,
                      filterQuality: FilterQuality.high,
                    ),
                  )

                  //https://play.google.com/store/apps/details?id=com.vittio.tunegem
                ],
              )
            ],
          ),
        ),
      );
    } else if (input == BreakPoint.smallDeskTop) {
      // w > 1100 ? structureController.initWidth.value * 501 / 1920 : structureController.initWidth.value * 451/1920,
      return SizedBox(
        width: w > 1200
            ? structureController.initWidth.value * 578 / 1920
            : w * 578 / 1440,
        child: FittedBox(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
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
                structureController.isKorean.value
                    ? '보컬 분석 및 리포트, 기획사 오디션 지원, 보컬 레슨까지'
                    : 'Vocal analysis and Report, application for\nan agency audition and even vocal lessons!',
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
                    filterQuality: FilterQuality.high,
                  ),
                  const SizedBox(
                    width: 24,
                  ),
                  Image.asset(
                    'assets/images/play_store.png',
                    width: 240,
                    fit: BoxFit.fitWidth,
                    filterQuality: FilterQuality.high,
                  )
                ],
              )
            ],
          ),
        ),
      );
    } else {
      double width = w * 578 / 1024;
      if (input == BreakPoint.tablet) {
        width = w * 578 / 1024;
      } else if (input == BreakPoint.smallTablet) {
        width = w * 476 / 601;
      } else {
        width = w * 312 / 360;
      }
      return SizedBox(
        width: width,
        child: FittedBox(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
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
                structureController.isKorean.value
                    ? '보컬 분석 및 리포트, 기획사 오디션 지원, 보컬 레슨까지'
                    : 'Vocal analysis and Report, application for\nan agency audition and even vocal lessons!',
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
                  GestureDetector(
                    onTap: () {
                      structureController.launchWeb(
                          'https://apps.apple.com/kr/app/tunegem-%EC%BC%80%EC%9D%B4%ED%8C%9D-%EB%85%B8%EB%9E%98-%ED%85%8C%EC%8A%A4%ED%8A%B8/id1572957226');
                    },
                    child: Image.asset(
                      'assets/images/app_store.png',
                      width: 240,
                      fit: BoxFit.fitWidth,
                      filterQuality: FilterQuality.high,
                    ),
                  ),
                  const SizedBox(
                    width: 24,
                  ),
                  GestureDetector(
                    onTap: () {
                      structureController.launchWeb(
                          'https://play.google.com/store/apps/details?id=com.vittio.tunegem');
                    },
                    child: Image.asset(
                      'assets/images/play_store.png',
                      width: 240,
                      fit: BoxFit.fitWidth,
                      filterQuality: FilterQuality.high,
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      );
    }
  }
  
  Widget rightContent(double w, double h, double input) {

    if (input == BreakPoint.desktop || input == BreakPoint.smallDeskTop) {
      return SizedBox(
        width: w > 1200
            ? structureController.initWidth.value * 501 / 1920
            : w * 451 / 1440,
        child: Image.asset(
          structureController.isKorean.value
              ? 'assets/images/content_1.png'
              : 'assets/images/content_1_en.png',
          fit: BoxFit.fitWidth,
          filterQuality: FilterQuality.high,
        ),
      );
    } else {
      double width = w * 512 / 1024;
      if (input == BreakPoint.tablet) {
        width = w * 512 / 1024;
      } else if (input == BreakPoint.smallTablet) {
        width = Get.width;
      } else {
        width = Get.width;
      }
      return Stack(
        children: [
          SizedBox(
            width: width,
            height: width * 742 / 617,
          ),
          SizedBox(
            width: width,
            child: Image.asset(
              structureController.isKorean.value
                  ? 'assets/images/content_1.png'
                  : 'assets/images/content_1_en.png',
              fit: BoxFit.fitWidth,
              filterQuality: FilterQuality.high,
            ),
          )
        ],
      );
    }
  }
}
