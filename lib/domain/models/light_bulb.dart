import 'package:equatable/equatable.dart';

class LightBulb extends Equatable {
  const LightBulb(this.color, this.hexCode);

  final String color;
  final int hexCode;

  @override
  List<Object?> get props => [color, hexCode];
}
