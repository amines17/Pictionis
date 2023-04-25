import 'dart:ui';

class DrawingPoint {
  Offset offset;
  Paint paint;

  DrawingPoint(this.offset, this.paint);

  @override
  String toString() {
    return '{ $offset, $paint }';
  }
}
