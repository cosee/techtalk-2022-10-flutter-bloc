import 'package:light_bulb/domain/models/light_bulb.dart';

abstract class LightBulbAPI {
  LightBulb getLightBulb(int index);

  int get count;
}
