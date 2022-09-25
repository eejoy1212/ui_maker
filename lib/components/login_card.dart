import 'package:fluent_ui/fluent_ui.dart';
import 'package:ui_maker/style/shadow.dart';
import 'package:ui_maker/style/text.dart';

class LoginCard extends StatelessWidget {
  const LoginCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 216,
      decoration:
          BoxDecoration(color: Color(0xff1A1A1A), boxShadow: cardShadow),
      child: Padding(
        padding: const EdgeInsets.all(6),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Login', style: cardTitle),
            const SizedBox(
              height: 4,
            ),
            const Text(
              'User Id : onezzang',
              style: cardContents,
            ),
            const SizedBox(
              height: 4,
            ),
            const Text(
              'User Id : onezzang',
              style: cardContents,
            ),
            const SizedBox(
              height: 4,
            ),
            const Text(
              'User Id : onezzang',
              style: cardContents,
            ),
            const SizedBox(
              height: 4,
            ),
            const Text(
              '09:58',
              style: cardContentsMintHighlight,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 98,
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
                      'Sign Out',
                      style: TextStyle(color: Colors.black),
                    ),
                    onPressed: () {},
                  ),
                ),
                SizedBox(
                  width: 98,
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
                      'Modify',
                      style: TextStyle(color: Colors.black),
                    ),
                    onPressed: () {},
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
