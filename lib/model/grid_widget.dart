import 'dart:convert';

import 'package:fluent_ui/fluent_ui.dart';

class GridWidget {
  // Widget widget;
  // String name;
  // Offset currentPosition;
  double top;
  double left;
  double width;
  double height;
  String name;
  String className;
  int menuId;
  int menuSubId;
  int childPosId;
  Color color;
  GridWidget({
    required this.top,
    required this.left,
    required this.width,
    required this.height,
    required this.name,
    required this.className,
    required this.menuId,
    required this.menuSubId,
    required this.childPosId,
    required this.color,
  });

  // GridWidget copyWith({
  //   double? top,
  //   double? left,
  //   double? width,
  //   double? height,
  //   String? name,
  //   Color? color,
  // }) {
  //   return GridWidget(
  //     top: top ?? this.top,
  //     left: left ?? this.left,
  //     width: width ?? this.width,
  //     height: height ?? this.height,
  //     name: name ?? this.name,
  //     color: color ?? this.color,
  //   );
  // }

  Map<String, dynamic> toMap() {
    return {
      'top': top,
      'left': left,
      'width': width,
      'height': height,
      'name': name,
      'className': className,
      'menuId': menuId,
      'menuSubId': menuSubId,
      'childPosId': childPosId,
      'color': color.value,
    };
  }

  factory GridWidget.fromMap(Map<String, dynamic> map) {
    return GridWidget(
      top: map['top']?.toDouble() ?? 0.0,
      left: map['left']?.toDouble() ?? 0.0,
      width: map['width']?.toDouble() ?? 0.0,
      height: map['height']?.toDouble() ?? 0.0,
      name: map['name'] ?? '',
      className: map['className'] ?? '',
      menuId: map['menuId']?.toInt() ?? 0,
      menuSubId: map['menuSubId']?.toInt() ?? 0,
      childPosId: map['childPosId']?.toInt() ?? 0,
      color: Color(map['color']),
    );
  }

  String toJson() => json.encode(toMap());

  static List<GridWidget> fromJson(String source) {
    final List<dynamic> json = jsonDecode(source);
    // final List<GridWidget> res =
    //     List<GridWidget>.from(json.map((map) => GridWidget.fromMap(map)));
    final List<GridWidget> res =
        List<GridWidget>.from(json.map((map) => GridWidget.fromMap(map)));
    return res;
  }

  @override
  String toString() {
    return 'GridWidget(top: $top, left: $left, width: $width, height: $height, name: $name, className: $className, menuId: $menuId, menuSubId: $menuSubId, childPosId: $childPosId, color: $color)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is GridWidget &&
        other.top == top &&
        other.left == left &&
        other.width == width &&
        other.height == height &&
        other.name == name &&
        other.className == className &&
        other.menuId == menuId &&
        other.menuSubId == menuSubId &&
        other.childPosId == childPosId &&
        other.color == color;
  }

  @override
  int get hashCode {
    return top.hashCode ^
        left.hashCode ^
        width.hashCode ^
        height.hashCode ^
        name.hashCode ^
        className.hashCode ^
        menuId.hashCode ^
        menuSubId.hashCode ^
        childPosId.hashCode ^
        color.hashCode;
  }

  // factory GridWidget.fromJson(String source) => GridWidget.fromMap(json.decode(source));

  // factory GridWidget.fromJson(String source) =>
  //     GridWidget.fromMap(json.decode(source));

  GridWidget copyWith({
    double? top,
    double? left,
    double? width,
    double? height,
    String? name,
    String? className,
    int? menuId,
    int? menuSubId,
    int? childPosId,
    Color? color,
  }) {
    return GridWidget(
      top: top ?? this.top,
      left: left ?? this.left,
      width: width ?? this.width,
      height: height ?? this.height,
      name: name ?? this.name,
      className: className ?? this.className,
      menuId: menuId ?? this.menuId,
      menuSubId: menuSubId ?? this.menuSubId,
      childPosId: childPosId ?? this.childPosId,
      color: color ?? this.color,
    );
  }

  // factory GridWidget.fromJson(String source) => GridWidget.fromMap(json.decode(source));
}
