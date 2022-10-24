part of 'light_bulb_bloc.dart';

abstract class LightBulbState extends Equatable {
  const LightBulbState(this.colorId);

  final int colorId;

  @override
  List<Object?> get props => [colorId];
}

class LightBulbOff extends LightBulbState {
  const LightBulbOff(super.colorId);
}

class LightBulbOn extends LightBulbState {
  const LightBulbOn(super.colorId, this.lightBulb);

  final LightBulb lightBulb;

  @override
  List<Object?> get props => [lightBulb];
}
