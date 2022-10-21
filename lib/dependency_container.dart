import 'package:get_it/get_it.dart';
import 'package:light_bulb/domain/interfaces/light_bulb_api.dart';
import 'package:light_bulb/infrastructure/repositories/light_bulb.dart';

final getIt = GetIt.instance;

Future<void> setupDependencies() {
  getIt.registerLazySingleton<LightBulbAPI>(() => LightBulbRepository());
  return getIt.allReady();
}
