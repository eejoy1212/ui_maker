// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors_in_immutables, prefer_const_constructors, sort_child_properties_last

import 'package:fluent_ui/fluent_ui.dart';
import 'package:get/get.dart';
import 'package:ui_maker/controller/ctrl.dart';

class CustomResizableWidget extends StatefulWidget {
  @override
  State<CustomResizableWidget> createState() => _CustomResizableWidgetState();
}

class _CustomResizableWidgetState extends State<CustomResizableWidget> {
  double movingdy = 0;

  @override
  Widget build(BuildContext context) {
    return Obx(() => SizedBox(
            // width: 500,
            // height: 500,
            child: Row(
                children: List.generate(Ctrl.to.widgetList.length + 1, (idx) {
          // if (idx == 0) {
          return WidgetSet(
            distance: Ctrl.to.dividerDistance.value,
          );
          // } else {
          //   return WidgetSet(
          //     distance: Ctrl.to.dividerDistance.value * idx,
          //   );

          //   Ctrl.to.widgetList[idx - 1];
          // }
        }))

            //      List.generate(Ctrl.to.widgetList.length + 4, (idx) {
            //   if (idx == 0) {
            //   return Container(
            //     width: Ctrl.to.dividerDistance.value,
            //     height: 1890,
            //     color: Colors.teal,
            //     child: Column(
            //       children: [
            //         Text('1'),
            //       ],
            //     ),
            //   );
            // }
            // if (idx == 1) {
            //   return Positioned(
            //     left: Ctrl.to.dividerDistance.value,
            //     child: DragDivider(onDrag: (dx, dy) {
            //       debugPrint('되나?? : $dx / $dy');
            //       // setState(() {
            //       var newWidth = Ctrl.to.dividerDistance.value + dx;
            //       Ctrl.to.dividerDistance.value = newWidth;
            //       debugPrint(
            //           'dividerDistance : ${Ctrl.to.dividerDistance.value}');
            //       // });
            //     }),
            //   );
            // }
            //   if (idx == 2) {
            //     return Positioned(
            //       left: 10 + Ctrl.to.dividerDistance.value,
            //       child: Container(
            //         width: 800,
            //         height: 1890,
            //         color: Colors.black,
            //         child: Column(
            //           children: [
            //             Text('2'),
            //           ],
            //         ),
            //       ),
            //     );
            //   }

            //   if (idx == 3) {
            //     return Positioned(
            //         // top: 600,
            //         left: 5 + Ctrl.to.dividerDistance.value - 20,
            //         child: AddBtn());
            //   } else {
            //     return Obx(() => Ctrl.to.widgetList[idx - 4]);
            //   }
            // })

            // [
            // Container(
            //   width: dividerDistance,
            //   height: 1890,
            //   color: Colors.teal,
            //   child: Column(
            //     children: [
            //       Text('1'),
            //     ],
            //   ),
            // ),
            // Positioned(
            //   left: dividerDistance,
            //   child: DragDivider(onDrag: (dx, dy) {
            //     debugPrint('되나?? : $dx / $dy');
            //     setState(() {
            //       var newWidth = dividerDistance + dx;
            //       dividerDistance = newWidth;
            //       debugPrint('dividerDistance : $dividerDistance');
            //     });
            //   }),
            // ),
            // Positioned(
            //   left: 10 + dividerDistance,
            //   child: Container(
            //     width: 800,
            //     height: 1890,
            //     color: Colors.black,
            //     child: Column(
            //       children: [
            //         Text('2'),
            //       ],
            //     ),
            //   ),
            // ),
            //   Positioned(
            //     left: dividerDistance * 2,
            //     child: DragDivider(onDrag: (dx, dy) {
            //       debugPrint('되나?? : $dx / $dy');
            //       setState(() {
            //         var newWidth = dividerDistance + dx;
            //         dividerDistance = newWidth;
            //         debugPrint('dividerDistance : $dividerDistance');
            //       });
            //     }),
            //   ),
            //   Positioned(
            //     left: 10 + dividerDistance * 2,
            //     child: Container(
            //       width: 800,
            //       height: 1890,
            //       color: Colors.black,
            //       child: Column(
            //         children: [
            //           Text('3'),
            //         ],
            //       ),
            //     ),
            //   ),
            // Positioned(
            //     // top: 600,
            //     left: 5 + dividerDistance - 20,
            //     child: AddBtn()),
            // ],
            ));
  }
}

class WidgetSet extends StatelessWidget {
  WidgetSet({
    Key? key,
    required this.distance,
  }) : super(key: key);
  final double distance;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: distance,
          height: 1890,
          color: Colors.teal,
          child: Column(
            children: const [
              Text('1'),
            ],
          ),
        ),
        DragDivider(onDrag: (dx, dy) {
          debugPrint('되나?? : $dx / $dy');
          // setState(() {
          var newWidth = Ctrl.to.dividerDistance.value + dx;
          Ctrl.to.dividerDistance.value = newWidth;
          debugPrint('dividerDistance : ${Ctrl.to.dividerDistance.value}');
          // });
        }),
        Container(
          width: distance,
          height: 1890,
          color: Colors.teal,
          child: Column(
            children: const [
              Text('1'),
            ],
          ),
        ),
      ],
    );
  }
}

class AddBtn extends StatefulWidget {
  const AddBtn({Key? key}) : super(key: key);

  @override
  State<AddBtn> createState() => _AddBtnState();
}

class _AddBtnState extends State<AddBtn> {
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () {
          Ctrl.to.widgetList
              .add(WidgetSet(distance: Ctrl.to.dividerDistance.value));
        },
        child: Container(
          width: 40,
          height: 40,
          child: Icon(FluentIcons.add),
          decoration: BoxDecoration(
            color: Colors.blue,
            shape: BoxShape.circle,
          ),
        ),
      ),
    );
  }
}

class DragDivider extends StatefulWidget {
  const DragDivider({
    Key? key,
    required this.onDrag,
  }) : super(key: key);
  final Function onDrag;
  @override
  State<DragDivider> createState() => _DragDividerState();
}

class _DragDividerState extends State<DragDivider> {
  double initX = 0;
  double initY = 0;

  _handleDrag(details) {
    setState(() {
      initX = details.globalPosition.dx;
      initY = details.globalPosition.dy;
    });
  }

  _handleUpdate(details) {
    var dx = details.globalPosition.dx - initX;
    var dy = details.globalPosition.dy - initY;
    initX = details.globalPosition.dx;
    initY = details.globalPosition.dy;
    widget.onDrag(dx, dy);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        MouseRegion(
          cursor: SystemMouseCursors.resizeColumn,
          child: GestureDetector(
            onPanStart: _handleDrag,
            onPanUpdate: _handleUpdate,
            child: Container(
              width: 10,
              height: 1890,
              color: Colors.red,
              child: Column(
                children: const [
                  Text(
                    '1',
                    style: TextStyle(color: Colors.transparent),
                  ),
                ],
              ),
            ),
          ),
        ),
        // AddBtn()
      ],
    );
  }
}
