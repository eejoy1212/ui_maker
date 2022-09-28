import 'dart:developer';
import 'package:get/get.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:ui_maker/components/wgs_appbar.dart';
import 'package:ui_maker/components/wgs_sider_bar.dart';
import 'package:ui_maker/controller/ctrl.dart';
import 'package:ui_maker/main.dart';
import 'package:ui_maker/model/grid_widget.dart';
import 'package:ui_maker/resizable_widget.dart';

class WidgetAddBtn extends StatelessWidget {
  const WidgetAddBtn({
    Key? key,
    required this.widgetForAdd,
    required this.widgetName,
    required this.className,
    required this.menuId,
    required this.menuSubId,
    required this.childPosId,
    required this.name,
  }) : super(key: key);
  final String widgetForAdd;
  final String name;
  final String widgetName;
  final String className;
  final String menuId;
  final String menuSubId;
  final String childPosId;
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: Ctrl.to.gridWidgets.where((p0) => p0.isHide.isFalse).isNotEmpty
          ? SystemMouseCursors.basic
          : SystemMouseCursors.click,
      child: SizedBox(
        width: 204,
        child: IgnorePointer(
          ignoring:
              Ctrl.to.gridWidgets.where((p0) => p0.isHide.isFalse).isNotEmpty,
          child: Button(
            style: ButtonStyle(
              shape: ButtonState.all(const RoundedRectangleBorder()),
              textStyle: ButtonState.all(const TextStyle(
                fontSize: 10,
                color: Colors.black,
              )),
              backgroundColor: ButtonState.all(
                Ctrl.to.gridWidgets.where((p0) => p0.isHide.isFalse).isNotEmpty
                    ? Colors.grey
                    : const Color(0xff668FCD),
              ),
            ),
            child: Text(
              '위젯 추가하기',
              style: TextStyle(
                  color: Ctrl.to.gridWidgets
                          .where((p0) => p0.isHide.isFalse)
                          .isNotEmpty
                      ? Colors.white.withOpacity(0.5)
                      : Colors.black),
            ),
            onPressed: () {
              //에러, 1.입력 안했을때 2. 이름 이미 있는 것일때
              Ctrl.to.isLoading.value = true;
              String errorMsg = '';
              if (Ctrl.to.gridWidgets
                  .where((p0) => p0.isHide.isFalse)
                  .isNotEmpty) {
                errorMsg = '선택한 위젯을 해제해주세요.';
                showError(context, errorMsg);
              } else {
                final checkList = Ctrl.to.gridWidgets
                    .where((p0) => p0.name.value == Ctrl.to.widgetName.value);
                if (checkList.isNotEmpty) {
                  errorMsg = '이미 있는 위젯입니다.';
                  showError(context, errorMsg);
                }
                if (Ctrl.to.widgetName.value == '' &&
                    Ctrl.to.widgetName.value ==
                        Ctrl.to.gridWidgets.last.name.value) {
                  log('이름같음 ${Ctrl.to.gridWidgets.last.name.value}');
                  errorMsg = '이름을 입력해 주세요.';
                  showError(context, errorMsg);
                }
                if (Ctrl.to.selectedClassName.value == '') {
                  errorMsg = 'className을 입력해 주세요.';
                  showError(context, errorMsg);
                }
                if (Ctrl.to.selectedChildPosId.value == 0) {
                  errorMsg = 'childPosId를 입력해 주세요.';
                  showError(context, errorMsg);
                }
                if (checkList.isEmpty &&
                    Ctrl.to.widgetName.value != '' &&
                    Ctrl.to.selectedClassName.value != '') {
                  if (Ctrl.to.gridWidgets.isNotEmpty) {
                    debugPrint('위젯 첫번째 위치정보 ${Ctrl.to.gridWidgets.first.left}');
                  }

                  final int idx = Ctrl.to.gridWidgets.length;
                  log('분할 해상도 ${MediaQuery.of(context).size.width / 3}');
                  Ctrl.to.gridWidgets.add(UIMakerResizebleWidget(
                    idx: idx,
                    widgetColor: const Color(0xff4692ce).obs,
                    childPosId: int.parse(childPosId).obs,
                    name: widgetName.obs,
                    className: className.obs,
                    menuId: int.parse(menuId).obs,
                    menuSubId: int.parse(menuSubId).obs,
                    // child: newWidget,
                  ));
                  final double newWidth =
                      Ctrl.to.gridWidgets.last.width.value / 6.4;
                  final double newHeight =
                      Ctrl.to.gridWidgets.last.height.value / 3.6;
                  Ctrl.to.gridWidgetsForFile.add(GridWidget(
                      top: 0.0,
                      left: 0.0,
                      width: newWidth,
                      height: newHeight,
                      name: widgetName,
                      className: className,
                      menuId: int.parse(menuId),
                      menuSubId: int.parse(menuSubId),
                      childPosId: int.parse(childPosId),
                      color: const Color(0xff4692ce)));
                  Ctrl.to.selectedWidget.value = '';
                  Ctrl.to.selectedWidthWidget.value = '';
                  Ctrl.to.selectedHeightWidget.value = '';
                  debugPrint('잘 저장됐나?? : ${Ctrl.to.gridWidgetsForFile}');
                  // Ctrl.to.offsetList.add(Offset(0, 0));

                }
                Ctrl.to.isLoading.value = false;
              }
            },
          ),
        ),
      ),
    );
  }

  Widget addWidget(widgetForAdd, String name, String className) {
    switch (widgetForAdd) {
      case '앱바':
        return const WGSAppBar();
      case '사이드바':
        return const WGSSideBar();
      case '커스텀':
        return Center(child: Text('$name\nclassName:$className'));
      default:
        return Container();
    }
  }
}
