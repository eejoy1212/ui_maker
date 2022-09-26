import 'package:fluent_ui/fluent_ui.dart';
import 'package:ui_maker/components/card/login_card.dart';
import 'package:ui_maker/components/card/version_card.dart';
import 'package:ui_maker/components/card/vision_card.dart';
import 'package:ui_maker/main.dart';
import 'package:ui_maker/style/color.dart';

class WGSSideBar extends StatelessWidget {
  const WGSSideBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 236,
      height: 1050,
      color: WGSColors.weakGrey,
      child: Column(
        children: const [
          LoginCard(),
          VisionCard(),
          ModelCard(),
          VersionCard(),
        ],
      ),
    );
  }
}
