import 'package:get_it/get_it.dart';
import 'package:light_bulb/domain/interfaces/light_bulb_api.dart';

extension GetItExtension on GetIt {
  LightBulbAPI get lightBulbAPI => get<LightBulbAPI>();
}
