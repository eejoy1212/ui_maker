import 'package:fluent_ui/fluent_ui.dart';

class WidgetSelectorBtn extends StatelessWidget {
  const WidgetSelectorBtn({
    super.key,
    this.borderColor = Colors.white,
    this.bgColor = Colors.transparent,
    required this.onSelected,
    this.isWidget = false,
  });
  final Color borderColor;
  final Color bgColor;
  final bool isWidget;
  final void Function()? onSelected;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onSelected,
      child: Container(
        width: 14,
        height: 14,
        decoration: BoxDecoration(
            color: bgColor,
            border: Border.all(
              color: borderColor,
            )),
      ),
    );
  }
}
