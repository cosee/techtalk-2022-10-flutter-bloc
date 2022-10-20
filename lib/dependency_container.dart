import 'package:get_it/get_it.dart';
import 'package:lightbulb/domain/interfaces/lightbulb_api.dart';
import 'package:lightbulb/infrastructure/repositories/lightbulb.dart';

final getIt = GetIt.instance;

Future<void> setupDependencies() {
  getIt.registerLazySingleton<LightbulbAPI>(() => LightbulbRepository());
  return getIt.allReady();
}
