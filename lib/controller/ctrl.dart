// ignore_for_file: unused_import

import 'dart:developer';

import 'package:fluent_ui/fluent_ui.dart';
import 'package:get/get.dart';
import 'package:ui_maker/components/wgs_appbar.dart';
import 'package:ui_maker/main.dart';
import 'package:ui_maker/model/grid_widget.dart';
import 'package:ui_maker/resizable_widget.dart';

class Ctrl extends GetxController {
  static Ctrl get to => Get.find();
  static bool get isPut => Get.isRegistered<Ctrl>();
  // Size appSize = Size(0, 0);
  // Rx<Offset> offset = Offset(0, 0).obs;
  Rx<Color> selectedColor = const Color(0xff4692ce).obs;
  RxDouble height = 214.0.obs;
  RxDouble width = 192.0.obs;
  RxInt selectedPage = 0.obs;
  RxList<Widget> widgetList = RxList.empty();
  RxDouble dividerDistance = 1000.0.obs;
  RxInt selectedMenuId = 0.obs;
  RxInt selectedSubMenuId = 0.obs;
  // RxList<MovingWidget> movingWidgets = RxList.empty();
  RxInt rowNum = 0.obs;
  RxInt colNum = 0.obs;
  RxInt rowSpan = 0.obs;
  RxInt colSpan = 0.obs;
  RxString selectedClassName = ''.obs;
  RxString selectedWidgetForAdd = '커스텀'.obs;
  RxInt selectedChildPosId = 0.obs;
  RxList<UIMakerResizebleWidget> gridWidgets = RxList.empty();
  RxList<GridWidget> dialogForFile = RxList.empty();
  RxList<GridWidget> gridWidgetsForFile = RxList.empty();
  RxDouble widgetWidth = 0.0.obs;
  RxDouble widgetHeight = 0.0.obs;
  // RxString selectedWidget = '1'.obs;
  RxString selectedWidget = ''.obs;
  RxString selectedWidthWidget = '1'.obs;
  RxString selectedHeightWidget = '1'.obs;
  RxBool isDark = true.obs;
  RxDouble newTop = 0.0.obs;
  RxDouble newLeft = 0.0.obs;
  RxString widgetName = ''.obs;
  RxBool showMenu = false.obs;
  RxBool isDialogOpen = true.obs;
  RxDouble selectedPadding = 0.0.obs;
  RxBool isThemeFABOpen = false.obs;
  RxInt filteredMenuId = 0.obs;
  RxInt filteredMenuSubId = 0.obs;
  RxString newWidgetName = ''.obs;
  RxString newClassName = ''.obs;
  RxInt newMenuId = 0.obs;
  RxInt newSubMenuId = 0.obs;
  RxInt newChildPosId = 0.obs;
  List<Color> colors = [
    // Colors.errorPrimaryColor,
    const Color(0xff4692ce),
    const Color(0xff7a0045),
// Colors.transparent,
    const Color(0xffc0c0da),
    const Color(0xfff1e6e2),
    const Color(0xff6062ad),
    const Color(0xffb6bcd6),
    const Color(0xffc496a3),
    const Color(0xff1f4b8c), const Color(0xff1f4b8c), const Color(0xffe0ab7f),
    const Color(0xffbac2c5),
    const Color(0xff00f6ed)
  ];
  // RxString txtCtrl = (Ctrl.to.gridWidgets
  //             .firstWhereOrNull((p0) => p0.isHide.isFalse)
  //             ?.childPosId
  //             .value ??
  //         0 + 1)
  //     .toString()
  //     .obs;
  RxString modifiedswidgetName = ''.obs;
  RxString modifiedChildPosId = ''.obs;
  RxString modifiedClassName = ''.obs;
  RxString modifiedMenuId = ''.obs;
  RxString modifiedSubMenuId = ''.obs;
  // RxList<UIMakerResizebleWidget> widgets = RxList.filled(
  //     1,
  //     UIMakerResizebleWidget(
  //         idx: 0,
  //         height: 214,
  //         width: 192,
  //         left: 0,
  //         top: 0,
  //         child: Container(
  //             color: Colors.orange, child: Center(child: Text('위젯_1')))));

  RxList<UIControllerDialog> dialogWidget = RxList.empty();
  RxList<String> widgetsForAdd = RxList.empty();
  //  UIMakerResizebleWidget(
  //   child: RowColSelectCard(),
  //   idx: 0,
  //   isShowContext: false,
  // );
  RxList<Offset> offsetList = RxList.filled(1, const Offset(0, 0));

  List<double> handleDrag(
      DragStartDetails details, double initX, double initY) {
    // setState(() {
    initX = details.globalPosition.dx;
    initY = details.globalPosition.dy;
    log('init : $initX / $initY');
    return [initX, initY];
    // });
  }

  List<double> handleUpdate(
      DragUpdateDetails details, double initX, double initY) {
    // double dx = details.globalPosition.dx - initX; //현재위치에서 그 전의 위치 빼는 것.
    // double dy = details.lobalPosition.dy - initY;

    double dx = details.globalPosition.dx - initX; //현재위치에서 그 전의 위치 빼는 것.
    double dy = details.globalPosition.dy - initY;
    initX = details.globalPosition.dx;
    initY = details.globalPosition.dy;
    // if (dy == 2) {
    // if (aaa == 0 && ccc == 0) {

    // if (dx.abs() > 19.2) {

    log('왜 멀리가 : $dx / $dy');
    log('init in up : $initX / $initY');
    return [dx, dy];
    // onDrag(dx, dy);
    // }

    // }
    // widget.onDrag(dx * 19.2, dy * 10.17);
    // }
  }

  init() {
    widgetsForAdd.add('앱바');
    widgetsForAdd.add('사이드바');
    widgetsForAdd.add('커스텀');
    // widgetsForAdd.add('버튼');
  }

  List<double> createRatioSize(double pixelTop, double pixelLeft,
      double pixelWidth, double pixelHeight) {
    final double ratioTop = (pixelTop / 100) * (1080 / 3);
    final double ratioLeft = (pixelLeft / 100) * (1920 / 3);
    final double ratioWidth = (pixelWidth / 100) * (1920 / 3);
    final double ratioHeight = (pixelHeight / 100) * (1080 / 3);
    return [ratioTop, ratioLeft, ratioWidth, ratioHeight];
  }
}
