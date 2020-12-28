import 'Bicycle.dart';

void main() {
  final bike = Bicycle(2, 1);
  print(bike);
  bike.speedUp(10);
  bike.applyBrake(4);
  print(bike);
}
/*
void main(List<String> args) {}
*/