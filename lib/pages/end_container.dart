import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tunegem_io/controller/structure_controller.dart';
import 'package:tunegem_io/pages/break_point.dart';

import 'common.dart';

class EndContainer extends StatelessWidget {
  final double input;

  EndContainer({Key? key, required this.input}) : super(key: key);
  final Common common = Common();
  double totalWidth = 0;
  double totalHeight = 0;
  final StructureController structureController = Get.find();
  final Color backColor = const Color(0xff2B2D35);

  @override
  Widget build(BuildContext context) {
    totalWidth = MediaQuery.of(context).size.width;
    totalHeight = MediaQuery.of(context).size.height;
    if (input == BreakPoint.smallTablet || input == BreakPoint.mobile) {
      return Container(
        width: totalWidth,
        color: backColor,
        child: Padding(
          padding: EdgeInsets.only(
              left: input == BreakPoint.smallTablet
                  ? totalWidth / 10
                  : totalWidth * 0.06),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: input == BreakPoint.smallTablet ? 45 : 42,
              ),
              common.logo(),
              SizedBox(
                height: input == BreakPoint.smallTablet ? 32 : 26,
              ),
              termList(),
              SizedBox(
                height: input == BreakPoint.smallTablet ? 32 : 24,
              ),
              companyInfo(),
              SizedBox(
                height: input == BreakPoint.smallTablet ? 16 : 8,
              ),
              companyDetailInfo(totalWidth, totalHeight),
              SizedBox(
                height: input == BreakPoint.smallTablet ? 16 : 8,
              ),
              copyRightText(),
              SizedBox(
                height: input == BreakPoint.smallTablet ? 34 : 24,
              ),
              iconList(),
              SizedBox(
                height: input == BreakPoint.smallTablet ? 65 : 40,
              )
            ],
          ),
        ),
      );
    } else {
      return Container(
        width: input == BreakPoint.desktop || input == BreakPoint.smallDeskTop
            ? structureController.initWidth.value
            : totalWidth,
        color: backColor,
        child: Padding(
          padding: EdgeInsets.symmetric(
              vertical: input == BreakPoint.desktop ||
                      input == BreakPoint.smallDeskTop
                  ? structureController.initHeight.value * 72 / 1080
                  : totalHeight * 72 / 1302,
              horizontal: input == BreakPoint.desktop ||
                      input == BreakPoint.smallDeskTop
                  ? structureController.initWidth.value * 120 / 1920
                  : totalWidth * 120 / 1024),
          child: SizedBox(
            width:
                input == BreakPoint.desktop || input == BreakPoint.smallDeskTop
                    ? structureController.initWidth.value * 1200 / 1920
                    : totalWidth,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: [common.logo(), termList()],
                ),
                SizedBox(
                  height: input == BreakPoint.desktop ||
                          input == BreakPoint.smallDeskTop
                      ? structureController.initHeight.value * 32 / 1080
                      : totalHeight * 34 / 1302,
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: companyInfo(),
                ),
                SizedBox(
                  height: input == BreakPoint.desktop ||
                          input == BreakPoint.smallDeskTop
                      ? structureController.initHeight.value * 16 / 1080
                      : totalHeight * 16 / 1302,
                ),
                companyDetailInfo(totalWidth, totalHeight),
                SizedBox(
                  height: input == BreakPoint.desktop ||
                          input == BreakPoint.smallDeskTop
                      ? structureController.initHeight.value * 16 / 1080
                      : totalHeight * 16 / 1302,
                ),
                copyRightText(),
                SizedBox(
                  height: input == BreakPoint.desktop ||
                          input == BreakPoint.smallDeskTop
                      ? structureController.initHeight.value * 80 / 1080
                      : totalHeight * 58 / 1302,
                ),
                iconList()
              ],
            ),
          ),
        ),
      );
    }
  }

  Widget companyInfo() {
    double fontSize = 14;
    double padding = 16;
    if (input == BreakPoint.mobile) {
      fontSize = 12;
      padding = 8;
    } else {
      fontSize = 14;
      padding = 16;
    }
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Align(
          alignment: Alignment.topLeft,
          child: Obx(() {
            return Text(
              structureController.isKorean.value
                  ? '케이팝팩토리 주식회사 (K-POP FACTORY CO.LTD)'
                  : 'K-POP FACTORY CO.LTD',
              style: GoogleFonts.notoSans(
                  fontWeight: FontWeight.w700,
                  fontSize: fontSize,
                  color: Colors.white),
            );
          }),
        ),
        SizedBox(
          height: padding,
        ),
        Align(
          alignment: Alignment.topLeft,
          child: Obx(() {
            return Text(
              structureController.isKorean.value
                  ? '서울특별시 강남구 봉은사로 460, 5층 (삼성동, 금척타워)'
                  : 'K-POP FACTORY, 5F, Bongeunsa-ro 460, Gangnam-gu, Seoul, Republic of Korea (06154)',
              style: GoogleFonts.notoSans(
                  fontSize: fontSize,
                  fontWeight: FontWeight.w400,
                  color: Colors.white),
            );
          }),
        )
      ],
    );
  }

  Widget companyDetailInfo(double w, double h) {
    double fontSize = 14;

    if (input == BreakPoint.mobile) {
      fontSize = 12;
    } else {
      fontSize = 14;
    }
    if (input == BreakPoint.tablet || input == BreakPoint.smallTablet) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ceoText(fontSize),
              common.infoItemFence(
                  GoogleFonts.notoSans(
                      fontWeight: FontWeight.w300,
                      fontSize: 12,
                      color: const Color(0xff8E909B)),
                  const Color(0xff8E909B)),
              ceoNumber(fontSize)
            ],
          ),
          const SizedBox(
            height: 5,
          ),
           w > 500?
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              email(fontSize),
              common.infoItemFence(
                  GoogleFonts.notoSans(
                      fontWeight: FontWeight.w300,
                      fontSize: 12,
                      color: const Color(0xff8E909B)),
                  const Color(0xff8E909B)),
              companyNumber(fontSize)
            ],
          ) :
          Align(
            alignment: Alignment.topLeft,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                email(fontSize),
                companyNumber(fontSize)
              ],
            ),
          )
        ],
      );
    } else if (input == BreakPoint.mobile) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ceoText(fontSize),
              common.infoItemFence(
                  GoogleFonts.notoSans(
                      fontWeight: FontWeight.w300,
                      fontSize: 12,
                      color: const Color(0xff8E909B)),
                  const Color(0xff8E909B)),
              ceoNumber(fontSize)
            ],
          ),
          email(fontSize),
          companyNumber(fontSize)
        ],
      );
    } else {
      return Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ceoText(fontSize),
          common.infoItemFence(
              GoogleFonts.notoSans(
                  fontWeight: FontWeight.w300,
                  fontSize: 12,
                  color: const Color(0xff8E909B)),
              const Color(0xff8E909B)),
          ceoNumber(fontSize),
          common.infoItemFence(
              GoogleFonts.notoSans(
                  fontWeight: FontWeight.w300,
                  fontSize: 12,
                  color: const Color(0xff8E909B)),
              const Color(0xff8E909B)),
          email(fontSize),
          common.infoItemFence(
              GoogleFonts.notoSans(
                  fontWeight: FontWeight.w300,
                  fontSize: 12,
                  color: const Color(0xff8E909B)),
              const Color(0xff8E909B)),
          companyNumber(fontSize)
        ],
      );
    }
  }

  Widget ceoText(double fontSize) {
    return common.infoItem(label: '대표', content: '김민석', fontSize: fontSize);
  }

  Widget ceoNumber(double fontSize) {
    return common.infoItem(
        label: '사업자등록번호', content: '121-86-42179', fontSize: fontSize);
  }

  Widget email(double fontSize) {
    return common.infoItem(
        label: '이메일', content: 'info@k-popfactory.com', fontSize: fontSize);
  }

  Widget companyNumber(double fontSize) {
    return common.infoItem(
        label: '대표번호', content: '02-3442-6227', fontSize: fontSize);
  }

  final TextStyle copyRightTextStyle = GoogleFonts.notoSans(
      color: Colors.white, fontSize: 14, fontWeight: FontWeight.w400);

  Widget copyRightText() {
    double fontSize = 14;
    if (input == BreakPoint.mobile) {
      fontSize = 12;
    } else {
      fontSize = 14;
    }
    return Align(
      alignment: Alignment.topLeft,
      child: Text(
        'Copyright © 2022 TUNEGEM. All rights reserved.',
        style: copyRightTextStyle.copyWith(fontSize: fontSize),
      ),
    );
  }

  Widget iconList() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () {
            structureController.launchWeb(structureController.isKorean.value
                ? 'https://www.instagram.com/tunegem.official/'
                : 'https://www.instagram.com/tunegem.global/');
          },
          child: Image.asset(
            'assets/images/instagram.png',
            height: 24,
            fit: BoxFit.fitHeight,
          ),
        ),
        const SizedBox(
          width: 32,
        ),
        GestureDetector(
          onTap: () {
            structureController
                .launchWeb('https://www.youtube.com/@tunegemofficial');
          },
          child: Image.asset(
            'assets/images/youtube.png',
            height: 24,
            fit: BoxFit.fitHeight,
          ),
        )
      ],
    );
  }

  final TextStyle termTextStyle = GoogleFonts.notoSans(
      color: const Color(0xff8E909B),
      fontSize: 14,
      fontWeight: FontWeight.w700);

  Widget termList() {
    MainAxisAlignment alignment = MainAxisAlignment.start;
    if (input == BreakPoint.smallTablet || input == BreakPoint.mobile) {
      alignment = MainAxisAlignment.start;
    } else {
      alignment = MainAxisAlignment.end;
    }
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: alignment,
      children: [
        Text(
          '이용약관',
          style: termTextStyle,
        ),
        common.infoItemFence(termTextStyle, const Color(0xff8E909B)),
        Text(
          '개인정보처리방침',
          style: termTextStyle,
        ),
        common.infoItemFence(termTextStyle, const Color(0xff8E909B)),
        Text(
          '문의하기',
          style: termTextStyle,
        )
      ],
    );
  }
}
