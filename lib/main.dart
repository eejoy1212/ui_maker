// ignore_for_file: prefer_const_constructors, avoid_print, unnecessary_new, prefer_interpolation_to_compose_strings, unused_element

import 'dart:developer';
import 'dart:io';

import 'package:fluent_ui/fluent_ui.dart';
import 'package:get/get.dart';
import 'package:showcaseview/showcaseview.dart';
import 'package:window_manager/window_manager.dart';

import 'package:ui_maker/components/button/wgs_floation_action_btn.dart';
import 'package:ui_maker/components/card/row_col_selected_card.dart';
import 'package:ui_maker/components/child_pos_area.dart';
import 'package:ui_maker/controller/ctrl.dart';
import 'package:ui_maker/model/grid_widget.dart';
import 'package:ui_maker/resizable_widget.dart';
import 'package:ui_maker/style/color.dart';
import 'package:ui_maker/style/text.dart';

GlobalKey one = GlobalKey();
GlobalKey two = GlobalKey();
GlobalKey three = GlobalKey();
//파일에 저장된거는 픽셀. 입력받는거는 비율, 퍼센트
void main() async {
  Get.lazyPut(() => Ctrl());
  initUI();
  // // Ctrl.to.dialogWidget.add(UIControllerDialog(child: RowColSelectCard()));
  initDialog();
  Ctrl.to.init();
  await resolutionInit();
  runApp(const MyApp());
}

Future<void> resolutionInit() async {
  WidgetsFlutterBinding.ensureInitialized();
  await windowManager.ensureInitialized();

  WindowOptions windowOptions = const WindowOptions(
      size: Size(1920, 1080),
      center: true,
      backgroundColor: Colors.transparent,
      skipTaskbar: false,
      // titleBarStyle: TitleBarStyle.hidden,
      fullScreen: false);

  windowManager.waitUntilReadyToShow(windowOptions, () async {
    await windowManager.show();
    await windowManager.focus();
  });
}

void initUI() {
  final Directory directory = Directory.current;
  final String readingUIres = readUIFile(directory, 'ui_setting');
  log('file read res : $readingUIres');
  final uiJson = GridWidget.fromJson(readingUIres);
  log('init GridWidget : $uiJson');
  if (uiJson.isNotEmpty) {
    for (var i = 0; i < uiJson.length; i++) {
      Ctrl.to.gridWidgetsForFile.add(
        GridWidget(
          top: uiJson[i].top,
          left: uiJson[i].left,
          width: uiJson[i].width,
          height: uiJson[i].height,
          name: uiJson[i].name,
          color: uiJson[i].color,
          menuId: uiJson[i].menuId,
          childPosId: uiJson[i].childPosId,
          className: uiJson[i].className,
          menuSubId: uiJson[i].menuSubId,
        ),
      );
    }
    for (var j = 0; j < Ctrl.to.gridWidgetsForFile.length; j++) {
      Ctrl.to.gridWidgets.add(
        UIMakerResizebleWidget(
          idx: j,
          widgetColor: Color(Ctrl.to.gridWidgetsForFile[j].color.value).obs,
          childPosId: Ctrl.to.gridWidgetsForFile[j].childPosId.obs,
          name: Ctrl.to.gridWidgetsForFile[j].name.obs,
          className: Ctrl.to.gridWidgetsForFile[j].className.obs,
          menuId: (Ctrl.to.gridWidgetsForFile[j].menuId).obs,
          menuSubId: (Ctrl.to.gridWidgetsForFile[j].menuSubId).obs,

          // height: Ctrl.to.gridWidgetsForFile[j].height.value,
          // width: Ctrl.to.gridWidgetsForFile[j].width.value,
          // left: Ctrl.to.gridWidgetsForFile[j].left.value,
          // top: Ctrl.to.gridWidgetsForFile[j].top.value,
        ),
      );
    }
    for (var k = 0; k < Ctrl.to.gridWidgets.length; k++) {
      // final List<double> newSizes = Ctrl.to.createRatioSize(
      //   Ctrl.to.gridWidgetsForFile[k].top,
      //   Ctrl.to.gridWidgetsForFile[k].left,
      //   Ctrl.to.gridWidgetsForFile[k].width,
      //   Ctrl.to.gridWidgetsForFile[k].height,
      // );
      Ctrl.to.gridWidgets[k].top.value =
          (Ctrl.to.gridWidgetsForFile[k].top / 100) * 360;
      log('top${Ctrl.to.gridWidgetsForFile[k].top}%는 픽셀로 얼마?? : ${Ctrl.to.gridWidgets[k].top.value}');

      Ctrl.to.gridWidgets[k].left.value =
          (Ctrl.to.gridWidgetsForFile[k].left / 100) * 640;
      Ctrl.to.gridWidgets[k].width.value =
          (Ctrl.to.gridWidgetsForFile[k].width / 100) * 640;
      Ctrl.to.gridWidgets[k].height.value =
          (Ctrl.to.gridWidgetsForFile[k].height / 100) * 360;
      Ctrl.to.gridWidgets[k].widgetColor.value =
          Ctrl.to.gridWidgetsForFile[k].color;
    }
    Ctrl.to.selectedWidget.value = Ctrl.to.gridWidgetsForFile.first.name;
    Ctrl.to.selectedWidthWidget.value = Ctrl.to.gridWidgetsForFile.first.name;
    Ctrl.to.selectedHeightWidget.value = Ctrl.to.gridWidgetsForFile.first.name;
  }
}

void initDialog() {
  final Directory directory = Directory.current;
  final String readingDialog = readUIFile(directory, 'dialog_setting');
  log('dialog file read res : $readingDialog');
  final dialogJson = GridWidget.fromJson(readingDialog);
  // List json = dialogJson;
  log('init dialog GridWidget : $dialogJson');
  if (dialogJson.isEmpty) {
    Ctrl.to.dialogForFile.add(GridWidget(
      top: 0.0,
      left: 0.0,
      width: 500.0,
      height: 900.0,
      name: '',
      color: Colors.transparent,
      childPosId: 4,
      className: '',
      menuId: 0,
      menuSubId: 0,
    ));
    // Ctrl.to.dialogWidget.add(UIControllerDialog(child: RowColSelectCard()));
  }
  if (dialogJson.isNotEmpty) {
    Ctrl.to.dialogForFile.add(GridWidget(
      top: dialogJson.first.top,
      left: dialogJson.first.left,
      width: dialogJson.first.width,
      height: dialogJson.first.height,
      name: '',
      color: Colors.transparent,
      childPosId: 4,
      className: '',
      menuId: 0,
      menuSubId: 0,
    ));

    Ctrl.to.dialogWidget.add(UIControllerDialog(child: RowColSelectCard()));
    Ctrl.to.dialogWidget.first.top.value = Ctrl.to.dialogForFile.first.top;
    Ctrl.to.dialogWidget.first.left.value = Ctrl.to.dialogForFile.first.left;
    Ctrl.to.dialogWidget.first.width.value = Ctrl.to.dialogForFile.first.width;
    Ctrl.to.dialogWidget.first.height.value =
        Ctrl.to.dialogForFile.first.height;
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Ctrl.to.appSize = MediaQuery.of(context).size;
    return Obx(() => FluentApp(
          themeMode: Ctrl.to.isDark.isTrue ? ThemeMode.dark : ThemeMode.light,
          debugShowCheckedModeBanner: false,
          darkTheme: ThemeData(
            scaffoldBackgroundColor:
                Ctrl.to.isDark.isTrue ? Colors.black : Color(0xffF5F5F5),
            brightness: Brightness.dark,
            visualDensity: VisualDensity.standard,
          ),
          home: UIMaker(),
        ));
  }
}

class UIMaker extends StatelessWidget {
  const UIMaker({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return NavigationView(
        content: ShowCaseWidget(builder: Builder(builder: (context) {
      return NavigationBody(
          key: key,
          index: Ctrl.to.selectedPage.value,
          children: List.generate(7, (index) {
            if (index == 1) {
              return Row(
                children: [
                  SizedBox(
                    width: 236,
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          WidgetPositionCard(),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            } else {
              //여기가 지금 페이지

              return SizedBox(
                  // width: 1890,
                  width: 1920,
                  height: 1080,
                  // color: Colors.black,
                  child: Stack(alignment: Alignment.topRight, children: [
                    GestureDetector(
                        onTap: () {
                          log('그리드 탭 되나요');
                          Ctrl.to.modifiedswidgetName.value = '';
                          Ctrl.to.modifiedClassName.value = '';
                          Ctrl.to.modifiedMenuId.value = '';
                          Ctrl.to.modifiedSubMenuId.value = '';
                          Ctrl.to.modifiedChildPosId.value = '';
                          for (var element in Ctrl.to.gridWidgets) {
                            element.isHide.value = true;
                          }
                        },
                        child: const ChildPosArea()),

                    ///child_pos_id별로 구역 나눈 거

                    Obx(
                      () => Visibility(
                          visible: Ctrl.to.isDialogOpen.value,
                          child: Ctrl.to.dialogWidget.first),
                    ),
                    //위젯 전체 보여주는거
                    // Obx(() => Visibility(
                    //     visible: Ctrl.to.showMenu.value,
                    //     child: Positioned(
                    //       top: 0,
                    //       left: 0,
                    //       child: Container(
                    //           width: 200,
                    //           height: 1080,
                    //           color: WGSColors.weakGrey,
                    //           child: Column(
                    //             children: List.generate(
                    //                 Ctrl.to.gridWidgets.length,
                    //                 (index) => Expander(
                    //                     header: Row(
                    //                       children: [
                    //                         Container(
                    //                           width: 20,
                    //                           height: 20,
                    //                           color: Ctrl.to.gridWidgets[index]
                    //                               .widgetColor.value,
                    //                         ),
                    //                         Text(Ctrl
                    //                             .to
                    //                             .gridWidgetsForFile[index]
                    //                             .name),
                    //                       ],
                    //                     ),
                    //                     content: Column(
                    //                       children: [
                    //                         Row(
                    //                           mainAxisAlignment:
                    //                               MainAxisAlignment
                    //                                   .spaceBetween,
                    //                           children: [
                    //                             Container(
                    //                                 // width: 100,
                    //                                 child: Text('위젯 hide',
                    //                                     style: cardTitle)),
                    //                             SizedBox(
                    //                                 // width: 62,
                    //                                 child: ToggleSwitch(
                    //                               checked: Ctrl
                    //                                   .to
                    //                                   .gridWidgets[index]
                    //                                   .widgetHide
                    //                                   .value,
                    //                               onChanged: (v) {
                    //                                 Ctrl.to.gridWidgets[index]
                    //                                     .widgetHide.value = v;
                    //                               },
                    //                             )),
                    //                           ],
                    //                         ),
                    //                       ],
                    //                     ))),
                    //           )),
                    //     ))),

                    Positioned(
                      right: 56,
                      bottom: 56,
                      child: Row(
                        children: [
                          WGSFAB(
                            fluentIcon: Ctrl.to.isDark.value
                                ? FluentIcons.sunny
                                : FluentIcons.clear_night,
                            bgColor: Ctrl.to.isDark.value
                                ? Colors.white
                                : WGSColors.weakGrey,
                            iconColor: Ctrl.to.isDark.value
                                ? WGSColors.weakGrey
                                : Colors.white,
                            onTap: () {
                              Ctrl.to.isDark.value = !Ctrl.to.isDark.value;
                            },
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          WGSFAB(
                            bgColor: Ctrl.to.isDark.value
                                ? WGSColors.mint
                                : Colors.teal,
                            fluentIcon: FluentIcons.sign_out,
                            onTap: () {
                              exitDialog(context);
                            },
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          WGSFAB(
                            bgColor: Ctrl.to.isDark.value
                                ? WGSColors.mint
                                : Colors.teal,
                            fluentIcon: FluentIcons.content_settings,
                            onTap: () {
                              Ctrl.to.isDialogOpen.value =
                                  !Ctrl.to.isDialogOpen.value;
                              log('다이얼로그창 오픈');
                            },
                          )
                        ],
                      ),
                    )
                  ]));
            }
          }));
    })));
  }
}

class ExitBtn extends StatelessWidget {
  const ExitBtn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: SizedBox(
        width: 204,
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
            '프로그램 종료',
            style: TextStyle(color: Colors.black),
          ),
          onPressed: () {
            exitDialog(context);
          },
        ),
      ),
    );
  }
}

void exitDialog(BuildContext context) {
  showDialog(
      context: context,
      builder: (ctx) {
        return ContentDialog(
          title: Text(
            '프로그램을 종료하시겠습니까?',
            style: cardTitle,
          ),
          actions: [
            Button(
                style: ButtonStyle(
                    border: ButtonState.all(BorderSide(color: WGSColors.mint))),
                child: Text(
                  '아니오.',
                  style: cardContents,
                ),
                onPressed: () {
                  Navigator.pop(context);
                }),
            Button(
                style: ButtonStyle(
                    backgroundColor: ButtonState.all(WGSColors.mint)),
                child: Text(
                  '예.',
                  style: cardContentsBlack,
                ),
                onPressed: () {
                  final String uiRes = Ctrl.to.gridWidgetsForFile
                      .map((element) => element.toJson())
                      .toList()
                      .toString();

                  final String dialogRes = Ctrl.to.dialogForFile
                      .map((element) => element.toJson())
                      .toList()
                      .toString();

                  final Directory dir = Directory.current;

                  createUIsettingFile(uiRes, dir, 'ui_setting');
                  createControllerDialogFile(dialogRes, dir, 'dialog_setting');
                  debugPrint('toJson : $uiRes');
                  if (uiRes != '' && dialogRes != '') {
                    exit(0);
                  }
                })
          ],
        );
      });
}

void createUIsettingFile(String content, Directory dir, String fileName) {
  print("Creating file!");
  File file = new File(dir.path + "/" + fileName + '.json');
  file.createSync();
  // fileExists = true;
  file.writeAsStringSync(content);
}

void createControllerDialogFile(
    String content, Directory dir, String fileName) {
  print("Creating file!");
  File file = new File(dir.path + "/" + fileName + '.json');
  file.createSync();
  // fileExists = true;
  file.writeAsStringSync(content);
}

String readUIFile(Directory directory, String fileName) {
  String fileContent = '';
  // getApplicationDocumentsDirectory().then((directory) {
  final Directory dir = directory;
  final File jsonFile = new File(dir.path + "/" + fileName + '.json');
  final bool fileExists = jsonFile.existsSync();
  log('ui_setting 파일 존재?? : $fileExists');
  if (fileExists) {
    fileContent = jsonFile.readAsStringSync();
  }
  // });
  return fileContent;
}

String readDialogFile(Directory directory, String fileName) {
  String fileContent = '';
  // getApplicationDocumentsDirectory().then((directory) {
  final Directory dir = directory;
  final File jsonFile = new File(dir.path + "/" + fileName + '.json');
  final bool fileExists = jsonFile.existsSync();
  log('dialog_setting 파일 존재?? : $fileExists');
  if (fileExists) {
    fileContent = jsonFile.readAsStringSync();
  }
  // });
  return fileContent;
}

class WidgetPositionCard extends StatelessWidget {
  const WidgetPositionCard({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Obx(() => Container(
          width: 216,
          decoration: BoxDecoration(color: Color(0xff1A1A1A), boxShadow: [
            BoxShadow(
              color: Color(0xff0C0A0B).withOpacity(0.8),
              spreadRadius: 5,
              blurRadius: 10,
              offset: Offset(2, 6), // changes position of shadow
            ),
          ]),
          child: Padding(
            padding: const EdgeInsets.all(6),
            child: Column(
              children: [
                MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: SizedBox(
                    width: 204,
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
                        '위젯 추가하기',
                        style: TextStyle(color: Colors.black),
                      ),
                      onPressed: () {
                        // Ctrl.to.widgets.add(UIMakerResizebleWidget(
                        //     idx: Ctrl.to.widgets.length,
                        //     child: Container(
                        //         color: Colors.orange,
                        //         child: Center(
                        //             child: Text(
                        //                 '위젯_${Ctrl.to.widgets.length + 1}')))));

                        // Ctrl.to.offsetList.add(Offset(0, 0));
                      },
                    ),
                  ),
                ),
                Column(
                    children: List.generate(
                  Ctrl.to.offsetList.length,
                  (idx) => Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                          width: 93,
                          child: Text('위젯_${idx + 1}', style: cardTitle)),
                      Text(
                        '(${Ctrl.to.offsetList[idx].dx} , ${Ctrl.to.offsetList[idx].dy})',
                        style: cardContentsGreenHighlight,
                      )
                    ],
                  ),
                )),
              ],
            ),
          ),
        ));
  }
}

class ModelCard extends StatelessWidget {
  const ModelCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 216,
      // height: 109,
      decoration: BoxDecoration(color: Color(0xff1A1A1A), boxShadow: [
        BoxShadow(
          color: Color(0xff0C0A0B).withOpacity(0.8),
          spreadRadius: 5,
          blurRadius: 10,
          offset: Offset(2, 6), // changes position of shadow
        ),
      ]),
      child: Padding(
        padding: const EdgeInsets.all(6),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('Model Change', style: cardTitle),
            SizedBox(
              height: 4,
            ),
            SizedBox(
                width: 204,
                height: 16,
                child: DropDownButton(title: Text('data'), items: [
                  MenuFlyoutItem(
                      selected: true, text: Text('data'), onPressed: () {})
                ])),
            SizedBox(
              height: 4,
            ),
            SizedBox(
              width: 204,
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
                  'Execute',
                  style: TextStyle(color: Colors.black),
                ),
                onPressed: () {},
              ),
            ),
            SizedBox(
              height: 4,
            ),
            SizedBox(
              width: 204,
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
                  'Create',
                  style: TextStyle(color: Colors.black),
                ),
                onPressed: () {},
              ),
            ),
            SizedBox(
              height: 4,
            ),
            SizedBox(
              width: 204,
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
                  'Delete',
                  style: TextStyle(color: Colors.black),
                ),
                onPressed: () {},
              ),
            ),
            // Text(
            //   'Test',
            //   style: cardContentsMintHighlight,
            // )
          ],
        ),
      ),
    );
  }
}

void showError(BuildContext context, String errorMsg) {
  final snackbar = Snackbar(
      content: Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.all(
        Radius.circular(20),
      ),
    ),
    child: Text(errorMsg),
  ));
  showSnackbar(context, snackbar);
}

_getPosition(GlobalKey key) {
  if (key.currentContext != null) {
    final RenderBox renderBox =
        key.currentContext!.findRenderObject() as RenderBox;
    final position = renderBox.localToGlobal(Offset.zero);

    return position;
  }
}
