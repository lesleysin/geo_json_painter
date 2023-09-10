
import 'geo_json_feature_type.dart';

abstract class GeoJsonObject {
  final GeoJsonFeatureType type;

  GeoJsonObject({
    required this.type,
  });
}
