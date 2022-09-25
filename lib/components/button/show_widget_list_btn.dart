import 'package:fluent_ui/fluent_ui.dart';
import 'package:ui_maker/ctrl.dart';

class ShowWidgetListBtn extends StatelessWidget {
  const ShowWidgetListBtn({Key? key}) : super(key: key);

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
            '위젯 리스트 보기',
            style: TextStyle(color: Colors.black),
          ),
          onPressed: () {
            Ctrl.to.showMenu.value = !Ctrl.to.showMenu.value;
          },
        ),
      ),
    );
  }
}
