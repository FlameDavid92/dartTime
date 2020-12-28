import 'ShapeFactory.dart';

main() {
  //final circle = Circle(2);
  //final square = Square(2);
  /*final circle = shapeFactory('circle');
  final square = shapeFactory('square');
  print(circle.area);
  print(square.area);*/
  final circle2 = Shape('circle');
  final square2 = Shape('square');
  print(circle2.area);
  print(square2.area);

  try {
    print(Shape('triangle').area);
  } catch (err) {
    print(err);
  }
}