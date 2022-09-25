import 'package:fluent_ui/fluent_ui.dart';
import 'package:get/get.dart';
import 'package:ui_maker/ctrl.dart';
import 'package:ui_maker/resizable_widget.dart';
import 'package:ui_maker/style/color.dart';

class ChildPosArea extends StatelessWidget {
  const ChildPosArea({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ///row_1
        Obx(
          () => Positioned(
              top: 0,
              left: 0,
              child: Container(
                width: MediaQuery.of(context).size.width / 3,
                height: MediaQuery.of(context).size.height / 3,
                decoration: BoxDecoration(
                    border: Border.all(
                  color: Ctrl.to.isDark.isTrue
                      ? WGSColors.weakGrey
                      : WGSColors.lightGrey,
                )),
                child: Stack(
                  children: Ctrl.to.gridWidgets
                      .where((p0) => p0.childPosId.value == 1)
                      .toList(),
                ),
              )),
        ),
        Obx(
          () => Positioned(
              top: 0,
              left: MediaQuery.of(context).size.width / 3,
              child: Container(
                width: MediaQuery.of(context).size.width / 3,
                height: MediaQuery.of(context).size.height / 3,
                decoration: BoxDecoration(
                    border: Border.all(
                  color: Ctrl.to.isDark.isTrue
                      ? WGSColors.weakGrey
                      : WGSColors.lightGrey,
                )),
                child: Stack(
                  children: Ctrl.to.gridWidgets
                      .where((p0) => p0.childPosId.value == 2)
                      .toList(),
                ),
              )),
        ),
        Obx(
          () => Positioned(
              top: 0,
              left: MediaQuery.of(context).size.width / 3 * 2,
              child: Container(
                width: MediaQuery.of(context).size.width / 3,
                height: MediaQuery.of(context).size.height / 3,
                decoration: BoxDecoration(
                    border: Border.all(
                  color: Ctrl.to.isDark.isTrue
                      ? WGSColors.weakGrey
                      : WGSColors.lightGrey,
                )),
                child: Stack(
                  children: Ctrl.to.gridWidgets
                      .where((p0) => p0.childPosId.value == 3)
                      .toList(),
                ),
              )),
        ),
        //row_2
        Obx(
          () => Positioned(
              top: MediaQuery.of(context).size.height / 3,
              left: 0,
              child: Container(
                width: MediaQuery.of(context).size.width / 3,
                height: MediaQuery.of(context).size.height / 3,
                decoration: BoxDecoration(
                    border: Border.all(
                  color: Ctrl.to.isDark.isTrue
                      ? WGSColors.weakGrey
                      : WGSColors.lightGrey,
                )),
                child: Stack(
                  children: Ctrl.to.gridWidgets
                      .where((p0) => p0.childPosId.value == 4)
                      .toList(),
                ),
              )),
        ),
        Obx(
          () => Positioned(
              top: MediaQuery.of(context).size.height / 3,
              left: MediaQuery.of(context).size.width / 3,
              child: Container(
                width: MediaQuery.of(context).size.width / 3,
                height: MediaQuery.of(context).size.height / 3,
                decoration: BoxDecoration(
                    border: Border.all(
                  color: Ctrl.to.isDark.isTrue
                      ? WGSColors.weakGrey
                      : WGSColors.lightGrey,
                )),
                child: Stack(
                  children: Ctrl.to.gridWidgets
                      .where((p0) => p0.childPosId.value == 5)
                      .toList(),
                ),
              )),
        ),
        Obx(
          () => Positioned(
              top: MediaQuery.of(context).size.height / 3,
              left: MediaQuery.of(context).size.width / 3 * 2,
              child: Container(
                width: MediaQuery.of(context).size.width / 3,
                height: MediaQuery.of(context).size.height / 3,
                decoration: BoxDecoration(
                    border: Border.all(
                  color: Ctrl.to.isDark.isTrue
                      ? WGSColors.weakGrey
                      : WGSColors.lightGrey,
                )),
                child: Stack(
                  children: Ctrl.to.gridWidgets
                      .where((p0) => p0.childPosId.value == 6)
                      .toList(),
                ),
              )),
        ),
        Obx(
          () => Positioned(
              top: MediaQuery.of(context).size.height / 3 * 2,
              left: 0,
              child: Container(
                width: MediaQuery.of(context).size.width / 3,
                height: MediaQuery.of(context).size.height / 3,
                decoration: BoxDecoration(
                    border: Border.all(
                  color: Ctrl.to.isDark.isTrue
                      ? WGSColors.weakGrey
                      : WGSColors.lightGrey,
                )),
                child: Stack(
                  children: Ctrl.to.gridWidgets
                      .where((p0) => p0.childPosId.value == 7)
                      .toList(),
                ),
              )),
        ),
        Obx(
          () => Positioned(
              top: MediaQuery.of(context).size.height / 3 * 2,
              left: MediaQuery.of(context).size.width / 3,
              child: Container(
                width: MediaQuery.of(context).size.width / 3,
                height: MediaQuery.of(context).size.height / 3,
                decoration: BoxDecoration(
                    border: Border.all(
                  color: Ctrl.to.isDark.isTrue
                      ? WGSColors.weakGrey
                      : WGSColors.lightGrey,
                )),
                child: Stack(
                  children: Ctrl.to.gridWidgets
                      .where((p0) => p0.childPosId.value == 8)
                      .toList(),
                ),
              )),
        ),
        //row3
        Obx(
          () => Positioned(
              top: MediaQuery.of(context).size.height / 3 * 2,
              left: MediaQuery.of(context).size.width / 3 * 2,
              child: Container(
                width: MediaQuery.of(context).size.width / 3,
                height: MediaQuery.of(context).size.height / 3,
                decoration: BoxDecoration(
                    border: Border.all(
                  color: Ctrl.to.isDark.isTrue
                      ? WGSColors.weakGrey
                      : WGSColors.lightGrey,
                )),
                child: Stack(
                  children: Ctrl.to.gridWidgets
                      .where((p0) => p0.childPosId.value == 9)
                      .toList(),
                ),
              )),
        )
      ],
    );
  }
}
