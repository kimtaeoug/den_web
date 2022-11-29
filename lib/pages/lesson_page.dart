import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tunegem_io/controller/structure_controller.dart';
import 'package:tunegem_io/pages/common.dart';

class LessonPage extends StatelessWidget {
  LessonPage({Key? key}) : super(key: key);
  final Common common = Common();
  double totalWidth = 0;
  double totalHeight = 0;
  final StructureController structureController = Get.find();

  //        width: structureController.initWidth.value,
  //         height: totalWidth > 1024 ? Get.height : null,
  @override
  Widget build(BuildContext context) {
    totalWidth = MediaQuery
        .of(context)
        .size
        .width;
    totalHeight = MediaQuery
        .of(context)
        .size
        .height;
    return Obx(() {
      return SizedBox(
        width: structureController.initWidth.value,
        height: totalWidth > 1024 ? Get.height : null,
        child: totalWidth > 1024 ? SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: structureController.initWidth.value,
                height: Get.height,
                color: const Color(0xffF8F8FA),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _bigImage(totalWidth, totalHeight),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        _deskTopTextWidget(totalWidth, totalHeight),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            _deskTopImageItem(totalHeight, 'assets/images/content_5_1.png'),
                            _deskTopImageItem(totalHeight, 'assets/images/content_5_2.png'),
                            _deskTopImageItem(totalHeight, 'assets/images/content_5_3.png')
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
              _bottomContainer(totalWidth , totalHeight),
              _endContainer(totalWidth , totalHeight)
            ],
          ),
        ) : Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: totalHeight * 83 /1409,),
            Center(
              child: _bigImage(totalWidth, totalHeight),
            ),
            SizedBox(height: totalHeight * 73 /1409,),
            _deskTopTextWidget(totalWidth, totalHeight),
            SizedBox(height: totalHeight * 100 / 1409,),
            _bottomContainer(totalWidth, totalHeight),
            _endContainer(totalWidth, totalHeight)
          ],
        ),
      );
    });
  }

  //             _bottomContainer(context),
  //             _endContainer(context)
  //           ],
  //         ),
  //       ),
  //     );
  //   } else {
  //     return SizedBox(
  //       width: MediaQuery.of(context).size.width,
  //       child: Column(
  //         mainAxisAlignment: MainAxisAlignment.start,
  //         children: [
  //           Container(
  //             width: MediaQuery.of(context).size.width,
  //             height: MediaQuery.of(context).size.height,
  //             color: const Color(0xffF8F8FA),
  //             child: Column(
  //               mainAxisAlignment: MainAxisAlignment.start,
  //               children: [
  //                 Image.asset(
  //                   'assets/images/content_5.png',
  //                   width: 361,
  //                   fit: BoxFit.fitWidth,
  //                 ),
  //                 common.textContent(
  //                     title: '현직 아이돌 보컬 선생님에게\n직접 받는 KPOP 노래 레슨',
  //                     subTitle:
  //                         '검증된 KPOP 전문가 집단인 현직 아이돌 보컬 선생님에게\n직접 노래 레슨을 받아보세요.'),
  //               ],
  //             ),
  //           ),
  //           _bottomContainer(context),
  //           _endContainer(context)
  //         ],
  //       ),
  //     );
  //   }
  // }

  Widget _bottomContainer(double w, double h) {
    return Container(
      width: structureController.initWidth.value,
      height: h * 425 / 1080,
      color: const Color(0xffFC3A81),
      child: Center(
        child: SizedBox(
          height: h * 245 / 1080,
          child: FittedBox(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'K-POP PLAYGROUND TUNEGEM',
                  style: GoogleFonts.notoSans(
                    color: Colors.white, fontSize: 34, fontWeight: FontWeight.w700
                  ),
                ),
                Text(
                  '지금 시작해보세요!',
                  style: GoogleFonts.notoSans(
                    color: Colors.white, fontSize: 22, fontWeight: FontWeight.w400
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 60,
                      child: Image.asset(
                        'assets/images/app_store.png',
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                    const SizedBox(
                      width: 24,
                    ),
                    SizedBox(
                      height: 60,
                      child: Image.asset(
                        'assets/images/play_store.png',
                        fit: BoxFit.fitHeight,
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _endContainer(double w, double h) {
    TextStyle termTextStyle = GoogleFonts.notoSans(
        color: const Color(0xff8E909B),
        fontSize: 14,
        fontWeight: FontWeight.w700
    );
    TextStyle infoTextStyle1 = GoogleFonts.notoSans(
      color: const Color(0xff8E909B),
      fontWeight: FontWeight.w400,
      fontSize: 12
    );
    TextStyle infoTextStyle2 = GoogleFonts.notoSans(
      color: Colors.white,
      fontSize: 14,
      fontWeight: FontWeight.w300
    );
    return Container(
      width: structureController.initWidth.value,
      height: h * 450 / 1080,
      color: const Color(0xff2B2D35),
      child: FittedBox(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 70,
                    ),
                    Container(
                      width: structureController.initWidth.value,
                      padding: EdgeInsets.symmetric(
                          horizontal: structureController.initWidth.value / 6),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          common.logo(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                '이용약관',
                                style: termTextStyle,
                              ),
                              common.infoItemFence(termTextStyle),
                              Text('개인정보처리방침',
                                  style: termTextStyle),
                              common.infoItemFence(termTextStyle),
                              Text('문의하기',
                                  style: termTextStyle)
                            ],
                          )
                        ],
                      ),
                    ),
                    Container(
                      width: structureController.initWidth.value,
                      padding: EdgeInsets.only(
                          left: structureController.initWidth.value / 6),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 24,
                          ),
                          Text(
                            '케이팝팩토리 주식회사 (K-POP FACTORY CO.LTD)',
                            style: GoogleFonts.notoSans(
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                                fontSize: 14
                            ),
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          Text(
                            '서울특별시 강남구 봉은사로 460, 5층 (삼성동, 금척타워)',
                            style: GoogleFonts.notoSans(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.w400
                            ),
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              common.infoItem(label: '대표', content: '김민석', textStyle1: infoTextStyle1, textStyle2: infoTextStyle2),
                              common.infoItemFence(infoTextStyle1),
                              common.infoItem(
                                  label: '사업자등록번호', content: '121-86-42179',textStyle1: infoTextStyle1, textStyle2: infoTextStyle2),
                              common.infoItemFence(infoTextStyle1),
                              common.infoItem(
                                  label: '이메일', content: 'info@k-popfactory.com',textStyle1: infoTextStyle1, textStyle2: infoTextStyle2),
                              common.infoItemFence(infoTextStyle1),
                              common.infoItem(
                                  label: '대표번호', content: '02-3442-6227',textStyle1: infoTextStyle1, textStyle2: infoTextStyle2)
                            ],
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          Text(
                            'Copyright © 2022 TUNEGEM. All rights reserved.',
                            style: GoogleFonts.notoSans(
                              color: Colors.white,
                              fontWeight: FontWeight.w400,
                              fontSize: 14
                            ),
                          ),
                          const SizedBox(
                            height: 85,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Image.asset(
                                'assets/images/instagram.png',
                                height: 24,
                                fit: BoxFit.fitHeight,
                              ),
                              const SizedBox(
                                width: 32,
                              ),
                              Image.asset(
                                'assets/images/youtube.png',
                                height: 24,
                                fit: BoxFit.fitHeight,
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 72,
                          )
                        ],
                      ),
                    )
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _deskTopTextWidget(double w, double h) {
    return SizedBox(
      height: h * 240 / 1080,
      child: FittedBox(
        child: common.textContent(
            title: '현직 아이돌 보컬 선생님에게\n직접 받는 KPOP 노래 레슨',
            subTitle: '검증된 KPOP 전문가 집단인 현직 아이돌 보컬 선생님에게\n직접 노래 레슨을 받아보세요.'),
      ),
    );
  }

  Widget _deskTopImageItem(double h, String asset) {
    return SizedBox(
      height: h * 412 / 1080,
      child: Image.asset(
        asset,
        fit: BoxFit.fitHeight,
      ),
    );
  }

  Widget _bigImage(double w, double h) {
    return SizedBox(
      height: h * 785 / 1080,
      child: Image.asset(
        'assets/images/content_5.png',
        fit: BoxFit.fitHeight,
      ),
    );
  }
}

//import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:tunegem_io/controller/structure_controller.dart';
// import 'package:tunegem_io/pages/common.dart';
//
// class LessonPage extends StatelessWidget {
//   LessonPage({Key? key}) : super(key: key);
//   final Common common = Common();
//   double totalWidth = 0;
//   double totalHeight = 0;
//   final StructureController structureController = Get.find();
//
//   //        width: structureController.initWidth.value,
//   //         height: totalWidth > 1024 ? Get.height : null,
//   @override
//   Widget build(BuildContext context) {
//     totalWidth = MediaQuery.of(context).size.width;
//     totalHeight = MediaQuery.of(context).size.height;
//     return Obx((){
//       return SizedBox(
//         width: structureController.initWidth.value,
//         height: totalWidth > 1024 ? Get.height : null,
//         child: totalWidth > 1024 ? SingleChildScrollView(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.start,
//             children: [
//               Container(
//                 width: structureController.initWidth.value,
//                 height: Get.height,
//                 color: const Color(0xffF8F8FA),
//                 child: Column(
//                   mainAxisSize: MainAxisSize.min,
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     _bigImage(totalWidth, totalHeight),
//                     Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       mainAxisSize: MainAxisSize.min,
//
//                     )
//                   ],
//                 ),
//               )
//             ],
//           ),
//         ) : Column(
//
//         ),
//       );
//     });
//     if (totalWidth > 834) {
//       return SizedBox(
//         width: MediaQuery.of(context).size.width,
//         height: MediaQuery.of(context).size.height,
//         child: SingleChildScrollView(
//           scrollDirection: Axis.vertical,
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.start,
//             children: [
//               Container(
//                 width: MediaQuery.of(context).size.width,
//                 height: MediaQuery.of(context).size.height,
//                 color: const Color(0xffF8F8FA),
//                 child: Row(
//                   mainAxisSize: MainAxisSize.min,
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Image.asset(
//                       'assets/images/content_5.png',
//                       width: 361,
//                       fit: BoxFit.fitWidth,
//                     ),
//                     Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       mainAxisSize: MainAxisSize.min,
//                       children: [
//                         common.textContent(
//                             title: '현직 아이돌 보컬 선생님에게\n직접 받는 KPOP 노래 레슨',
//                             subTitle:
//                                 '검증된 KPOP 전문가 집단인 현직 아이돌 보컬 선생님에게\n직접 노래 레슨을 받아보세요.'),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.start,
//                           children: [
//                             Image.asset(
//                               'assets/images/content_5_1.png',
//                               width: 280,
//                               fit: BoxFit.fitWidth,
//                             ),
//                             Image.asset(
//                               'assets/images/content_5_2.png',
//                               width: 280,
//                               fit: BoxFit.fitWidth,
//                             ),
//                             Image.asset(
//                               'assets/images/content_5_3.png',
//                               width: 280,
//                               fit: BoxFit.fitWidth,
//                             )
//                           ],
//                         )
//                       ],
//                     )
//                   ],
//                 ),
//               ),
//               _bottomContainer(context),
//               _endContainer(context)
//             ],
//           ),
//         ),
//       );
//     } else {
//       return SizedBox(
//         width: MediaQuery.of(context).size.width,
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.start,
//           children: [
//             Container(
//               width: MediaQuery.of(context).size.width,
//               height: MediaQuery.of(context).size.height,
//               color: const Color(0xffF8F8FA),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 children: [
//                   Image.asset(
//                     'assets/images/content_5.png',
//                     width: 361,
//                     fit: BoxFit.fitWidth,
//                   ),
//                   common.textContent(
//                       title: '현직 아이돌 보컬 선생님에게\n직접 받는 KPOP 노래 레슨',
//                       subTitle:
//                           '검증된 KPOP 전문가 집단인 현직 아이돌 보컬 선생님에게\n직접 노래 레슨을 받아보세요.'),
//                 ],
//               ),
//             ),
//             _bottomContainer(context),
//             _endContainer(context)
//           ],
//         ),
//       );
//     }
//   }
//
//   Widget _bottomContainer(BuildContext context) {
//     return Container(
//       width: MediaQuery.of(context).size.width,
//       color: const Color(0xffFC3A81),
//       padding: const EdgeInsets.symmetric(vertical: 91),
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Text(
//             'K-POP PLAYGROUND TUNEGEM',
//             style: TextStyle(
//                 color: Colors.white, fontSize: 48, fontWeight: FontWeight.w700),
//           ),
//           Text(
//             '지금 시작해보세요!',
//             style: TextStyle(
//                 color: Colors.white, fontSize: 34, fontWeight: FontWeight.w400),
//           ),
//           const SizedBox(
//             height: 40,
//           ),
//           Row(
//             mainAxisSize: MainAxisSize.min,
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Image.asset(
//                 'assets/images/app_store.png',
//                 height: 80,
//                 fit: BoxFit.fitHeight,
//               ),
//               const SizedBox(
//                 width: 24,
//               ),
//               Image.asset(
//                 'assets/images/play_store.png',
//                 height: 80,
//                 fit: BoxFit.fitHeight,
//               )
//             ],
//           )
//         ],
//       ),
//     );
//   }
//
//   Widget _endContainer(BuildContext context) {
//     return Container(
//       width: MediaQuery.of(context).size.width,
//       color: const Color(0xff2B2D35),
//       child: Row(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           Column(
//             mainAxisSize: MainAxisSize.min,
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 mainAxisSize: MainAxisSize.min,
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 children: [
//                   const SizedBox(
//                     height: 70,
//                   ),
//                   Container(
//                     width: MediaQuery.of(context).size.width,
//                     padding: EdgeInsets.symmetric(
//                         horizontal: MediaQuery.of(context).size.width / 6),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         common.logo(),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.end,
//                           children: [
//                             const Text(
//                               '이용약관',
//                               style: TextStyle(
//                                   color: Color(0xff8E909B),
//                                   fontSize: 14,
//                                   fontWeight: FontWeight.w700),
//                             ),
//                             common.infoItemFence(),
//                             const Text('개인정보처리방침',
//                                 style: TextStyle(
//                                     color: Color(0xff8E909B),
//                                     fontSize: 14,
//                                     fontWeight: FontWeight.w700)),
//                             common.infoItemFence(),
//                             const Text('문의하기',
//                                 style: TextStyle(
//                                     color: Color(0xff8E909B),
//                                     fontSize: 14,
//                                     fontWeight: FontWeight.w700))
//                           ],
//                         )
//                       ],
//                     ),
//                   ),
//                   Container(
//                     width: MediaQuery.of(context).size.width,
//                     padding: EdgeInsets.only(
//                         left: MediaQuery.of(context).size.width / 6),
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         const SizedBox(
//                           height: 24,
//                         ),
//                         Text(
//                           '케이팝팩토리 주식회사 (K-POP FACTORY CO.LTD)',
//                           style: TextStyle(
//                               color: Colors.white,
//                               fontWeight: FontWeight.w700,
//                               fontSize: 14),
//                         ),
//                         const SizedBox(
//                           height: 16,
//                         ),
//                         Text(
//                           '서울특별시 강남구 봉은사로 460, 5층 (삼성동, 금척타워)',
//                           style: TextStyle(
//                               color: Colors.white,
//                               fontSize: 14,
//                               fontWeight: FontWeight.w400),
//                         ),
//                         const SizedBox(
//                           height: 16,
//                         ),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.start,
//                           mainAxisSize: MainAxisSize.min,
//                           children: [
//                             common.infoItem(label: '대표', content: '김민석'),
//                             common.infoItemFence(),
//                             common.infoItem(
//                                 label: '사업자등록번호', content: '121-86-42179'),
//                             common.infoItemFence(),
//                             common.infoItem(
//                                 label: '이메일', content: 'info@k-popfactory.com'),
//                             common.infoItemFence(),
//                             common.infoItem(
//                                 label: '대표번호', content: '02-3442-6227')
//                           ],
//                         ),
//                         const SizedBox(
//                           height: 16,
//                         ),
//                         const Text(
//                           'Copyright © 2022 TUNEGEM. All rights reserved.',
//                           style: TextStyle(
//                               color: Colors.white,
//                               fontWeight: FontWeight.w400,
//                               fontSize: 14),
//                         ),
//                         const SizedBox(
//                           height: 85,
//                         ),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.start,
//                           children: [
//                             Image.asset(
//                               'assets/images/instagram.png',
//                               height: 24,
//                               fit: BoxFit.fitHeight,
//                             ),
//                             const SizedBox(
//                               width: 32,
//                             ),
//                             Image.asset(
//                               'assets/images/youtube.png',
//                               height: 24,
//                               fit: BoxFit.fitHeight,
//                             )
//                           ],
//                         ),
//                         const SizedBox(
//                           height: 72,
//                         )
//                       ],
//                     ),
//                   )
//                 ],
//               )
//             ],
//           )
//         ],
//       ),
//     );
//   }
//
//   Widget _deskTopTextWidget(double w, double h) {
//     return SizedBox(
//       height: h * 240 / 1080,
//       child: FittedBox(
//         child: common.textContent(
//             title: '현직 아이돌 보컬 선생님에게\n직접 받는 KPOP 노래 레슨',
//             subTitle: '검증된 KPOP 전문가 집단인 현직 아이돌 보컬 선생님에게\n직접 노래 레슨을 받아보세요.'),
//       ),
//     );
//   }
//
//   Widget _deskTopImageItem(double h, String asset) {
//     return SizedBox(
//       height: h * 412 / 1080,
//       child: Image.asset(
//         asset,
//         fit: BoxFit.fitHeight,
//       ),
//     );
//   }
//
//   Widget _bigImage(double w, double h) {
//     return SizedBox(
//       height: h * 785 / 1080,
//       child: Image.asset(
//         'assets/images/content_5.png',
//         fit: BoxFit.fitHeight,
//       ),
//     );
//   }
// }
