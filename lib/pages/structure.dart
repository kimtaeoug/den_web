import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:get/route_manager.dart';
import 'package:tunegem_io/controller/structure_controller.dart';
import 'package:tunegem_io/dot_indicator.dart';
import 'package:tunegem_io/pages/analyzing_page.dart';
import 'package:tunegem_io/pages/audition_page.dart';
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
    structureController.initWidth.value = Get.width;
    structureController.initHeight.value = Get.height;
    super.initState();
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

  int pageIdx = 0;
  final ScrollController scrollController = ScrollController();

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
              child: ListView.builder(
                  itemExtent: totalWidth > 1024 ? Get.height : null,
                  physics: totalWidth > 1024 ? const PageScrollPhysics() : null,
                  shrinkWrap: true,
                  itemCount: pageList.length,
                  itemBuilder: (context, idx) {
                    return pageList[idx];
                  }),
            ),
            totalWidth > 1440
                ? Positioned(
                    right: 56,
                    child: TunegemDotIndicator(
                        standardIdx: pageIdx,
                        dotWidth: 15,
                        activateDotWidth: 15,
                        dotCount: pageList.length,
                        baseDotColor: pageIdx == 0
                            ? Colors.white.withOpacity(0.5)
                            : const Color(0xffCDCDCD).withOpacity(0.5),
                        activateDotColor: pageIdx == 0
                            ? Colors.white
                            : const Color(0xffCDCDCD),
                        dotPadding: 15,
                        animationDuration: 500))
                : Container()
          ],
        ),
      ),
    );
  }
}
