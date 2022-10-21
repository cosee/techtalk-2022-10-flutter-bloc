part of 'light_bulb_bloc.dart';

abstract class LightBulbState extends Equatable {
  const LightBulbState(this.colorIndex);

  final int colorIndex;

  @override
  List<Object?> get props => [colorIndex];
}

class LightBulbOff extends LightBulbState {
  const LightBulbOff(super.colorIndex);
}

class LightBulbOn extends LightBulbState {
  const LightBulbOn(super.colorIndex, this.lightbulb);

  final LightBulb lightbulb;

  @override
  List<Object?> get props => [lightbulb];
}
