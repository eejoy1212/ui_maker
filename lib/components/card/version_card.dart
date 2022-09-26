// ignore_for_file: prefer_const_constructors

import 'package:fluent_ui/fluent_ui.dart';
import 'package:ui_maker/style/text.dart';

class VersionCard extends StatelessWidget {
  const VersionCard({Key? key}) : super(key: key);

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
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                SizedBox(
                    width: 93, child: Text('Vision Model', style: cardTitle)),
                Text(
                  '1.0.1.77',
                  style: cardContentsGreenHighlight,
                )
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                SizedBox(
                    width: 93, child: Text('Launching Time', style: cardTitle)),
                Text(
                  '9/2/2022    1:42:35 PM',
                  style: cardContentsGreenHighlight,
                )
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                SizedBox(width: 93, child: Text('Life Time', style: cardTitle)),
                Text(
                  '00.00:02:34',
                  style: cardContentsGreenHighlight,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
