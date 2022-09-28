import 'package:fluent_ui/fluent_ui.dart';
import 'package:ui_maker/controller/ctrl.dart';

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
            shape: ButtonState.all(const RoundedRectangleBorder()),
            textStyle: ButtonState.all(const TextStyle(
              fontSize: 10,
              color: Colors.black,
            )),
            backgroundColor: ButtonState.all(
              const Color(0xff668FCD),
            ),
          ),
          // ignore: sort_child_properties_last
          child: const Text(
            '해당 위젯만 보기',
            style: TextStyle(color: Colors.black),
          ),
          onPressed: () {
            showWidget(context);
          },
        ),
      ),
    );
  }

  void showWidget(BuildContext context) {
    for (var i = 0; i < Ctrl.to.gridWidgets.length; i++) {
      if (((Ctrl.to.filteredMenuId.value) ==
                  Ctrl.to.gridWidgets[i].menuId.value &&
              (Ctrl.to.filteredMenuSubId.value) ==
                  Ctrl.to.gridWidgets[i].menuSubId.value) ||
          Ctrl.to.gridWidgets[i].menuId.value == 0) {
        Ctrl.to.gridWidgets[i].widgetHide.value = false;
      } else {
        Ctrl.to.gridWidgets[i].widgetHide.value = true;
        const Snackbar snackbar = Snackbar(content: Text('해당 위젯이 없습니다.'));
        showSnackbar(context, snackbar);
        // for (var gridWidget in Ctrl.to.gridWidgets) {
        //   gridWidget.widgetHide.value = false;
        // }
      }
    }
  }
}

class ShowAllWidgetBtn extends StatelessWidget {
  const ShowAllWidgetBtn({Key? key}) : super(key: key);

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
            '위젯 전부 보기',
            style: TextStyle(color: Colors.black),
          ),
          onPressed: () {
            for (var gridWidget in Ctrl.to.gridWidgets) {
              gridWidget.widgetHide.value = false;
            }
          },
        ),
      ),
    );
  }
}
