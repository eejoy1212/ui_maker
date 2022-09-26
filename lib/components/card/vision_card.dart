import 'package:fluent_ui/fluent_ui.dart';
import 'package:ui_maker/style/text.dart';

class VisionCard extends StatelessWidget {
  const VisionCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 216,
      decoration: BoxDecoration(color: const Color(0xff1A1A1A), boxShadow: [
        BoxShadow(
          color: const Color(0xff0C0A0B).withOpacity(0.8),
          spreadRadius: 5,
          blurRadius: 10,
          offset: const Offset(2, 6), // changes position of shadow
        ),
      ]),
      child: Padding(
        padding: const EdgeInsets.all(6),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text('Vision Model', style: cardTitle),
            Text(
              'Test',
              style: cardContentsMintHighlight,
            )
          ],
        ),
      ),
    );
  }
}
