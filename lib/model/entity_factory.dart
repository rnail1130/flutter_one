import 'weather_entity.dart';
import 'new_entity.dart';

class EntityFactory {
  static T generateOBJ<T>(json) {
    if (1 == 0) {
      return null;
    } else if (T.toString() == "NewEntity") {
      return NewEntity.fromJson(json) as T;
    } else if (T.toString() == "WeatherEntity") {
      return WeatherEntity.fromJson(json) as T;
    } else {
      return null;
    }
  }
}
