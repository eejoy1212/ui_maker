import 'package:fluent_ui/fluent_ui.dart';
import 'package:ui_maker/components/wgs_appbar.dart';
import 'package:ui_maker/components/wgs_sider_bar.dart';
import 'package:ui_maker/controller/ctrl.dart';

class WidetDeleteBtn extends StatelessWidget {
  const WidetDeleteBtn({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: SizedBox(
        width: 204,
        child: Button(
          style: ButtonStyle(
            shape: ButtonState.all(const RoundedRectangleBorder()),
            textStyle: ButtonState.all(const TextStyle(
              fontSize: 10,
              color: Colors.black,
            )),
            backgroundColor: ButtonState.all(
              const Color(0xff668FCD),
            ),
          ),
          child: const Text(
            '위젯 모두 삭제하기',
            style: TextStyle(color: Colors.black),
          ),
          onPressed: () {
            if (Ctrl.to.gridWidgets.isNotEmpty) {
              debugPrint('위젯 첫번째 위치정보 ${Ctrl.to.gridWidgets.first.left}');
            }

            Ctrl.to.gridWidgets.clear();

            Ctrl.to.gridWidgetsForFile.clear();
            Ctrl.to.selectedWidget.value = '';
            Ctrl.to.selectedWidthWidget.value = '';
            Ctrl.to.selectedHeightWidget.value = '';
            debugPrint('잘 저장됐나?? : ${Ctrl.to.gridWidgetsForFile}');
            // Ctrl.to.offsetList.add(Offset(0, 0));
          },
        ),
      ),
    );
  }

  Widget addWidget(widgetForAdd) {
    switch (widgetForAdd) {
      case '앱바':
        return const WGSAppBar();
      case '사이드바':
        return const WGSSideBar();
      case '커스텀':
        return Container(
          color: Colors.orange,
          child: const Text('위젯'),
        );
      default:
        return Container();
    }
  }
}
