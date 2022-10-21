part of 'light_bulb_bloc.dart';

abstract class LightBulbEvent {
  const LightBulbEvent();
}

class LightBulbToggleEvent extends LightBulbEvent {
  const LightBulbToggleEvent();
}

class LightBulbNextEvent extends LightBulbEvent {
  const LightBulbNextEvent();
}
