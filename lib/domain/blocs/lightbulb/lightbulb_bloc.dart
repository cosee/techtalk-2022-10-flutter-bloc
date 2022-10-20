import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lightbulb/dependency_container.dart';
import 'package:lightbulb/domain/interfaces/lightbulb_api.dart';
import 'package:lightbulb/domain/models/lightbulb.dart';
import 'package:lightbulb/domain/utils/extensions/get_it.dart';

part 'lightbulb_event.dart';
part 'lightbulb_state.dart';

class LightbulbBloc extends Bloc<LightbulbEvent, LightbulbState> {
  LightbulbBloc() : super(const LightbulbOff(0)) {
    on<LightbulbToggleEvent>(_onLightbulbToggleEvent);
    on<LightbulbNextEvent>(_onLightbulbNextEvent);
    on<LightbulbBackEvent>(_onLightbulbBackEvent);
  }

  final LightbulbAPI _lightbulbAPI = getIt.lightbulbAPI;

  void _onLightbulbToggleEvent(
    LightbulbEvent event,
    Emitter<LightbulbState> emit,
  ) {
    final colorIndex = state.colorIndex;
    final lightbulb = _lightbulbAPI.getLightbulb(colorIndex);
    if (state is LightbulbOff) {
      emit(LightbulbOn(colorIndex, lightbulb));
    } else {
      emit(LightbulbOff(colorIndex));
    }
  }

  void _onLightbulbNextEvent(
    LightbulbNextEvent event,
    Emitter<LightbulbState> emit,
  ) {
    if (state is LightbulbOn) {
      int newColorIndex = state.colorIndex + 1;
      if (newColorIndex >= _lightbulbAPI.count) {
        newColorIndex = 0;
      }
      final lightbulb = _lightbulbAPI.getLightbulb(newColorIndex);
      emit(LightbulbOn(newColorIndex, lightbulb));
    }
  }

  void _onLightbulbBackEvent(
    LightbulbBackEvent event,
    Emitter<LightbulbState> emit,
  ) {
    if (state is LightbulbOn) {
      int newColorIndex = state.colorIndex - 1;
      if (newColorIndex < 0) {
        newColorIndex = _lightbulbAPI.count - 1;
      }
      final lightbulb = _lightbulbAPI.getLightbulb(newColorIndex);
      emit(LightbulbOn(newColorIndex, lightbulb));
    }
  }
}
