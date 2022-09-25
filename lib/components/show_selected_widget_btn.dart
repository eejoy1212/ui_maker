import 'package:fluent_ui/fluent_ui.dart';
import 'package:ui_maker/ctrl.dart';

class ShowSelectedWidgetBtn extends StatelessWidget {
  const ShowSelectedWidgetBtn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: SizedBox(
        width: 204,
        child: Button(
          style: ButtonStyle(
            shape: ButtonState.all(RoundedRectangleBorder()),
            textStyle: ButtonState.all(TextStyle(
              fontSize: 10,
              color: Colors.black,
            )),
            backgroundColor: ButtonState.all(
              Color(0xff668FCD),
            ),
          ),
          child: Text(
            '해당 위젯만 보기',
            style: TextStyle(color: Colors.black),
          ),
          onPressed: () {
            for (var i = 0; i < Ctrl.to.gridWidgets.length; i++) {
              if ((Ctrl.to.filteredMenuId.value + 1) !=
                      Ctrl.to.gridWidgets[i].menuId.value ||
                  (Ctrl.to.filteredMenuSubId.value + 1) !=
                      Ctrl.to.gridWidgets[i].menuSubId.value) {
                Ctrl.to.gridWidgets[i].widgetHide.value =
                    !Ctrl.to.gridWidgets[i].widgetHide.value;
              }
            }
          },
        ),
      ),
    );
  }
}
