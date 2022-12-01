import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:tunegem_io/controller/structure_controller.dart';
import 'package:tunegem_io/support_ui.dart';

class IntroDownButton extends StatefulWidget {
  IntroDownButton({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _IntroDownButton();
}

class _IntroDownButton extends State<IntroDownButton>
    with TickerProviderStateMixin {
  final StructureController structureController = Get.find();
  late AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 3));
    animationController.repeat(reverse: false);
  }

  @override
  void dispose() {
    super.dispose();
  }

  final Logger logger = Logger(printer: PrettyPrinter());

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          bottom: structureController.initHeight.value * 32 / 1080),
      child: IntroDownButtonAnimation(
        image: image(),
        controller: animationController,
      ),
    );
  }

  GlobalKey key = GlobalKey();

  //36.67
  Widget image() {
    return Image.asset(
      'assets/images/down_button.png',
      width: 16,
      fit: BoxFit.fitWidth,
      filterQuality: FilterQuality.high,
    );
  }
}

class IntroDownButtonAnimation extends StatelessWidget {
  final Widget image;
  final Animation<double> controller;
  final Animation<AlignmentDirectional> alignment;
  final Animation<AlignmentDirectional> alignment2;
  final Animation<double> opacity;

  IntroDownButtonAnimation(
      {Key? key, required this.controller, required this.image})
      : alignment = Tween<AlignmentDirectional>(
                begin: AlignmentDirectional.topCenter,
                end: AlignmentDirectional.center)
            .animate(CurvedAnimation(
                parent: controller,
                curve: Interval(0, 0.3, curve: Curves.linear))),
        opacity = Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
            parent: controller, curve: Interval(0, 0.6, curve: Curves.linear))),
        alignment2 = Tween<AlignmentDirectional>(
                begin: AlignmentDirectional.center,
                end: AlignmentDirectional.bottomCenter)
            .animate(CurvedAnimation(
                parent: controller,
                curve: Interval(0.35, 1, curve: Curves.linear))),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: controller,
        builder: (context, child) {
          return SizedBox(
            height: 50.67,
            child: Align(
              alignment: alignment.value == Alignment.center ? alignment2.value : alignment.value,
              child: Opacity(
                opacity: opacity.value,
                child: image,
              ),
            ),
          );
        });
  }
}
