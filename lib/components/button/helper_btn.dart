import 'package:fluent_ui/fluent_ui.dart';
import 'package:get/get.dart';
import 'package:showcaseview/showcaseview.dart';
import 'package:ui_maker/main.dart';

class HelperBtn extends StatelessWidget {
  const HelperBtn({Key? key}) : super(key: key);

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
            '도움말',
            style: TextStyle(color: Colors.black),
          ),
          onPressed: () {
            ambiguate(WidgetsBinding.instance)?.addPostFrameCallback(
              (_) => ShowCaseWidget.of(context).startShowCase([one, two]),
            );
          },
        ),
      ),
    );
  }
}
