import 'package:lightbulb/domain/models/lightbulb.dart';

abstract class LightbulbAPI {
  Lightbulb getLightbulb(int index);

  int get count;
}
