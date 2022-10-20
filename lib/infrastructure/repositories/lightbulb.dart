import 'package:lightbulb/domain/interfaces/lightbulb_api.dart';
import 'package:lightbulb/domain/models/lightbulb.dart';

class LightbulbRepository implements LightbulbAPI {
  static const _lightbulbs = [
    Lightbulb('red', 0xFFF44336),
    Lightbulb('blue', 0xFF2196F3),
    Lightbulb('green', 0xFF4CAF50),
    Lightbulb('yellow', 0xFFFFEB3B),
    Lightbulb('orange', 0xFFFF9800),
  ];

  @override
  Lightbulb getLightbulb(int id) {
    return _lightbulbs[id];
  }

  @override
  int get count => _lightbulbs.length;
}
