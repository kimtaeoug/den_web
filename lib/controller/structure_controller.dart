import 'package:flutter/cupertino.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:html' as html;
class StructureController extends GetxController {
  RxDouble initWidth = 0.0.obs;
  RxDouble initHeight = 0.0.obs;

  RxInt nowPage = 0.obs;
  RxDouble indicatorOpacity = 1.0.obs;

  PageController? pageController = null;

  void initPageController(PageController input) {
    pageController = input;
    update();
  }

  void moveToPage(int idx) {
    if (pageController != null) {
      pageController?.animateToPage(idx,
          duration: const Duration(milliseconds: 500), curve: Curves.linear);
    }
  }

  RxBool isKorean = true.obs;

  void launchWeb(String url) async {
    await launchUrl(Uri.parse(url));
  }
  
  
  void changeMetaNameData(String name, String value){
    html.document.querySelector('meta[name="$name"]')?.setAttribute('content', value);
  }
  void changeMetaPropertyData(String property, String value){
    html.document.querySelector('meta[property="$property"]')?.setAttribute('content', value);
  }

  final String krDescription = 'KPOP 최고의 보컬코치가 분석해 주는 내 노래! 세계최초 KPOP 목소리 분석 앱!';
  final String enDescription = 'TUNEGEM - Meet the new kpop vocal test & community app!';
  void changeToKR(){
    changeMetaNameData('description', krDescription);
    changeMetaNameData('twitter:description', krDescription);
    changeMetaPropertyData('og:description', krDescription);
  }
  void changeToEn(){
    changeMetaNameData('description', enDescription);
    changeMetaNameData('twitter:description', enDescription);
    changeMetaPropertyData('og:description', enDescription);
  }
}
