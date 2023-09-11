import 'drawable.dart';
import 'geo_json_object.dart';

///An abstract class used to combine inherited
///properties of the [GeoJsonObject] object and the [Drawable] interface
abstract class GeoJsonGeometryObject extends GeoJsonObject implements Drawable {
  GeoJsonGeometryObject({required super.type});
}
