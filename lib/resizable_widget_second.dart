// ignore_for_file: sort_child_properties_last, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:resizable_widget/resizable_widget.dart';

class ResizableSecond extends StatelessWidget {
  const ResizableSecond({
    Key? key,
    required this.onResized,
    // required this.width,
  }) : super(key: key);
  final void Function(List<WidgetSizeInfo>)? onResized;
  // final double width;
  @override
  Widget build(BuildContext context) {
    return
        //  Obx(() =>

        SizedBox(
      // width: 500,
      // height: 500,
      child: ResizableWidget(children: [
        Container(color: Colors.cyan),
        ResizableWidget(isHorizontalSeparator: true, //
            children: [
              Container(color: Colors.greenAccent),
              ResizableWidget(
                  children: [
                    // required
                    Container(color: Colors.greenAccent),
                    Container(color: Colors.red),
                  ],
                  isHorizontalSeparator: false, // optional
                  isDisabledSmartHide: false, // optional
                  separatorColor: Colors.white12, // optional
                  separatorSize: 4, // optional
                  percentages: [
                    1,
                    0,
                  ], // optional

                  onResized: onResized
                  // (infoList) {
                  //   // infoList[1].percentage = 0;
                  //   width.value = infoList.first.size;
                  //   // return print(infoList
                  //   //     .map((x) => '(${x.size}, ${x.percentage}%)')
                  //   //     .join(", "));
                  // } // optional

                  ),
              Container(color: Colors.redAccent),
            ]),
        Container(color: Colors.redAccent),
      ]),
    )
        // )
        ;
  }
}
