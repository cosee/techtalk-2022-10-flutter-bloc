import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:light_bulb/dependency_container.dart';
import 'package:light_bulb/domain/interfaces/light_bulb_api.dart';
import 'package:light_bulb/domain/models/light_bulb.dart';
import 'package:light_bulb/domain/utils/extensions/get_it.dart';

part 'light_bulb_event.dart';
part 'light_bulb_state.dart';

class LightBulbBloc extends Bloc<LightBulbEvent, LightBulbState> {
  LightBulbBloc() : super(const LightBulbOff(0)) {
    on<LightBulbToggleEvent>(_onLightbulbToggleEvent);
    on<LightBulbNextEvent>(_onLightbulbNextEvent);
    on<LightBulbBackEvent>(_onLightbulbBackEvent);
  }

  final LightBulbAPI _lightbulbAPI = getIt.lightBulbAPI;

  void _onLightbulbToggleEvent(
    LightBulbEvent event,
    Emitter<LightBulbState> emit,
  ) {
    final colorIndex = state.colorIndex;
    if (state is LightBulbOff) {
      final lightbulb = _lightbulbAPI.getLightBulb(colorIndex);
      emit(LightBulbOn(colorIndex, lightbulb));
    } else {
      emit(LightBulbOff(colorIndex));
    }
  }

  void _onLightbulbNextEvent(
    LightBulbNextEvent event,
    Emitter<LightBulbState> emit,
  ) {
    if (state is LightBulbOn) {
      int newColorIndex = state.colorIndex + 1;
      if (newColorIndex >= _lightbulbAPI.count) {
        newColorIndex = 0;
      }
      final lightbulb = _lightbulbAPI.getLightBulb(newColorIndex);
      emit(LightBulbOn(newColorIndex, lightbulb));
    }
  }

  void _onLightbulbBackEvent(
    LightBulbBackEvent event,
    Emitter<LightBulbState> emit,
  ) {
    if (state is LightBulbOn) {
      int newColorIndex = state.colorIndex - 1;
      if (newColorIndex < 0) {
        newColorIndex = _lightbulbAPI.count - 1;
      }
      final lightbulb = _lightbulbAPI.getLightBulb(newColorIndex);
      emit(LightBulbOn(newColorIndex, lightbulb));
    }
  }
}
