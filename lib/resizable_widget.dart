// ignore_for_file: use_key_in_widget_constructors, unused_local_variable, prefer_const_declarations, non_constant_identifier_names, avoid_types_as_parameter_names, must_be_immutable, prefer_const_constructors, sized_box_for_whitespace, prefer_const_literals_to_create_immutables, dead_code, sort_child_properties_last

import 'dart:developer';
import 'package:contextmenu/contextmenu.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:ui_maker/components/widget_selector_badge.dart';
import 'package:ui_maker/components/button/widget_selector_btn.dart';
import 'package:ui_maker/controller/ctrl.dart';
import 'package:ui_maker/style/color.dart';
import 'package:ui_maker/style/text.dart';

class UIControllerDialog extends StatelessWidget {
  UIControllerDialog({
    Key? key,
    required this.child,
    // required this.idx,
    // this.isShowContext = true,
  });
  // final int idx;
  final Widget child;
  // final bool isShowContext;
  double ballDiameter = 10;

  RxDouble height = 963.0.obs; //10.17*6
  RxDouble width = 500.0.obs; //19.2*6

  RxDouble top = 0.0.obs;
  RxDouble left = 900.0.obs;
  RxBool isSelector = false.obs;
  RxString selDirection = '오른쪽'.obs;
  RxString selDistance = '0.1'.obs;
  RxBool isHover = false.obs;
  void onDrag(double dx, double dy) {
    var newHeight = Ctrl.to.height.value + dy;
    var newWidth = Ctrl.to.width.value + dx;

    // setState(() {
    Ctrl.to.height.value = newHeight > 0 ? newHeight : 0;
    Ctrl.to.width.value = newWidth > 0 ? newWidth : 0;
    // });
  }

  @override
  Widget build(BuildContext context) {
    final double verticalPadding = 2.0;
    final double contextMenuWidth = 200;
    return
        // Obx(() =>

        Stack(
      children: <Widget>[
        Obx(
          () => Positioned(
            top: top.value,
            left: left.value,
            child: SizedBox(
                width: width.value, height: height.value, child: child),
          ),
        ),
        // Obx(
        //   () => Positioned(
        //     top: top.value - ballDiameter / 2,
        //     left: left.value + width.value / 2 - ballDiameter / 2,
        //     child: ManipulatingBall(
        //       onDrag: (dx, dy) {
        //         var newHeight = height.value - dy;

        //         // setState(() {
        //         height.value = newHeight > 0 ? newHeight : 0;
        //         top.value = top.value + dy;

        //         if (Ctrl.to.dialogForFile.isNotEmpty) {
        //           saveDialogInfo();
        //         }
        //         if (Ctrl.to.dialogForFile.isEmpty) {
        //           Ctrl.to.dialogForFile.add(GridWidget(
        //             top: 0.0,
        //             left: 0.0,
        //             width: 192.0,
        //             height: 214.0,
        //             name: '',
        //             color: Colors.transparent,
        //             childPosId: 4,
        //             className: '',
        //             menuId: 0,
        //             menuSubId: 0,
        //           ));
        //         }
        //       },
        //       onDoubleTapDown: (TapDownDetails) {},
        //     ),
        //   ),
        // ),
        // Obx(
        //   () => Positioned(
        //     top: top.value + height.value / 2 - ballDiameter / 2,
        //     left: left.value + width.value - ballDiameter / 2,
        //     child: ManipulatingBall(
        //       onDrag: (dx, dy) {
        //         var newWidth = width.value + dx;

        //         width.value = newWidth > 0 ? newWidth : 0;
        //         if (Ctrl.to.dialogForFile.isNotEmpty) {
        //           saveDialogInfo();
        //         }
        //         // if (Ctrl.to.dialogForFile.isEmpty) {
        //         //   Ctrl.to.dialogForFile.add(GridWidget(
        //         //     top: top.value,
        //         //     left: left.value,
        //         //     width: Ctrl.to.width.value,
        //         //     height: Ctrl.to.height.value,
        //         //     name: '',
        //         //     color: Colors.transparent,
        //         //   ));
        //         // }
        //       },
        //       onDoubleTapDown: (TapDownDetails) {},
        //     ),
        //   ),
        // ),
        // Obx(
        //   () => Positioned(
        //     top: top.value + height.value - ballDiameter / 2,
        //     left: left.value + width.value / 2 - ballDiameter / 2,
        //     child: ManipulatingBall(
        //       onDrag: (dx, dy) {
        //         var newHeight = height.value + dy;

        //         // setState(() {
        //         height.value = newHeight > 0 ? newHeight : 0;
        //         if (Ctrl.to.dialogForFile.isNotEmpty) {
        //           saveDialogInfo();
        //         }
        //         // if (Ctrl.to.dialogForFile.isEmpty) {
        //         //   Ctrl.to.dialogForFile.add(GridWidget(
        //         //     top: top.value,
        //         //     left: left.value,
        //         //     width: Ctrl.to.width.value,
        //         //     height: Ctrl.to.height.value,
        //         //     name: '',
        //         //     color: Colors.transparent,
        //         //   ));
        //         // }
        //       },
        //       onDoubleTapDown: (TapDownDetails) {},
        //     ),
        //   ),
        // ),
        // Obx(
        //   () => Positioned(
        //     top: top.value + height.value / 2 - ballDiameter / 2,
        //     left: left.value - ballDiameter / 2,
        //     child: ManipulatingBall(
        //       onDrag: (dx, dy) {
        //         var newWidth = width.value - dx;

        //         // setState(() {
        //         width.value = newWidth > 0 ? newWidth : 0;
        //         left.value = left.value + dx;
        //         if (Ctrl.to.dialogForFile.isNotEmpty) {
        //           saveDialogInfo();
        //         }
        //       },
        //       onDoubleTapDown: (TapDownDetails) {},
        //     ),
        //   ),
        // ),
        Obx(
          () => Positioned(
            top: top.value - 15,
            left: left.value - 15,
            child: ManipulatingBall(
              width: 30,
              height: 30,
              cursor: SystemMouseCursors.move,
              shape: BoxShape.circle,
              ballBgClor: Colors.grey,
              ballColor: Colors.transparent,
              child: const Icon(FluentIcons.move),
              onDrag: (dx, dy) {
                // setState(() {
                top.value = top.value + dy;
                left.value = left.value + dx;
                if (Ctrl.to.dialogForFile.isNotEmpty) {
                  saveDialogInfo();
                }
              },
              onDoubleTapDown: (TapDownDetails) {},
            ),
          ),
        ),
      ],
    )
        // )
        ;
  }

  void saveDialogInfo() {
    Ctrl.to.dialogForFile.first.height = height.value;
    Ctrl.to.dialogForFile.first.width = width.value;
    Ctrl.to.dialogForFile.first.top = top.value;
    Ctrl.to.dialogForFile.first.left = left.value;
  }

  // void manipulateWidth(Object? v) {
  //   final int selWidthIdx = int.parse(v.toString()) - 1;
  //   Ctrl.to.selectedWidthWidget.value = v.toString();
  //   Ctrl.to.gridWidgets[idx].Ctrl.to.width.value =
  //       Ctrl.to.gridWidgets[selWidthIdx].Ctrl.to.width.value;
  // }

  // void manipulateHeight(Object? v) {
  //   final int selHeightIdx = int.parse(v.toString()) - 1;
  //   Ctrl.to.selectedHeightWidget.value = v.toString();
  //   Ctrl.to.gridWidgets[idx].Ctrl.to.height.value =
  //       Ctrl.to.gridWidgets[selHeightIdx].Ctrl.to.height.value;
  // }

  // void attachWidget(Object? v, String direction, double distance) {
  //   // Ctrl.to.selectedWidget.value = v.toString();
  //   final int selIdx = int.parse(Ctrl.to.selectedWidget.value) - 1;
  //   //갖다붙일 오프셋
  //   final Offset attachOffset = Offset(
  //     Ctrl.to.gridWidgets[selIdx].left.value,
  //     Ctrl.to.gridWidgets[selIdx].top.value,
  //   );
  //   if (direction == '오른쪽') {
  //     Ctrl.to.gridWidgets[idx].left.value =
  //         attachOffset.dx + Ctrl.to.gridWidgets[selIdx].Ctrl.to.width.value + distance;
  //     Ctrl.to.gridWidgets[idx].top.value = attachOffset.dy; // +
  //     log('오른쪽 패딩 : ${Ctrl.to.gridWidgets[idx].left.value}');
  //   }
  //   if (direction == '왼쪽') {
  //     Ctrl.to.gridWidgets[idx].left.value =
  //         attachOffset.dx - Ctrl.to.gridWidgets[idx].Ctrl.to.width.value - distance;
  //     Ctrl.to.gridWidgets[idx].top.value = attachOffset.dy; // +
  //   }
  //   if (direction == '위') {
  //     Ctrl.to.gridWidgets[idx].left.value = attachOffset.dx;
  //     Ctrl.to.gridWidgets[idx].top.value = attachOffset.dy -
  //         Ctrl.to.gridWidgets[idx].Ctrl.to.height.value -
  //         distance; // +
  //   }
  //   if (direction == '아래') {
  //     Ctrl.to.gridWidgets[idx].left.value = attachOffset.dx;
  //     Ctrl.to.gridWidgets[idx].top.value = attachOffset.dy +
  //         Ctrl.to.gridWidgets[selIdx].Ctrl.to.height.value +
  //         distance; // +
  //   }
  // }
}

class UIMakerResizebleWidget extends StatelessWidget {
  UIMakerResizebleWidget({
    Key? key,
    // required this.child,
    required this.idx,
    this.isShowContext = true,
    required this.widgetColor,
    required this.childPosId,
    required this.name,
    required this.className,
    required this.menuId,
    required this.menuSubId,
  });
  final int idx;
  final RxInt childPosId;
  // final Widget child;
  final bool isShowContext;
  double ballDiameter = 10;
  Rx<Color> widgetColor = Colors.transparent.obs;
  RxDouble height = 200.0.obs; //10.17*6
  RxDouble width = 200.0.obs; //19.2*6

  RxDouble top = 0.0.obs;
  RxDouble left = 0.0.obs;
  RxBool isSelector = false.obs;
  RxString selDirection = '오른쪽'.obs;
  RxString selDistance = '0.1'.obs;
  RxBool isHide = true.obs;
  double initX = 0;
  double initY = 0;
  RxBool isHover = false.obs;
  RxString name = ''.obs;
  RxString className = ''.obs;
  RxInt menuId = 0.obs;
  RxInt menuSubId = 0.obs;
  // RxInt childPosId= 0.obs;
  _handleDrag(details) {
    // setState(() {
    initX = details.globalPosition.dx;
    initY = details.globalPosition.dy;
    // });
  }

  RxBool widgetHide = false.obs;
  handleUpdate(DragUpdateDetails details, BuildContext context) {
    // double dx = details.globalPosition.dx - initX; //현재위치에서 그 전의 위치 빼는 것.
    // double dy = details.globalPosition.dy - initY;
    double dx = details.globalPosition.dx - initX; //현재위치에서 그 전의 위치 빼는 것.
    double dy = details.globalPosition.dy - initY;
    onDrag(dx, dy);
  }

  void onDrag(double dx, double dy) {
    var newTop = top.value + dy;
    var newLeft = left.value + dx;

    // setState(() {
    top.value = newTop;
    left.value = newLeft;
    // });
  }

  @override
  Widget build(BuildContext context) {
    final double verticalPadding = 2.0;
    final double contextMenuWidth = 200;
    return Obx(() => Visibility(
              visible: !widgetHide.value,
              child: GestureDetector(
                onTap: () {
                  isHide.value = !isHide.value;
                  Ctrl.to.modifiedswidgetName.value = name.value;
                  Ctrl.to.modifiedClassName.value = className.value;
                  Ctrl.to.modifiedMenuId.value = menuId.value.toString();
                  Ctrl.to.modifiedSubMenuId.value = menuSubId.value.toString();
                  Ctrl.to.modifiedChildPosId.value =
                      childPosId.value.toString();
                  //isHide가 false일때 위젯이 선택 된거임.
                  log('탭 했을때 isHide : ${isHide.value}');
                  log('탭 했을때 widgetame : ${Ctrl.to.modifiedswidgetName.value}');
                  List<UIMakerResizebleWidget> gridWidgets =
                      Ctrl.to.gridWidgets.where((p0) => p0.idx != idx).toList();
                  for (var i = 0; i < gridWidgets.length; i++) {
                    gridWidgets[i].isHide.value = true;
                  }
                },
                onSecondaryTapDown: (d) {
                  debugPrint('$idx이건가 ${d.globalPosition}');

                  // if (idx != -1) {
                  //   if (isShowContext) {
                  // WidgetsBinding.instance.addPostFrameCallback((_) {
                  showContextMenu(d.globalPosition, context, (ctx) {
                    return [
                      Expander(
                        // initiallyExpanded: ,
                        header: Text('위젯 선택'),
                        content: Column(
                          children: [
                            // Icon(FluentIcons.align_horizontal_left),
                            // Obx(
                            //   () =>

                            Row(
                              children: [
                                Container(
                                    width: 70,
                                    child: Text('붙일 곳', style: cardTitle)),
                                SizedBox(
                                    // width: 0,
                                    child: Column(
                                  children: List.generate(3, (colIdx) {
                                    if (colIdx == 0) {
                                      return Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Padding(
                                              padding: const EdgeInsets.only(
                                                bottom: 2.0,
                                                right: 2.0,
                                              ),
                                              child: Stack(children: [
                                                Obx(
                                                  () => Visibility(
                                                    visible:
                                                        selDirection.value ==
                                                            '위',
                                                    child: Positioned(
                                                      left: 3.5,
                                                      top: 3.5,
                                                      child:
                                                          WidgetSelectorBadge(),
                                                    ),
                                                  ),
                                                ),
                                                WidgetSelectorBtn(
                                                  onSelected: () {
                                                    selDirection.value = '위';
                                                    final double distance =
                                                        double.parse(
                                                            selDistance.value);
                                                    attachWidget(
                                                        Ctrl.to.selectedWidget
                                                            .value,
                                                        selDirection.value,
                                                        distance,
                                                        context);
                                                  },
                                                ),
                                              ])),
                                        ],
                                      );
                                    }
                                    if (colIdx == 1) {
                                      return Row(
                                        children: [
                                          Padding(
                                              padding: const EdgeInsets.only(
                                                bottom: 2.0,
                                                right: 2.0,
                                              ),
                                              child: Stack(children: [
                                                Obx(
                                                  () => Visibility(
                                                    visible:
                                                        selDirection.value ==
                                                            '왼쪽',
                                                    child: Positioned(
                                                      left: 3.5,
                                                      top: 3.5,
                                                      child:
                                                          WidgetSelectorBadge(),
                                                    ),
                                                  ),
                                                ),
                                                WidgetSelectorBtn(
                                                  onSelected: () {
                                                    selDirection.value = '왼쪽';
                                                    final double distance =
                                                        double.parse(
                                                            selDistance.value);
                                                    attachWidget(
                                                        Ctrl.to.selectedWidget
                                                            .value,
                                                        selDirection.value,
                                                        distance,
                                                        context);
                                                  },
                                                ),
                                              ])),
                                          Padding(
                                              padding: const EdgeInsets.only(
                                                bottom: 2.0,
                                                right: 2.0,
                                              ),
                                              child:
                                                  Obx(() => WidgetSelectorBtn(
                                                        bgColor: Ctrl
                                                                .to.gridWidgets
                                                                .firstWhereOrNull((p0) =>
                                                                    p0.name
                                                                        .value ==
                                                                    Ctrl
                                                                        .to
                                                                        .selectedWidget
                                                                        .value)
                                                                ?.widgetColor
                                                                .value ??
                                                            Colors.transparent,
                                                        borderColor:
                                                            Colors.transparent,
                                                        onSelected: () {},
                                                      ))),
                                          Stack(children: [
                                            Obx(
                                              () => Visibility(
                                                visible:
                                                    selDirection.value == '오른쪽',
                                                child: Positioned(
                                                  left: 3.5,
                                                  top: 3.5,
                                                  child: WidgetSelectorBadge(),
                                                ),
                                              ),
                                            ),
                                            Padding(
                                                padding: const EdgeInsets.only(
                                                  bottom: 2.0,
                                                  right: 2.0,
                                                ),
                                                child: WidgetSelectorBtn(
                                                  onSelected: () {
                                                    selDirection.value = '오른쪽';
                                                    final double distance =
                                                        double.parse(
                                                            selDistance.value);
                                                    attachWidget(
                                                        Ctrl.to.selectedWidget
                                                            .value,
                                                        selDirection.value,
                                                        distance,
                                                        context);
                                                  },
                                                )),
                                          ]),
                                        ],
                                      );
                                    } else {
                                      return Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Stack(children: [
                                            Obx(
                                              () => Visibility(
                                                visible:
                                                    selDirection.value == '아래',
                                                child: Positioned(
                                                  left: 3.5,
                                                  top: 3.5,
                                                  child: WidgetSelectorBadge(),
                                                ),
                                              ),
                                            ),
                                            Padding(
                                                padding: const EdgeInsets.only(
                                                  bottom: 2.0,
                                                  right: 2.0,
                                                ),
                                                child: WidgetSelectorBtn(
                                                  onSelected: () {
                                                    selDirection.value = '아래';
                                                    final double distance =
                                                        double.parse(
                                                            selDistance.value);
                                                    attachWidget(
                                                        Ctrl.to.selectedWidget
                                                            .value,
                                                        selDirection.value,
                                                        distance,
                                                        context);
                                                  },
                                                )),
                                          ]),
                                        ],
                                      );
                                    }
                                    return Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 2.0),
                                      child: Row(children: []
                                          // List.generate(
                                          //     3,
                                          //     (rowIdx) =>

                                          //      Padding(
                                          //           padding:
                                          //               const EdgeInsets
                                          //                       .only(
                                          //                   right: 2.0),
                                          //           child: Stack(
                                          //               children: [
                                          //                 GestureDetector(
                                          //                   onTap:
                                          //                       (() {}),
                                          //                   child:
                                          //                       Container(
                                          //                     width: 14,
                                          //                     height:
                                          //                         14,
                                          //                     color: Colors
                                          //                         .white,
                                          //                   ),
                                          //                 ),
                                          //                 Visibility(
                                          //                   visible: !(colIdx ==
                                          //                           1 &&
                                          //                       rowIdx ==
                                          //                           1),
                                          //                   child:
                                          //                       Positioned(
                                          //                     left: 3.5,
                                          //                     top: 3.5,
                                          //                     child:
                                          //   Container(
                                          // width:
                                          //     7,
                                          // height:
                                          //     7,
                                          // color: Colors
                                          //     .red,
                                          //                     ),
                                          //                   ),
                                          //                 )
                                          //               ]),
                                          //         )),

                                          ),
                                    );
                                  }),
                                )

                                    //  Combobox(
                                    //   value: selDirection.value,
                                    //   items: [
                                    //     ComboboxItem(
                                    //       child: Text('오른쪽'),
                                    //       value: '오른쪽',
                                    //     ),
                                    //     ComboboxItem(
                                    //       child: Text('왼쪽'),
                                    //       value: '왼쪽',
                                    //     ),
                                    //     ComboboxItem(
                                    //       child: Text('위'),
                                    //       value: '위',
                                    //     ),
                                    //     ComboboxItem(
                                    //       child: Text('아래'),
                                    //       value: '아래',
                                    //     )
                                    //   ],
                                    //   onChanged: (v) {
                                    //     selDirection.value = v.toString();
                                    //     final double distance =
                                    //         double.parse(selDistance.value);
                                    //     attachWidget(
                                    //         Ctrl.to.selectedWidget.value,
                                    //         selDirection.value,
                                    //         distance);
                                    //     // saveFile();
                                    //     // // Ctrl.to.gridWidgetsForFile[idx].width =
                                    //     // // width.value;
                                    //     // Ctrl.to.gridWidgetsForFile[idx].height =
                                    //     //     height.value;
                                    //     // Ctrl.to.gridWidgetsForFile[idx].top =
                                    //     //     top.value;
                                    //     // Ctrl.to.gridWidgetsForFile[idx].left =
                                    //     //     left.value;
                                    //     // Ctrl.to.gridWidgetsForFile[idx].color =
                                    //     //     color.value;
                                    //   },
                                    // ),
                                    ),
                              ],
                            ),
                            // ),
                            Row(
                              children: [
                                Container(
                                    width: 67,
                                    child: Text('간격', style: cardTitle)),
                                SizedBox(
                                  width: 100,
                                  child: Obx(() => Slider(
                                      label: selDistance.value,
                                      style: SliderThemeData(
                                          labelBackgroundColor: Colors.grey,
                                          activeColor: WGSColors.mint),
                                      value: double.parse(selDistance.value),
                                      min: 0.0,
                                      max: 50.0,
                                      onChanged: (v) {
                                        selDistance.value = v.toString();
                                        final double distance =
                                            double.parse(selDistance.value);
                                        log('간격/ %: ${selDistance.value} / $distance');

                                        attachWidget(
                                            Ctrl.to.selectedWidget.value,
                                            selDirection.value,
                                            distance,
                                            context);
                                      })),

                                  // Combobox(
                                  //   value: selDistance.value,
                                  //   items: List.generate(
                                  //     11,
                                  //     (index) => ComboboxItem(
                                  //       child: Text(
                                  //           (0.1 * index).toStringAsFixed(1)),
                                  //       value: (0.1 * index).toStringAsFixed(1),
                                  //     ),
                                  //   ),
                                  //   onChanged: (v) {
                                  //     // attachWidget(sel.value, v.toString());
                                  //     selDistance.value = v.toString();
                                  // final double ratio =
                                  //     double.parse(v.toString());
                                  // final double distance =
                                  //     double.parse(selDistance.value);
                                  // attachWidget(Ctrl.to.selectedWidget.value,
                                  //     selDirection.value, distance);
                                  //     debugPrint(
                                  //         '$v / ${MediaQuery.of(context).size.width}의 미디어쿼리 패딩>>>>>>>>> : ${MediaQuery.of(context).size.width * ratio}');
                                  //     // Navigator.pop(context);
                                  //   },
                                  // ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Container(
                                    width: 70,
                                    child: Text('위젯 검색', style: cardTitle)),
                                SizedBox(
                                  width: 97,
                                  child: AutoSuggestBox(
                                    items: Ctrl.to.gridWidgets
                                        .where((p0) =>
                                            p0.childPosId.value ==
                                            childPosId.value)
                                        .map((p1) => p1.name.value)
                                        .toList(),
                                    onSelected: (v) {
                                      // final int idx = int.parse(v.toString()) - 1;
                                      // Ctrl.to.gridWidgets[idx];
                                      Ctrl.to.selectedWidget.value =
                                          v.toString();
                                      attachWidget(
                                          Ctrl.to.selectedWidget.value,
                                          selDirection.value,
                                          double.parse(selDistance.value),
                                          context);
                                      // attachRight(v); // +
                                      // Ctrl.to.gridWidgets[selIdx].Ctrl.to.height.value;
                                      // Navigator.pop(context);
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),

                      Expander(
                          header: Text('위치 조절'),
                          content: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('top(%)', style: cardTitle),
                                  SizedBox(
                                      width: 97,
                                      child: TextBox(
                                        inputFormatters: [
                                          FilteringTextInputFormatter.digitsOnly
                                        ],
                                        onChanged: (v) {
                                          if (v != '') {
                                            final double newTop =
                                                double.parse(v.toString());
                                            final double ratioTop =
                                                (newTop / 100) * (1080 / 3);
                                            top.value = ratioTop;
                                            saveFile();
                                          }
                                        },
                                      )),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('left(%)', style: cardTitle),
                                  SizedBox(
                                      width: 97,
                                      child: TextBox(
                                        inputFormatters: [
                                          FilteringTextInputFormatter.digitsOnly
                                        ],
                                        onChanged: (v) {
                                          if (v != '') {
                                            final double newLeft =
                                                double.parse(v.toString());
                                            final double ratioLeft =
                                                (newLeft / 100) * (1920 / 3);
                                            left.value = ratioLeft;
                                            saveFile();
                                          }
                                        },
                                      )),
                                ],
                              ),
                            ],
                          )),
                      Expander(
                          header: Text('사이즈 조절'),
                          content: Column(
                            children: [
                              Obx(
                                () => Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('너비', style: cardTitle),
                                    SizedBox(
                                      width: 100,
                                      child: Combobox(
                                        value:
                                            Ctrl.to.selectedWidthWidget.value,
                                        items: List.generate(
                                            Ctrl.to.gridWidgets.length,
                                            (index) => ComboboxItem(
                                                  child: Text(Ctrl
                                                      .to
                                                      .gridWidgets[index]
                                                      .name
                                                      .value),
                                                  value: Ctrl
                                                      .to
                                                      .gridWidgets[index]
                                                      .name
                                                      .value,
                                                )),
                                        onChanged: (v) {
                                          Ctrl.to.selectedWidthWidget.value =
                                              v.toString();
                                          // final int idx = int.parse(v.toString()) - 1;
                                          // Ctrl.to.gridWidgets[idx];
                                          manipulateWidth(v);
                                          saveFile();
                                          // attachRight(v); // +
                                          // Ctrl.to.gridWidgets[selIdx].Ctrl.to.height.value;
                                          // Navigator.pop(context);
                                        },
                                      ),
                                    ),
                                    // Text('과 너비 맞추기', style: cardTitle)
                                  ],
                                ),
                              ),
                              Obx(
                                () => Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                        child: Text('높이', style: cardTitle)),
                                    SizedBox(
                                      width: 100,
                                      child: Combobox(
                                        value:
                                            Ctrl.to.selectedHeightWidget.value,
                                        items: List.generate(
                                            Ctrl.to.gridWidgets.length,
                                            (index) => ComboboxItem(
                                                  child: Text(
                                                      '${Ctrl.to.gridWidgets[index].name.value}'),
                                                  value: (Ctrl
                                                          .to
                                                          .gridWidgets[index]
                                                          .name
                                                          .value)
                                                      .toString(),
                                                )),
                                        onChanged: (v) {
                                          Ctrl.to.selectedHeightWidget.value =
                                              v.toString();
                                          // final int idx = int.parse(v.toString()) - 1;
                                          // Ctrl.to.gridWidgets[idx];
                                          manipulateHeight(v);
                                          saveFile();
                                          // attachRight(v); // +
                                          // Ctrl.to.gridWidgets[selIdx].Ctrl.to.height.value;
                                          // Navigator.pop(context);
                                        },
                                      ),
                                    ),
                                    // Text('과 높이 맞추기', style: cardTitle)
                                  ],
                                ),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                      child:
                                          Text('width(%)', style: cardTitle)),
                                  SizedBox(
                                      width: 100,
                                      child: TextBox(
                                        inputFormatters: [
                                          FilteringTextInputFormatter.digitsOnly
                                        ],
                                        onChanged: (v) {
                                          if (v != '') {
                                            final double newWidth =
                                                double.tryParse(v.toString()) ??
                                                    0;
                                            final double ratioWidth =
                                                (newWidth / 100) * (1920 / 3);
                                            if (ratioWidth > 0) {
                                              width.value = ratioWidth;
                                            }
                                            log('새로운 ratio width : ${width.value}');
                                            saveFile();
                                          }
                                        },
                                      )),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                      child:
                                          Text('height(%)', style: cardTitle)),
                                  SizedBox(
                                      width: 100,
                                      child: TextBox(
                                        inputFormatters: [
                                          FilteringTextInputFormatter.digitsOnly
                                        ],
                                        onChanged: (v) {
                                          if (v != '') {
                                            final double newHeight =
                                                double.parse(v.toString());
                                            final double ratioHeight =
                                                (newHeight / 100) * (1080 / 3);
                                            height.value = ratioHeight;
                                            log('새로운 ratio height : ${height.value}');
                                            saveFile();
                                          }
                                        },
                                      )),
                                ],
                              ),
                            ],
                          )),
                      // Expander(header: header, content: content)
                      Expander(
                          header: Text('컬러 바꾸기'),
                          content: Wrap(
                              children: List.generate(
                                  Ctrl.to.colors.length,
                                  (colorIdx) => Padding(
                                        padding: const EdgeInsets.only(
                                            right: 6.0, bottom: 6.0),
                                        child: GestureDetector(
                                          onTap: () {
                                            final Color color =
                                                Ctrl.to.colors[colorIdx];
                                            final String colorCode = '#' +
                                                color
                                                    .toString()
                                                    .split('0xff')
                                                    .last
                                                    .split(')')
                                                    .first;
                                            log(color.toString());
                                            final Color selColor =
                                                colorCode.toColor();
                                            Ctrl.to.selectedColor.value =
                                                selColor;
                                            widgetColor.value =
                                                Ctrl.to.selectedColor.value;
                                            Ctrl.to.gridWidgetsForFile[idx]
                                                    .color =
                                                Ctrl.to.selectedColor.value;
                                            // Ctrl.to.selectedColor.value = color;
                                          },
                                          child: Container(
                                            width: 20,
                                            height: 20,
                                            color: Ctrl.to.colors[colorIdx],
                                          ),
                                        ),
                                      )))),
                      // Expander(header: header, content: content)

                      // Padding(
                      //   padding: const EdgeInsets.only(
                      //     left: 16.0,
                      //     right: 12.0,
                      //     top: 10,
                      //     bottom: 10,
                      //   ),
                      //   child: Row(
                      //     mainAxisAlignment:
                      //         MainAxisAlignment.spaceBetween,
                      //     children: [
                      //       Container(
                      //           // width: 100,
                      //           child: Text('사이즈 조절기 hide',
                      //               style: cardTitle)),
                      //       SizedBox(
                      //           // width: 62,
                      //           child: Obx(() => ToggleSwitch(
                      //                 checked: isHide.value,
                      //                 onChanged: (v) {
                      //                   isHide.value = v;
                      //                 },
                      //               ))),
                      //     ],
                      //   ),
                      // ),
                      // Divider(
                      //   style: DividerThemeData(
                      //       thickness: 0.2,
                      //       decoration: BoxDecoration(
                      //         color: Colors.white,
                      //       )),
                      // ),
                      GestureDetector(
                        onTap: () {
                          // Ctrl.to.gridWidgets.removeAt(idx);
                          // Ctrl.to.gridWidgets
                          //     .insert(0, Ctrl.to.gridWidgets[idx]);
                          // Ctrl.to.gridWidgets.insert(
                          //     Ctrl.to.gridWidgets.length - 1,
                          //     Ctrl.to.gridWidgets[idx]);
                          // Ctrl.to.gridWidgets.removeAt(idx);
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(
                            left: 16.0,
                            right: 12.0,
                            top: 10,
                            bottom: 10,
                          ),
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              // crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  // width: 100,
                                  // height: 48,
                                  child: Text('맨 위로 '),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          // Ctrl.to.gridWidgets
                          //     .insert(0, Ctrl.to.gridWidgets[idx]);
                          // Ctrl.to.gridWidgets.removeAt(idx + 1);
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(
                            left: 16.0,
                            right: 12.0,
                            top: 10,
                            bottom: 10,
                          ),
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              // crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  // width: 100,
                                  // height: 48,
                                  child: Text('맨 뒤로 '),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Ctrl.to.gridWidgets.removeAt(idx);
                          Ctrl.to.gridWidgetsForFile.removeAt(idx);
                          Navigator.pop(context);
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(
                            left: 16.0,
                            right: 12.0,
                            top: 10,
                            bottom: 10,
                          ),
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              // crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  // width: 100,
                                  // height: 48,
                                  child: Text('삭제하기'),
                                ),
                                SizedBox(
                                    // width: 62,
                                    child: Icon(
                                  FluentIcons.delete,
                                )),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ];
                  }, verticalPadding, contextMenuWidth);
                  // });
                  isSelector.value = !isSelector.value;
                  //   }
                  // }
                },
                child: Stack(
                  children: <Widget>[
                    Obx(
                      () => Positioned(
                          top: top.value,
                          left: left.value,
                          child: MouseRegion(
                            onEnter: (v) {
                              log('엔터');
                            },
                            onHover: (v) {
                              // if (v.) {
                              // log('호호호버 다운');
                              // }
                              isHover.value = true;
                              log('호호호버 ${isHover.value}');
                            },
                            onExit: (v) {
                              isHover.value = false;
                              log('호호호버 ${isHover.value}');
                            },
                            child: SizedBox(
                                width: width.value,
                                height: height.value,
                                child: Obx(
                                  () => Container(
                                      decoration: BoxDecoration(
                                          border:
                                              isHover.isTrue || isHide.isFalse
                                                  ? Border.all(
                                                      color: WGSColors.mint)
                                                  : null,
                                          color: widgetColor.value),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text('widgetname : ${name.value}'),
                                          Text(
                                              'classname : ${className.value}'),
                                          Text('menuId : ${menuId.value}'),
                                          Text(
                                              'menuSubId : ${menuSubId.value}'),
                                          Text(
                                              'top : ${(top.value / 3.6).toStringAsFixed(2)}'),
                                          Text(
                                              'left : ${(left.value / 6.4).toStringAsFixed(2)}')
                                        ],
                                      )),
                                )),
                          )),
                    ),
                    Obx(
                      () => Positioned(
                        top: top.value + 1,
                        left: left.value + 1,
                        child: Visibility(
                          visible: isHide.isFalse,
                          child: ManipulatingBall(
                            // ballColor: Colors.red,
                            cursor: SystemMouseCursors.move,
                            width: width.value - 2,
                            height: height.value - 2,
                            onDrag: (dx, dy) {
                              // setState(() {
                              final double checkTop = top.value + dy;
                              final double checkLeft = left.value + dx;
                              final double checkBottom =
                                  top.value + dy + height.value;
                              final double checkRight =
                                  left.value + dx + width.value;
                              log('현재 위치 : ${top.value} / ${left.value} ');
                              if (checkTop < 0.0 ||
                                  checkLeft < 0.0 ||
                                  checkBottom >
                                      MediaQuery.of(context).size.height / 3 ||
                                  checkRight >
                                      MediaQuery.of(context).size.width / 3) {
                                final snackbar = Snackbar(
                                    content: Container(
                                  color: WGSColors.weakGrey,
                                  child: const Text('그리드 밖을 벗어날 수 없습니다.'),
                                ));
                                showSnackbar(context, snackbar);
                              } else {
                                top.value = top.value + dy;
                                left.value = left.value + dx;
                              }
                              if (idx != -1) {
                                Ctrl.to.gridWidgetsForFile[idx].top = top.value;
                                Ctrl.to.gridWidgetsForFile[idx].left =
                                    left.value;
                                debugPrint(
                                    '$idx 번째 파일저장용 : ${Ctrl.to.gridWidgetsForFile}');
                              }
                              // Ctrl.to.offsetList[idx] = Offset(left.value, top.value);
                            },
                            onDoubleTapDown: (TapDownDetails) {},
                          ),
                        ),
                      ),
                    ),
                    //위에 가운데
                    Obx(
                      () => Positioned(
                        top: top.value - ballDiameter / 2,
                        left: left.value + ballDiameter / 2,
                        // + width.value / 2 - ballDiameter / 2,
                        child: Visibility(
                          visible: isHide.isFalse,
                          child: ManipulatingBall(
                            cursor: SystemMouseCursors.resizeRow,
                            width: width.value - ballDiameter,
                            ballColor: Colors.transparent,
                            onDrag: (dx, dy) {
                              var newHeight = height.value - dy;

                              // setState(() {
                              height.value = newHeight > 0 ? newHeight : 0;
                              top.value = top.value + dy;

                              if (idx != -1) {
                                Ctrl.to.gridWidgetsForFile[idx].height =
                                    height.value;
                                Ctrl.to.gridWidgetsForFile[idx].top = top.value;
                                debugPrint(
                                    '$idx 번째 파일저장용 : ${Ctrl.to.gridWidgetsForFile}');
                              }
                              // Ctrl.to.offsetList[idx] = Offset(left.value, top.value);
                              // });
                            },
                            onDoubleTapDown: (TapDownDetails d) {
                              final double dy = d.globalPosition.dy;
                              // top.value = 0;
                              double newHeight = height.value + top.value;
                              // height.value = 1080;
                              height.value = newHeight;
                              top.value = 0;
                              Ctrl.to.gridWidgetsForFile[idx].height =
                                  height.value;

                              // Ctrl.to.gridWidgetsForFile[idx].top = top.value;
                            },
                          ),
                        ),
                      ),
                    ),
//오른쪽 가운데
                    Obx(
                      () => Positioned(
                        top: top.value + ballDiameter / 2,
                        left: left.value + width.value - ballDiameter / 2,
                        child: Visibility(
                          visible: isHide.isFalse,
                          child: ManipulatingBall(
                            // ballBgClor: Colors.red,
                            cursor: SystemMouseCursors.resizeColumn,
                            height: height.value - ballDiameter,
                            ballColor: Colors.transparent,
                            onDrag: (dx, dy) {
                              var newWidth = width.value + dx;

                              // setState(() {
                              width.value = newWidth > 0 ? newWidth : 0;

                              if (idx != -1) {
                                Ctrl.to.gridWidgetsForFile[idx].width =
                                    width.value;
                                debugPrint(
                                    '$idx 번째 파일저장용 : ${Ctrl.to.gridWidgetsForFile}');
                              }
                              // Ctrl.to.offsetList[idx] = Offset(left.value, top.value);
                              // });
                            },
                            onDoubleTapDown: (TapDownDetails d) {
                              // final double dx = d.globalPosition.dx;

                              final double newWidth = width.value +
                                  640.0 -
                                  (width.value + left.value);
                              width.value = newWidth;

                              Ctrl.to.gridWidgetsForFile[idx].left = left.value;
                              Ctrl.to.gridWidgetsForFile[idx].width =
                                  width.value;
                            },
                          ),
                        ),
                      ),
                    ),
                    Obx(
                      () => Positioned(
                        top: top.value + height.value - ballDiameter / 2,
                        left: left.value + ballDiameter / 2,
                        child: Visibility(
                          visible: isHide.isFalse,
                          child: ManipulatingBall(
                            // ballBgClor: Colors.white,
                            cursor: SystemMouseCursors.resizeRow,
                            ballColor: Colors.transparent,
                            width: width.value - ballDiameter,
                            onDrag: (dx, dy) {
                              var newHeight = height.value + dy;

                              // setState(() {
                              height.value = newHeight > 0 ? newHeight : 0;
                              if (idx != -1) {
                                Ctrl.to.gridWidgetsForFile[idx].height =
                                    height.value;
                                debugPrint(
                                    '$idx 번째 파일저장용 : ${Ctrl.to.gridWidgetsForFile}');
                              } // Ctrl.to.offsetList[idx] = Offset(left.value, top.value);
                              // });
                            },
                            onDoubleTapDown: (TapDownDetails d) {
                              // final double dy = d.globalPosition.dy;
                              // top.value = 0;
                              // height.value = 1080;
                              final double newHeight = height.value +
                                  360.0 -
                                  (top.value + height.value);
                              height.value = newHeight;
                              Ctrl.to.gridWidgetsForFile[idx].top = top.value;
                              Ctrl.to.gridWidgetsForFile[idx].height =
                                  height.value;
                            },
                          ),
                        ),
                      ),
                    ),

                    Obx(
                      () => Positioned(
                        top: top.value + ballDiameter / 2,
                        left: left.value - ballDiameter / 2,
                        child: Visibility(
                          visible: isHide.isFalse,
                          child: ManipulatingBall(
                            ballBgClor: Colors.transparent,
                            cursor: SystemMouseCursors.resizeColumn,
                            ballColor: Colors.transparent,
                            height: height.value - ballDiameter,
                            onDrag: (dx, dy) {
                              var newWidth = width.value - dx;

                              // setState(() {
                              width.value = newWidth > 0 ? newWidth : 0;
                              left.value = left.value + dx;

                              if (idx != -1) {
                                Ctrl.to.gridWidgetsForFile[idx].width =
                                    width.value;
                                Ctrl.to.gridWidgetsForFile[idx].left =
                                    left.value;
                                debugPrint(
                                    '$idx 번째 파일저장용 : ${Ctrl.to.gridWidgetsForFile}');
                              }

                              // Ctrl.to.offsetList[idx] = Offset(left.value, top.value);
                            },
                            onDoubleTapDown: (TapDownDetails d) {
                              // final double dx = d.globalPosition.dx;
                              // left.value = 0;
                              // width.value = 1920;
                              final double newWidth = width.value + left.value;

                              width.value = newWidth;
                              left.value = 0;
                              Ctrl.to.gridWidgetsForFile[idx].width =
                                  width.value;
                              Ctrl.to.gridWidgetsForFile[idx].left = left.value;
                            },
                          ),
                        ),
                      ),
                    ),
                    // bottom center
                    // bottom left
                    //left center
                    // center center
                  ],
                ),
              ),
            )
        // )

        );
  }

  void saveFile() {
    Ctrl.to.gridWidgetsForFile[idx].height = height.value / 3.6;
    Ctrl.to.gridWidgetsForFile[idx].top = top.value / 3.6;
    Ctrl.to.gridWidgetsForFile[idx].left = left.value / 6.4;
    Ctrl.to.gridWidgetsForFile[idx].width = width.value / 6.4;
    Ctrl.to.gridWidgetsForFile[idx].color = widgetColor.value;
  }

  void manipulateWidth(Object? v) {
    final int selWidthIdx = Ctrl.to.gridWidgetsForFile
        .indexWhere((element) => element.name == v.toString());
    // Ctrl.to.selectedWidthWidget.value = v.toString();
    Ctrl.to.gridWidgets[idx].width.value =
        Ctrl.to.gridWidgets[selWidthIdx].width.value;
  }

  void manipulateHeight(Object? v) {
    final int selHeightIdx = Ctrl.to.gridWidgetsForFile
        .indexWhere((element) => element.name == v.toString());
    Ctrl.to.selectedHeightWidget.value = v.toString();
    Ctrl.to.gridWidgets[idx].height.value =
        Ctrl.to.gridWidgets[selHeightIdx].height.value;
  }

  void attachWidget(
      Object? v, String direction, double distance, BuildContext context) {
    // Ctrl.to.selectedWidget.value = v.toString();
    final double widthRatio = MediaQuery.of(context).size.width / 3;
    final double heightRatio = MediaQuery.of(context).size.height / 3;

    final int selIdx = Ctrl.to.gridWidgetsForFile
        .indexWhere((p0) => p0.name == Ctrl.to.selectedWidget.value);
    //갖다붙일 오프셋
    final Offset attachOffset = Offset(
      Ctrl.to.gridWidgets[selIdx].left.value,
      Ctrl.to.gridWidgets[selIdx].top.value,
    );
    if (direction == '오른쪽') {
      Ctrl.to.gridWidgets[idx].left.value = attachOffset.dx +
          Ctrl.to.gridWidgets[selIdx].width.value +
          (distance / 100) * widthRatio;
      Ctrl.to.gridWidgets[idx].top.value = attachOffset.dy; // +
      log('오른쪽 패딩 : ${(distance / 100) * widthRatio}');
    }
    if (direction == '왼쪽') {
      Ctrl.to.gridWidgets[idx].left.value =
          attachOffset.dx - Ctrl.to.gridWidgets[idx].width.value - distance;
      Ctrl.to.gridWidgets[idx].top.value = attachOffset.dy; // +
    }
    if (direction == '위') {
      Ctrl.to.gridWidgets[idx].left.value = attachOffset.dx;
      Ctrl.to.gridWidgets[idx].top.value = attachOffset.dy -
          Ctrl.to.gridWidgets[idx].height.value -
          distance; // +z
    }
    if (direction == '아래') {
      Ctrl.to.gridWidgets[idx].left.value = attachOffset.dx;
      Ctrl.to.gridWidgets[idx].top.value = attachOffset.dy +
          Ctrl.to.gridWidgets[selIdx].height.value +
          distance; // +
    }
    Ctrl.to.gridWidgetsForFile[idx].height = height.value;
    Ctrl.to.gridWidgetsForFile[idx].top = top.value;
    Ctrl.to.gridWidgetsForFile[idx].left = left.value;
    Ctrl.to.gridWidgetsForFile[idx].color = widgetColor.value;
  }
}

class ManipulatingBall extends StatefulWidget {
  ManipulatingBall({
    Key? key,
    required this.onDrag,
    this.width = 10,
    this.height = 10,
    required this.onDoubleTapDown,
    this.ballColor = WGSColors.mint,
    this.cursor = MouseCursor.defer,
    this.child,
    this.shape = BoxShape.rectangle,
    this.ballBgClor = Colors.transparent,
  });
  final Function(TapDownDetails)? onDoubleTapDown;
  final Function onDrag;
  final double width;
  final double height;
  final Color ballColor;
  final Color ballBgClor;
  final MouseCursor cursor;
  final Widget? child;
  final BoxShape shape;
  @override
  _ManipulatingBallState createState() => _ManipulatingBallState();
}

class _ManipulatingBallState extends State<ManipulatingBall> {
  double initX = 0;
  double initY = 0;

  _handleDrag(details) {
    setState(() {
      initX = details.globalPosition.dx;
      initY = details.globalPosition.dy;
    });
  }

  handleUpdate(DragUpdateDetails details) {
    // double dx = details.globalPosition.dx - initX; //현재위치에서 그 전의 위치 빼는 것.
    // double dy = details.globalPosition.dy - initY;
    double dx = details.globalPosition.dx - initX; //현재위치에서 그 전의 위치 빼는 것.
    double dy = details.globalPosition.dy - initY;
    final ddd = details.localPosition;
    log('mouse x:$initX y:$initY');
    final double bbb = 10.17;
    final int aaa = (dy ~/ bbb);
    final int ccc = dx ~/ 19.2;
    debugPrint('local>>>>>>>>>>>>>>>:$ddd');
    // if (dy == 2) {
    // if (aaa == 0 && ccc == 0) {

    // if (dx.abs() > 19.2) {
    initX = details.globalPosition.dx;
    initY = details.globalPosition.dy;
    debugPrint('미디어쿼리 : ${MediaQuery.of(context).size.width * 0.01}');

    widget.onDrag(dx, dy);
    // }

    // }
    // widget.onDrag(dx * 19.2, dy * 10.17);
    // }
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: widget.cursor,
      child: GestureDetector(
        onDoubleTapDown: widget.onDoubleTapDown,
        onDoubleTap: () {
          log('더블탭 ');
        },
        onPanStart: _handleDrag,
        onPanUpdate: handleUpdate,
        child: Container(
            width: widget.width, //10,
            height: widget.height, //10,
            decoration: BoxDecoration(
              color: widget.ballBgClor,
              border: Border.all(
                color: widget.ballColor,
              ),
              shape: widget.shape,
            ),
            child: widget.child //Text('data'),
            ),
      ),
    );
  }
}

class MyWidget extends StatelessWidget {
  MyWidget(
      {Key? key,
      required this.width,
      required this.height,
      required this.child,
      required this.onDrag,
      required this.context,
      required this.idx
      // required this.initX,
      // required this.initY,
      })
      : super(key: key);
  final double width;
  final double height;
  final Widget child;
  final Function onDrag;
  final BuildContext context;
  // final double initX;
  // final double initY;
  final int idx;
  RxDouble initX = 0.0.obs;
  RxDouble initY = 0.0.obs;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapUp: (d) {
        log('탭업');
      },
      onTapDown: (d) {
        log('탭다운');
      },
      onPanStart: (d) {
        log('팬 스타트');
        Ctrl.to.newLeft.value = d.globalPosition.dx;
        Ctrl.to.newTop.value = d.globalPosition.dy;
        log('in pan 현재 마우스 위치 :${Ctrl.to.newLeft.value}/${Ctrl.to.newTop.value}');
        // final double initX = 0;
        // final double initY = 0;
        // final List<double> inits =
        //     Ctrl.to.handleDrag(d, initX.value, initY.value);
        // initX.value = inits.first;
        // initY.value = inits.last;
      },
      onPanUpdate: (d) {
        // final double initX = 0;
        // // final double initY = 0;
        // final List<double> inits =
        //     Ctrl.to.handleUpdate(d, initX.value, initY.value);

        // Ctrl.to.newLeft.value = inits.first;
        // Ctrl.to.newTop.value = inits.last;
        // log('dx dy 제대로?? : ${d.globalPosition} / ${Ctrl.to.newTop.value}');
        // // Ctrl.to.gridWidgets[idx].top.value =
        // //     Ctrl.to.gridWidgets[idx].top.value + inits.last;
        // // Ctrl.to.gridWidgets[idx].left.value =
        // //     Ctrl.to.gridWidgets[idx].left.value + inits.first;
        log('in update 현재 마우스 위치 :${d.globalPosition}');
        final double initX = d.globalPosition.dx - Ctrl.to.newLeft.value;
        final double initY = d.globalPosition.dy - Ctrl.to.newTop.value;
        onDrag(d.globalPosition.dx, d.globalPosition.dy);
      },
      child: SizedBox(
        width: width,
        height: height,
        child: child,
      ),
    );
  }
}

extension ColorExtension on String {
  toColor() {
    var hexColor = this.replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    if (hexColor.length == 8) {
      return Color(int.parse("0x$hexColor"));
    }
  }
}

extension HexColor on Color {
  /// String is in the format "aabbcc" or "ffaabbcc" with an optional leading "#".
  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }

  /// Prefixes a hash sign if [leadingHashSign] is set to `true` (default is `true`).
  String toHex({bool leadingHashSign = true}) => '${leadingHashSign ? '#' : ''}'
      '${alpha.toRadixString(16).padLeft(2, '0')}'
      '${red.toRadixString(16).padLeft(2, '0')}'
      '${green.toRadixString(16).padLeft(2, '0')}'
      '${blue.toRadixString(16).padLeft(2, '0')}';
}
