import 'drawable.dart';
import 'geo_json_object.dart';

abstract class GeoJsonGeometryObject extends GeoJsonObject implements Drawable {
  GeoJsonGeometryObject({required super.type});
}
