import 'package:flutter/cupertino.dart';

class TunegemDotIndicator extends StatelessWidget {
  final int standardIdx;
  final double dotWidth;
  final double activateDotWidth;
  final int dotCount;
  final Color baseDotColor;
  final Color activateDotColor;
  final double dotPadding;
  final int animationDuration;

  TunegemDotIndicator(
      {Key? key,
      required this.standardIdx,
      required this.dotWidth,
      required this.activateDotWidth,
      required this.dotCount,
      required this.baseDotColor,
      required this.activateDotColor,
      required this.dotPadding,
      required this.animationDuration})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: dotWidth,
      height: MediaQuery.of(context).size.height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
            dotCount,
            (index) => Padding(
                  padding: EdgeInsets.only(right: 8),
                  child: _dot(index),
                )),
      ),
    );
  }

  Widget _dot(int idx) {
    return AnimatedContainer(
        width: idx == standardIdx ? activateDotWidth : dotWidth,
        height: dotWidth,
        curve: Curves.ease,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: idx == standardIdx ? activateDotColor : baseDotColor),
        duration: Duration(milliseconds: animationDuration));
  }
}
