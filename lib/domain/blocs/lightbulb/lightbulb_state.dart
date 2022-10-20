part of 'lightbulb_bloc.dart';

abstract class LightbulbState extends Equatable {
  const LightbulbState(this.colorIndex);

  final int colorIndex;

  @override
  List<Object?> get props => [colorIndex];
}

class LightbulbOff extends LightbulbState {
  const LightbulbOff(super.colorIndex);
}

class LightbulbOn extends LightbulbState {
  const LightbulbOn(super.colorIndex, this.lightbulb);

  final Lightbulb lightbulb;

  @override
  List<Object?> get props => [lightbulb];
}
