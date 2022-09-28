import 'dart:developer';
import 'package:get/get.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:ui_maker/components/wgs_appbar.dart';
import 'package:ui_maker/components/wgs_sider_bar.dart';
import 'package:ui_maker/controller/ctrl.dart';

class WidgetModifyBtn extends StatelessWidget {
  const WidgetModifyBtn({
    Key? key,
    required this.widgetName,
    required this.className,
    required this.menuId,
    required this.menuSubId,
    required this.childPosId,
    // required this.widgetForAdd,
    // required this.name,
  }) : super(key: key);
  final String widgetName;
  final String className;
  final String menuId;
  final String menuSubId;
  final String childPosId;
  // final String widgetForAdd;
  // final String name;
  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      ignoring: Ctrl.to.gridWidgets.where((p0) => p0.isHide.isFalse).isEmpty,
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: SizedBox(
          width: 204,
          child: Button(
              style: ButtonStyle(
                backgroundColor: ButtonState.all(Ctrl.to.gridWidgets
                        .where((p0) => p0.isHide.isFalse)
                        .isNotEmpty
                    ? const Color(0xff668FCD)
                    : Colors.grey),
                shape: ButtonState.all(const RoundedRectangleBorder()),
                textStyle: ButtonState.all(const TextStyle(
                  fontSize: 10,
                  color: Colors.black,
                )),
                // border: ButtonState.all(const BorderSide(
                //   color: Color(0xff668FCD),
                // )),
              ),
              child: Text(
                '위젯 수정하기',
                style: TextStyle(
                  color: Ctrl.to.gridWidgets
                          .where((p0) => p0.isHide.isFalse)
                          .isNotEmpty
                      ? Colors.black
                      : Colors.white.withOpacity(0.5),
                ),
              ),
              onPressed: () {
                // final int nowIdx = Ctrl.to.gridWidgets
                //     .indexWhere((element) => element.isHide.isFalse);
                // String errComponent = '';

                final int selWidgetIdx =
                    //  Ctrl.to.gridWidgets
                    //             .indexWhere((p0) => p0.isHide.isFalse) ==
                    //         -1
                    //     ? 0
                    // :
                    Ctrl.to.gridWidgets.indexWhere((p0) => p0.isHide.isFalse);
                log('수정 할 위젯 : ${Ctrl.to.gridWidgetsForFile[selWidgetIdx].name}');
                if (widgetName != '') {
                  Ctrl.to.gridWidgets[selWidgetIdx].name.value = widgetName;
                  Ctrl.to.gridWidgetsForFile[selWidgetIdx].name =
                      Ctrl.to.gridWidgets[selWidgetIdx].name.value;
                }
                if (className != '') {
                  Ctrl.to.gridWidgets[selWidgetIdx].className.value = className;
                  Ctrl.to.gridWidgetsForFile[selWidgetIdx].className =
                      Ctrl.to.gridWidgets[selWidgetIdx].className.value;
                }
                if (menuId != '') {
                  Ctrl.to.gridWidgets[selWidgetIdx].menuId.value =
                      int.tryParse(menuId) ?? 0;
                  Ctrl.to.gridWidgetsForFile[selWidgetIdx].menuId =
                      Ctrl.to.gridWidgets[selWidgetIdx].menuId.value;
                }
                if (menuSubId != '') {
                  Ctrl.to.gridWidgets[selWidgetIdx].menuSubId.value =
                      int.tryParse(menuSubId) ?? 0;
                  Ctrl.to.gridWidgetsForFile[selWidgetIdx].menuSubId =
                      Ctrl.to.gridWidgets[selWidgetIdx].menuSubId.value;
                }
                if (childPosId != '') {
                  Ctrl.to.gridWidgets[selWidgetIdx].childPosId.value =
                      (int.tryParse(childPosId) ?? 0);
                  Ctrl.to.gridWidgetsForFile[selWidgetIdx].childPosId =
                      Ctrl.to.gridWidgets[selWidgetIdx].childPosId.value;
                }
              }),
        ),
      ),
    );
  }

  void showModifyError(String errComponent, BuildContext context) {
    final snackbar = Snackbar(content: Text('$errComponent을(를) 수정해 주세요'));
    showSnackbar(context, snackbar);
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
