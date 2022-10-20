import 'package:get_it/get_it.dart';
import 'package:lightbulb/domain/interfaces/lightbulb_api.dart';

extension GetItExtension on GetIt {
  LightbulbAPI get lightbulbAPI => get<LightbulbAPI>();
}
