import 'dart:ui';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';
import 'package:get/route_manager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tunegem_io/controller/structure_controller.dart';
import 'package:tunegem_io/page_contents_data.dart';
import 'package:tunegem_io/pages/break_point.dart';
import 'package:tunegem_io/pages/common.dart';
import 'intro_down_button.dart';

class IntroPage extends StatefulWidget {
  IntroPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _IntroPage();
}

class _IntroPage extends State<IntroPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    preLoadImage();
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    super.dispose();
  }

  List<String> precacheList = [
    'app_store',
    'play_store',
    'down_button',
    'content_1',
    'content_1_en',
    'tunegem_logo'
  ];

  void preLoadImage() {
    precacheList.map((e) {
      precacheImage(AssetImage('assets/images/$e.png'), context);
    });
  }

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
          return SingleChildScrollView(
            child: Center(
              child: SizedBox(
                width: structureController.initWidth.value * 0.63,
                height: structureController.initHeight.value,
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
                    IntroDownButton()
                  ],
                ),
              ),
            ),
          );
        } else if (w > BreakPoint.tablet) {
          return Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 60),
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
                      IntroDownButton()
                    ],
                  ),
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
                  topWidget(h, BreakPoint.smallTablet),
                  const SizedBox(
                    height: 75,
                  ),
                  rightContent(w, h, BreakPoint.smallTablet),
                  const SizedBox(
                    height: 68,
                  ),
                  leftContent(w, h, BreakPoint.smallTablet),
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
                  topWidget(h, BreakPoint.mobile),
                  const SizedBox(
                    height: 34,
                  ),
                  rightContent(w, h, BreakPoint.mobile),
                  const SizedBox(
                    height: 51,
                  ),
                  leftContent(w, h, BreakPoint.mobile),
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
        children: [
          FadeInDown(
              delay: const Duration(milliseconds: 600),
              duration: const Duration(seconds: 1),
              child: common.logo()),
          FadeInDown(
              delay: const Duration(milliseconds: 600),
              duration: const Duration(seconds: 1),
              child: language())
        ],
      ),
    );
  }

  Widget bottomWidget() {
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

  Widget language() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: (){
            structureController.isKorean.value = false;
            structureController.changeToEn();
          },
          child: Text(
            'ENG',
            style: textStyle,
          ),
        ),
        common.infoItemFence(textStyle, Colors.white),
        GestureDetector(
          onTap: () {
            structureController.isKorean.value = true;
            structureController.changeToKR();
          },
          child: Text(
            'KOR',
            style: textStyle,
          ),
        )
      ],
    );
  }

  //FadeInUp
  Widget leftContent(double w, double h, double input) {
    if (input == BreakPoint.desktop) {
      return SizedBox(
        width: structureController.initWidth.value * 578 / 1920,
        child: FittedBox(
          child: FadeInUp(
            delay: const Duration(milliseconds: 600),
            duration: const Duration(seconds: 1),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  introTitle,
                  style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 72,
                      fontFamily: 'nexon_b',
                      height: 1.2),
                ),
                SizedBox(
                  height: h * 40 / 1080,
                ),
                Text(
                  structureController.isKorean.value
                      ? introSubTitle
                      : introSubTitleEn,
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
                        structureController.launchWeb(tunegemAppleUrl);
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
                        structureController.launchWeb(tunegemPlayStoreUrl);
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
        ),
      );
    } else if (input == BreakPoint.smallDeskTop) {
      return SizedBox(
        width: w > 1200
            ? structureController.initWidth.value * 578 / 1920
            : w * 578 / 1440,
        child: FittedBox(
          child: FadeInUp(
            delay: const Duration(milliseconds: 600),
            duration: const Duration(seconds: 1),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  introTitle,
                  style: const TextStyle(
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
                      ? introSubTitle
                      : introSubTitleEn,
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
          child: FadeInUp(
            delay: const Duration(milliseconds: 600),
            duration: const Duration(seconds: 1),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  introTitle,
                  style: const TextStyle(
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
                      ? introSubTitle
                      : introSubTitleEn,
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
                        structureController.launchWeb(tunegemAppleUrl);
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
                        structureController.launchWeb(tunegemPlayStoreUrl);
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
        ),
      );
    }
  }

  Widget rightContent(double w, double h, double input) {
    if (input == BreakPoint.desktop || input == BreakPoint.smallDeskTop) {
      return FadeInUp(
        delay: const Duration(milliseconds: 600),
        duration: const Duration(seconds: 1),
        child: SizedBox(
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
        ),
      );
    } else {
      double width = w * 512 / 1024;
      if (input == BreakPoint.tablet) {
        width = w * 512 / 1024;
      } else if (input == BreakPoint.smallTablet) {
        width = w * 476 / 601;
      } else {
        width = w * 312 / 360;
      }
      return Stack(
        children: [
          SizedBox(
            width: width,
            height: width * 742 / 617,
          ),
          FadeInUp(
              delay: const Duration(milliseconds: 600),
              duration: const Duration(seconds: 1),
              child: SizedBox(
                width: width,
                child: Image.asset(
                  structureController.isKorean.value
                      ? 'assets/images/content_1.png'
                      : 'assets/images/content_1_en.png',
                  fit: BoxFit.fitWidth,
                  filterQuality: FilterQuality.high,
                ),
              ))
        ],
      );
    }
  }
}
