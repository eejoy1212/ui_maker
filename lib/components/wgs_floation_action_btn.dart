import 'package:fluent_ui/fluent_ui.dart';
import 'package:ui_maker/style/color.dart';

class WGSFAB extends StatelessWidget {
  const WGSFAB({
    super.key,
    required this.fluentIcon,
    required this.onTap,
    this.bgColor = WGSColors.mint,
    this.iconColor = WGSColors.weakGrey,
  });
  final IconData fluentIcon;
  final Function()? onTap;
  final Color bgColor;
  final Color iconColor;
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          width: 56,
          height: 56,
          decoration: BoxDecoration(
            boxShadow: [
              // BoxShadow(
              //   color: Colors.grey.withOpacity(0.5),
              //   spreadRadius: 5,
              //   blurRadius: 7,
              //   offset: Offset(0, 2),
              // ),
            ],
            color: bgColor,
            shape: BoxShape.circle,
          ),
          child: Icon(
            fluentIcon,
            color: iconColor,
            size: 20,
          ),
        ),
      ),
    );
  }
}
