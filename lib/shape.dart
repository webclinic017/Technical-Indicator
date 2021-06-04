import 'package:flutter/cupertino.dart';

class TypeIndicator extends ShapeBorder {
  final bool usePadding;

  TypeIndicator({this.usePadding = true});

  @override
  EdgeInsetsGeometry get dimensions =>
      EdgeInsets.only(bottom: usePadding ? 20 : 0);

  @override
  Path getInnerPath(Rect rect, {TextDirection textDirection}) => null;

  @override
  Path getOuterPath(Rect rect, {TextDirection textDirection}) {
    rect = Rect.fromPoints(rect.topLeft, rect.bottomRight - Offset(0, 20));
    return Path()
      ..addRRect(RRect.fromRectAndRadius(rect, Radius.circular(10)))
      ..moveTo(rect.centerLeft.dx - 10, rect.centerLeft.dy)
      ..relativeLineTo(20, -10)
      ..relativeLineTo(20, 35)
      ..close();
  }

  @override
  ShapeBorder scale(double t) => this;

  @override
  void paint(Canvas canvas, Rect rect, {TextDirection textDirection}) {}
}
