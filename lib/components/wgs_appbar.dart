// ignore_for_file: unnecessary_import, implementation_imports, sized_box_for_whitespace

import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';

class WGSAppBar extends StatelessWidget {
  const WGSAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1920,
      height: 30,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 1920,
            height: 28,
            color: const Color(0xff1a1a1a),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SvgPicture.asset(
                  color: Colors.white,
                  // 'assets/origin logo.svg',
                  'assets/WGS_logo_visible_1.svg',
                  width: 45.67,
                  height: 20,
                ),
                const SizedBox(
                  width: 105,
                ),
                Row(
                  children: const [Icon(FluentIcons.t_v_monitor), Text('Main')],
                ),
                const SizedBox(
                  width: 13,
                ),
                Row(
                  children: const [Icon(FluentIcons.t_v_monitor), Text('Main')],
                ),
                const SizedBox(
                  width: 13,
                ),
                Row(
                  children: const [Icon(FluentIcons.t_v_monitor), Text('Main')],
                ),
                const SizedBox(
                  width: 13,
                ),
                Row(
                  children: const [Icon(FluentIcons.t_v_monitor), Text('Main')],
                ),
                const SizedBox(
                  width: 13,
                ),
                Row(
                  children: const [Icon(FluentIcons.t_v_monitor), Text('Main')],
                ),
                const SizedBox(
                  width: 13,
                ),
                Row(
                  children: const [Icon(FluentIcons.t_v_monitor), Text('Main')],
                ),
                const SizedBox(
                  width: 13,
                ),
                const Spacer()
              ],
            ),
          ),
          Container(
            width: 1920,
            height: 2,
            color: Colors.white,
          )
        ],
      ),
    );
  }
}
