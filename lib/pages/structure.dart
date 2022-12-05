import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/instance_manager.dart';
import 'package:get/route_manager.dart';
import 'package:tunegem_io/controller/structure_controller.dart';
import 'package:tunegem_io/dot_indicator.dart';
import 'package:tunegem_io/pages/analyzing_page.dart';
import 'package:tunegem_io/pages/audition_page.dart';
import 'package:tunegem_io/pages/break_point.dart';
import 'package:tunegem_io/pages/intro_page.dart';
import 'package:tunegem_io/pages/lesson_page.dart';
import 'package:tunegem_io/pages/report_page.dart';

class Structure extends StatefulWidget {
  Structure({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _Structure();
}

class _Structure extends State<Structure> {
  final PageController pageController = PageController();

  StructureController structureController = Get.put(StructureController());

  @override
  void initState() {
    super.initState();
    structureController.initWidth.value = Get.width;
    structureController.initHeight.value = Get.height;
    structureController.initPageController(pageController);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    preLoadImages();
  }

  final List<String> imageList = [
    'app_store',
    'content_1',
    'content_1_en',
    'content_2',
    'content_2_en',
    'content_3',
    'content_3_en',
    'content_4',
    'content_4_en',
    'content_5',
    'content_5_en',
    'content_5_1',
    'content_5_1_en',
    'content_5_2',
    'content_5_2_en',
    'content_5_3',
    'content_5_3_en',
    'down_button',
    'instagram',
    'play_store',
    'tunegem_logo',
    'youtube'
  ];

  void preLoadImages() async {
    for (int idx = 0; idx < imageList.length; idx++) {
      await precacheImage(
          AssetImage('assets/images/${imageList[idx]}.png'), context);
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  List<Widget> pageList = [
    IntroPage(),
    AnalyzingPage(),
    ReportPage(),
    AuditionPage(),
    LessonPage()
  ];

  double totalWidth = 0;
  double totalHeight = 0;

  @override
  Widget build(BuildContext context) {
    totalWidth = MediaQuery.of(context).size.width;
    totalHeight = MediaQuery.of(context).size.height;
    if (totalWidth > structureController.initWidth.value) {
      structureController.initWidth.value = totalWidth;
    }
    if (totalHeight > structureController.initHeight.value) {
      structureController.initHeight.value = totalHeight;
      if(structureController.initHeight.value > 1080){
        structureController.initHeight.value = structureController.initWidth.value * 1080 / 1920;
      }
    }
    if(totalWidth < BreakPoint.tablet){
      structureController.nowPage.value = 0;
    }
    return Scaffold(
      body: SizedBox(
        width: totalWidth,
        height: totalHeight,
        child: Stack(
          children: [
            SizedBox(
              width: totalWidth,
              height: totalHeight,
              child: totalWidth > BreakPoint.tablet
                  ? PageView.builder(
                      controller: pageController,
                      itemCount: pageList.length,
                      scrollDirection: Axis.vertical,
                      onPageChanged: (idx) {
                        structureController.nowPage.value = idx;
                      },
                      itemBuilder: (context, idx) {
                        return pageList[idx];
                      })
                  : ListView.builder(
                      shrinkWrap: true,
                      itemCount: pageList.length,
                      itemBuilder: (context, idx) {
                        return pageList[idx];
                      }),
            ),
            totalWidth > BreakPoint.smallDeskTop
                ? Positioned(
                    right: 56,
                    child: Obx(() {
                      return Opacity(
                        opacity: structureController.indicatorOpacity.value,
                        child: TunegemDotIndicator(
                            standardIdx: structureController.nowPage.value,
                            dotWidth: 15,
                            activateDotWidth: 15,
                            dotCount: pageList.length,
                            baseDotColor: structureController.nowPage.value == 0
                                ? Colors.white.withOpacity(0.5)
                                : const Color(0xffCDCDCD).withOpacity(0.5),
                            activateDotColor:
                                structureController.nowPage.value == 0
                                    ? Colors.white
                                    : const Color(0xffCDCDCD),
                            dotPadding: 15,
                            animationDuration: 500),
                      );
                    }))
                : Container()
          ],
        ),
      ),
    );
  }
}
