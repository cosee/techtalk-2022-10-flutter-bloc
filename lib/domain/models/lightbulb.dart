import 'package:equatable/equatable.dart';

class Lightbulb extends Equatable {
  const Lightbulb(this.color, this.hexCode);

  final String color;
  final int hexCode;

  @override
  List<Object?> get props => [color, hexCode];
}
