part of 'lightbulb_bloc.dart';

abstract class LightbulbEvent {
  const LightbulbEvent();
}

class LightbulbToggleEvent extends LightbulbEvent {
  const LightbulbToggleEvent();
}

class LightbulbNextEvent extends LightbulbEvent {
  const LightbulbNextEvent();
}

class LightbulbBackEvent extends LightbulbEvent {
  const LightbulbBackEvent();
}
