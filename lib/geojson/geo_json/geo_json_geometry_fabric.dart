import 'geo_json_feature_type.dart';
import 'geo_json_geometry_object.dart';
import 'geo_json_point.dart';

class GeometryFabric {
  static GeoJsonGeometryObject createFeature(Map<String, dynamic> json) {
    final featureType = geoJsonFeatureTypeFromString(json["type"]);
    switch (featureType) {
      case GeoJsonFeatureType.Point:
        {
          return GeoJsonPoint(
            type: featureType,
            coordinates: List.from(json["coordinates"]),
          );
        }
      default:
        {
          throw ArgumentError("Feature type must be valid GeoJsonFeatureType");
        }
    }
  }
}