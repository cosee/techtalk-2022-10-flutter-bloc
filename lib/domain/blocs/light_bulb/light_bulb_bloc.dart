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
    on<LightBulbToggleEvent>(_onLightBulbToggleEvent);
    on<LightBulbNextEvent>(_onLightBulbNextEvent);
    on<LightBulbBackEvent>(_onLightBulbBackEvent);
  }

  final LightBulbAPI _lightBulbAPI = getIt.lightBulbAPI;

  void _onLightBulbToggleEvent(
    LightBulbEvent event,
    Emitter<LightBulbState> emit,
  ) {
    final colorId = state.colorId;
    if (state is LightBulbOff) {
      final lightBulb = _lightBulbAPI.getLightBulb(colorId);
      emit(LightBulbOn(colorId, lightBulb));
    } else {
      emit(LightBulbOff(colorId));
    }
  }

  void _onLightBulbNextEvent(
    LightBulbNextEvent event,
    Emitter<LightBulbState> emit,
  ) {
    if (state is LightBulbOn) {
      int newColorId = state.colorId + 1;
      if (newColorId >= _lightBulbAPI.count) {
        newColorId = 0;
      }
      final lightBulb = _lightBulbAPI.getLightBulb(newColorId);
      emit(LightBulbOn(newColorId, lightBulb));
    }
  }

  void _onLightBulbBackEvent(
    LightBulbBackEvent event,
    Emitter<LightBulbState> emit,
  ) {
    if (state is LightBulbOn) {
      int newColorId = state.colorId - 1;
      if (newColorId < 0) {
        newColorId = _lightBulbAPI.count - 1;
      }
      final lightBulb = _lightBulbAPI.getLightBulb(newColorId);
      emit(LightBulbOn(newColorId, lightBulb));
    }
  }
}
