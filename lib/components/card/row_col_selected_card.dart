// ignore_for_file: unused_local_variable

import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:showcaseview/showcaseview.dart';
import 'package:ui_maker/components/button/helper_btn.dart';
import 'package:ui_maker/components/button/widget_add_btn.dart';
import 'package:ui_maker/components/button/widget_delete_btn.dart';
import 'package:ui_maker/components/button/widget_modify_btn.dart';
import 'package:ui_maker/components/button/show_selected_widget_btn.dart';
import 'package:ui_maker/controller/ctrl.dart';
import 'package:ui_maker/main.dart';
import 'package:ui_maker/style/color.dart';
import 'package:ui_maker/style/text.dart';

class RowColSelectCard extends StatelessWidget {
  const RowColSelectCard({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    int modifiedmenuId = 0;
    int modifiedmenuSubId = 0;
    int modifiedchildPosId = 0;
    return Obx(() => Container(
          width: 216,
          decoration: BoxDecoration(
              color: Ctrl.to.isDark.isTrue
                  ? const Color(0xff1A1A1A)
                  : WGSColors.lightGrey,
              boxShadow: [
                BoxShadow(
                  color: Ctrl.to.isDark.isTrue
                      ? const Color(0xff0C0A0B).withOpacity(0)
                      : Colors.grey.withOpacity(0),
                  spreadRadius: 5,
                  blurRadius: 10,
                  offset: const Offset(2, 6), // changes position of shadow
                ),
              ]),
          child: Padding(
            padding: const EdgeInsets.all(6),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: SvgPicture.asset(
                        color: Ctrl.to.isDark.isTrue
                            ? Colors.white
                            : WGSColors.logo,
                        // 'assets/origin logo.svg',
                        'assets/WGS_logo_visible_1.svg',
                        // fit: BoxFit.fitWidth,
                        // width: 42, //* ui.window.devicePixelRatio,
                        height: 20,
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 10.0),
                      child: Text(
                        'Widget Control Dialog',
                        style: cardTitle,
                      ),
                    )
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 6.0),
                  child: Divider(),
                ),
                SizedBox(
                    width: 204,
                    height: 30,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Obx(
                            () => Text(
                              'menuId',
                              style: TextStyle(
                                color:
                                    Ctrl.to.selectedWidgetForAdd.value != '커스텀'
                                        ? Colors.grey
                                        : Colors.white,
                              ),
                            ),
                          ),
                          SizedBox(
                              width: 160 - 22 - 6 - 6 - 6,
                              child: AutoSuggestBox(
                                  clearButtonEnabled: false,
                                  // trailingIcon: GestureDetector(
                                  //     onTap: () {
                                  //       Ctrl.to.filteredMenuId.value = 0;
                                  //     },
                                  //     child: Icon(FluentIcons.clear)),
                                  placeholder: 'select menu id',
                                  // controller: TextEditingController(
                                  //     text: Ctrl.to.filteredMenuId.value
                                  //         .toString()),
                                  onChanged: (v, _) {
                                    if (v != '') {
                                      final int id = int.tryParse(v) ?? 0;
                                      Ctrl.to.filteredMenuId.value = id;
                                    }
                                    if (v == '') {
                                      Ctrl.to.filteredMenuId.value = 0;
                                    }
                                  },
                                  onSelected: (v) {
                                    if (v != '') {
                                      final int id = int.tryParse(v) ?? 0;
                                      Ctrl.to.filteredMenuId.value = id;
                                    }
                                    if (v == '') {
                                      Ctrl.to.filteredMenuId.value = 0;
                                    }
                                  },
                                  items: List.generate(
                                      100, (index) => (index + 1).toString()))),
                        ])),
                SizedBox(
                    width: 204,
                    height: 30,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Obx(
                            () => Text(
                              'menuSubId',
                              style: TextStyle(
                                color:
                                    Ctrl.to.selectedWidgetForAdd.value != '커스텀'
                                        ? Colors.grey
                                        : Colors.white,
                              ),
                            ),
                          ),
                          SizedBox(
                              width: 160 - 22 - 6 - 6 - 6,
                              child: AutoSuggestBox(
                                clearButtonEnabled: false,
                                // trailingIcon: GestureDetector(
                                //     onTap: () {
                                //       Ctrl.to.filteredMenuSubId.value = 0;
                                //     },
                                //     child: Icon(FluentIcons.clear)),
                                placeholder: 'select sub id',
                                // controller: TextEditingController(
                                //     text: Ctrl.to.filteredMenuSubId.value
                                //         .toString()),
                                items: List.generate(
                                    100, (index) => (index + 1).toString()),
                                onChanged: (v, _) {
                                  if (v != '') {
                                    final int id = int.tryParse(v) ?? 0;
                                    Ctrl.to.filteredMenuSubId.value = id;
                                  }
                                  if (v == '') {
                                    Ctrl.to.filteredMenuSubId.value = 0;
                                  }
                                },
                                onSelected: (v) {
                                  if (v != '') {
                                    final int id = int.tryParse(v) ?? 0;
                                    Ctrl.to.filteredMenuSubId.value = id;
                                  }
                                  if (v == '') {
                                    Ctrl.to.filteredMenuSubId.value = 0;
                                  }
                                },
                              )),
                        ])),
                Ctrl.to.filteredMenuId.value == 0 &&
                        Ctrl.to.filteredMenuSubId.value == 0
                    ? const ShowAllWidgetBtn()
                    : const ShowSelectedWidgetBtn(),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 6.0),
                  child: Divider(),
                ),
                // Obx(() =>

                Ctrl.to.gridWidgets.where((p0) => p0.isHide.isFalse).isNotEmpty
                    ? const ModifiedContents(
                        // modifiedWidgetName: modifiedwidgetName,
                        )
                    : const NewContents(), // ),
                WidgetModifyBtn(
                  widgetName: Ctrl.to.modifiedswidgetName.value,
                  className: Ctrl.to.modifiedClassName.value,
                  menuId: Ctrl.to.modifiedMenuId.value,
                  menuSubId: Ctrl.to.modifiedSubMenuId.value,
                  childPosId: Ctrl.to.modifiedChildPosId.value,
                ),
                Showcase(
                    key: one,
                    description: '이 버튼을 누르면 위젯이 추가됩니다.',
                    child: WidgetAddBtn(
                      widgetForAdd: Ctrl.to.selectedWidgetForAdd.value,
                      name: Ctrl.to.widgetName.value,
                    )),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 6.0),
                  child: Divider(),
                ),
                const WidetDeleteBtn(),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 6.0),
                  child: Divider(),
                ),
                const HelperBtn(),
                Showcase(
                  key: two,
                  description: '프로그램이 완전히 종료됩니다.',
                  child: const ExitBtn(),
                ),
              ],
            ),
          ),
        ));
  }
}

class NewContents extends StatelessWidget {
  const NewContents({
    super.key,
    // required this.modifiedWidgetName,
  });
  // final RxString modifiedWidgetName;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
            width: 204,
            height: 30,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'widgetName',
                    style: TextStyle(
                      color: Ctrl.to.selectedWidgetForAdd.value != '커스텀'
                          ? Colors.grey
                          : Colors.white,
                    ),
                  ),
                  SizedBox(
                    width: 160 - 22 - 6 - 6 - 6,
                    child: TextBox(
                      placeholder: 'widget name',
                      onChanged: (v) {
                        if (v != '') {
                          Ctrl.to.widgetName.value = v;
                        }
                      },
                    ),
                  ),
                ])),
        const SizedBox(
          height: 8,
        ),
        SizedBox(
            width: 204,
            height: 30,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'className',
                  ),
                  SizedBox(
                      width: 160 - 22 - 6 - 6 - 6,
                      child: TextBox(
                        placeholder: 'class name',
                        onChanged: (v) {
                          if (v != '') {
                            Ctrl.to.selectedClassName.value = v;
                          }
                        },
                      )),
                ])),
        const SizedBox(
          height: 8,
        ),
        SizedBox(
            width: 204,
            height: 30,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'menuId',
                  ),
                  SizedBox(
                      width: 160 - 22 - 6 - 6 - 6,
                      child: TextBox(
                        placeholder: 'menu id',
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        onChanged: (v) {
                          if (v != '') {
                            Ctrl.to.selectedMenuId.value = int.parse(v);
                          }
                        },
                      )),
                ])),
        const SizedBox(
          height: 8,
        ),
        SizedBox(
            width: 204,
            height: 30,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'menuSubId',
                  ),
                  SizedBox(
                      width: 160 - 22 - 6 - 6 - 6,
                      child: TextBox(
                        placeholder: 'sub menu id',
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        onChanged: (v) {
                          if (v != '') {
                            Ctrl.to.selectedSubMenuId.value = int.parse(v);
                          }
                        },
                      ))
                ])),
        const SizedBox(
          height: 8,
        ),
        SizedBox(
            width: 204,
            height: 30,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'childPosId',
                  ),
                  SizedBox(
                      width: 160 - 22 - 6 - 6 - 6,
                      child: TextBox(
                        placeholder: 'child pos id',
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        onChanged: (v) {
                          if (v != '') {
                            Ctrl.to.selectedChildPosId.value = int.parse(v);
                          }
                        },
                      )),
                ])),
      ],
    );
  }
}

class ModifiedContents extends StatelessWidget {
  const ModifiedContents({
    super.key,
    // required this.modifiedWidgetName,
  });
  // final RxString modifiedWidgetName;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
            width: 204,
            height: 30,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Obx(
                    () => Text(
                      'widgetName',
                      style: TextStyle(
                        color: Ctrl.to.selectedWidgetForAdd.value != '커스텀'
                            ? Colors.grey
                            : Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(
                      width: 160 - 22 - 6 - 6 - 6,
                      child: Obx(
                        () => IgnorePointer(
                          ignoring: Ctrl.to.selectedWidgetForAdd.value != '커스텀',
                          child: TextBox(
                            placeholder: Ctrl.to.modifiedswidgetName.value,
                            onChanged: (v) {
                              if (v != '') {
                                Ctrl.to.modifiedswidgetName.value = v;
                              }
                            },
                          ),
                        ),
                      )),
                ])),
        const SizedBox(
          height: 8,
        ),
        SizedBox(
            width: 204,
            height: 30,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'className',
                  ),
                  SizedBox(
                      width: 160 - 22 - 6 - 6 - 6,
                      child: Obx(
                        (() => TextBox(
                              placeholder: Ctrl.to.modifiedClassName.value,
                              // controller: TextEditingController(
                              //     text: Ctrl.to.modifiedClassName.value),
                              onChanged: (v) {
                                if (v != '') {
                                  Ctrl.to.modifiedClassName.value = v;
                                }
                              },
                            )),
                      ))
                ])),
        const SizedBox(
          height: 8,
        ),
        SizedBox(
            width: 204,
            height: 30,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'menuId',
                  ),
                  SizedBox(
                      width: 160 - 22 - 6 - 6 - 6,
                      child: Obx(
                        (() => TextBox(
                              placeholder: Ctrl.to.modifiedMenuId.value,
                              // controller: TextEditingController(
                              //     text: Ctrl.to.modifiedMenuId.value),
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly
                              ],
                              onChanged: (v) {
                                if (v != '') {
                                  Ctrl.to.modifiedMenuId.value = v;
                                }
                              },
                            )),
                      ))
                ])),
        const SizedBox(
          height: 8,
        ),
        SizedBox(
            width: 204,
            height: 30,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'menuSubId',
                  ),
                  SizedBox(
                    width: 160 - 22 - 6 - 6 - 6,
                    child: Obx(() => TextBox(
                          placeholder: Ctrl.to.modifiedSubMenuId.value,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          onChanged: (v) {
                            if (v != '') {
                              Ctrl.to.modifiedSubMenuId.value = v;
                            }
                          },
                        )),
                  )
                ])),
        const SizedBox(
          height: 8,
        ),
        SizedBox(
            width: 204,
            height: 30,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'childPosId',
                  ),
                  SizedBox(
                    width: 160 - 22 - 6 - 6 - 6,
                    child: Obx(() => TextBox(
                          placeholder: Ctrl.to.modifiedChildPosId.value,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          onChanged: (v) {
                            if (v != '') {
                              Ctrl.to.modifiedChildPosId.value = v;
                            }
                          },
                        )),
                  ),
                ])),
      ],
    );
  }
}
