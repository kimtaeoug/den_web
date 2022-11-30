import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tunegem_io/support_ui.dart';

class Common {
  Widget textContent(
      {required String title,
      required String subTitle,
      bool isMobile = false,
      double titleFontSize = 48,
      double subTitleFontSize = 24,
      double textPadding = 32,
      String? subTitle2,
      double? textPadding2}) {
    double titleFontSize = 48;
    double subTitleFontSize = 24;
    double textPadding = 32;
    if(isMobile == true){
      titleFontSize = 32;
      subTitleFontSize = 16;
      textPadding = 16;
    }else{
      titleFontSize = 48;
      subTitleFontSize = 24;
      textPadding = 32;
    }
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
              fontFamily: 'nexon_b',
              color: const Color(0xffFC3A81),
              fontWeight: FontWeight.w500,
              fontSize: titleFontSize),
        ),
        SizedBox(
          height: textPadding,
        ),
        Text(
          subTitle,
          style: GoogleFonts.notoSans(
              color: const Color(0xff6D6D6D),
              fontWeight: FontWeight.w400,
              fontSize: subTitleFontSize),
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
                    fontSize: subTitleFontSize))
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
          width: 30,
          fit: BoxFit.fitHeight,
        ),
        const SizedBox(
          width: 10,
        ),
        Text(
          'TUNEGEM',
          style: GoogleFonts.notoSans(
              color: Colors.white, fontSize: 24, fontWeight: FontWeight.w700),
        )
      ],
    );
  }

  final TextStyle detailLabelTextStyle = GoogleFonts.notoSans(
      fontWeight: FontWeight.w300, fontSize: 12, color: const Color(0xff8E909B)
  );
  final TextStyle detailValueTextStyle = GoogleFonts.notoSans(
      fontSize: 14, color: Colors.white, fontWeight: FontWeight.w400
  );
  Widget infoItem(
      {required String label,
      required String content,
      required double fontSize
        }) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          '$label : ',
          style: detailLabelTextStyle,
        ),
        Text(
          content,
          style: detailValueTextStyle.copyWith(fontSize: fontSize),
        )
      ],
    );
  }

  Widget infoItemFence(TextStyle style, Color color) {
    return SizedBox(
      height: SupportUI.getTextSize('이', style).height,
      child: Padding(
        padding: const EdgeInsets.only(top: 2),
        child: Center(
          child: Container(
            width: 1,
            height: SupportUI.getTextSize('이', style).height*2/3,
            // height: const TextStyle(fontSize: 12).height,
            color: color,
            margin: const EdgeInsets.symmetric(horizontal: 14),
          ),
        ),
      ),
    );
  }
}
