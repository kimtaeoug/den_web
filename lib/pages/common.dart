import 'dart:html';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tunegem_io/support_ui.dart';

class Common {
  Widget textContent(
      {required String title,
      required String subTitle,
      double textPadding = 32,
      String? subTitle2,
      double? textPadding2}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
              fontFamily: 'nexon_b',
              color: Color(0xffFC3A81),
              fontWeight: FontWeight.w500,
              fontSize: 56),
        ),
        SizedBox(
          height: textPadding,
        ),
        Text(
          subTitle,
          style: GoogleFonts.notoSans(
              color: const Color(0xff6D6D6D),
              fontWeight: FontWeight.w400,
              fontSize: 24),
        ),
        textPadding2 != null
            ? SizedBox(
                height: textPadding2,
              )
            : Container(),
        subTitle2 != null
            ? Text(subTitle2,
                style: GoogleFonts.notoSans(
                    color: const Color(0xff6D6D6D),
                    fontWeight: FontWeight.w400,
                    fontSize: 24))
            : Container()
      ],
    );
  }

  Widget logo() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Image.asset(
          'assets/images/tunegem_logo.png',
          width: 28,
          fit: BoxFit.fitWidth,
        ),
        const SizedBox(
          width: 10,
        ),
        const Text(
          'TUNEGEM',
          style: TextStyle(
              fontWeight: FontWeight.w700, color: Colors.white, fontSize: 24),
        )
      ],
    );
  }

  Widget infoItem({required String label, required String content, required TextStyle textStyle1, required TextStyle textStyle2}) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          '$label : ',
          style: textStyle1,
          // style: const TextStyle(
          //     color: Color(0xff8E909B),
          //     fontWeight: FontWeight.w400,
          //     fontSize: 12),
        ),
        Text(
          content,
          style: textStyle2,
          // style: const TextStyle(
          //     color: Colors.white, fontSize: 14, fontWeight: FontWeight.w300),
        )
      ],
    );
  }

  Widget infoItemFence(TextStyle style) {
    return Container(
      width: 1,
      height: SupportUI.getTextSize('이', style).height,
      // height: const TextStyle(fontSize: 12).height,
      color: const Color(0xff8E909B),
      margin: const EdgeInsets.symmetric(horizontal: 14),
    );
  }
}
