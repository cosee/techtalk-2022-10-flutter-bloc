import 'package:light_bulb/domain/interfaces/light_bulb_api.dart';
import 'package:light_bulb/domain/models/light_bulb.dart';

class LightBulbRepository implements LightBulbAPI {
  static const _lightBulbs = [
    LightBulb('red', 0xFFF44336),
    LightBulb('blue', 0xFF2196F3),
    LightBulb('green', 0xFF4CAF50),
    LightBulb('yellow', 0xFFFFEB3B),
    LightBulb('orange', 0xFFFF9800),
  ];

  @override
  LightBulb getLightBulb(int id) {
    return _lightBulbs[id];
  }

  @override
  int get count => _lightBulbs.length;
}
