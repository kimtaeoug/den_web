import 'package:flutter/cupertino.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class StructureController extends GetxController {
  RxDouble initWidth = 0.0.obs;
  RxDouble initHeight = 0.0.obs;

  RxInt nowPage = 0.obs;
  RxDouble indicatorOpacity = 1.0.obs;

  PageController? pageController = null;
  void initPageController(PageController input){
    pageController = input;
    update();
  }
  void moveToPage(int idx){
    if(pageController != null){
      pageController?.animateToPage(idx, duration: const Duration(milliseconds: 500), curve: Curves.linear);
    }
  }

  RxBool isKorean = true.obs;
}
