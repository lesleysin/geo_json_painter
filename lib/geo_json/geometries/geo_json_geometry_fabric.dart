import 'package:geo_json_painter/geo_json/models/index.dart';

import 'index.dart';

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
      case GeoJsonFeatureType.MultiPoint:
        {
          return GeoJsonMultiPoint(
            type: featureType,
            coordinates: List.from(json["coordinates"]),
          );
        }
      case GeoJsonFeatureType.LineString:
        {
          return GeoJsonLineStrings(
            type: featureType,
            coordinates: List.from(json["coordinates"]),
          );
        }
      case GeoJsonFeatureType.MultiLineString:
        {
          return GeoJsonMultiLineString(
            type: featureType,
            coordinates: List.from(json["coordinates"]),
          );
        }
      case GeoJsonFeatureType.Polygon:
        {
          return GeoJsonPolygon(
            type: featureType,
            coordinates: List.from(json["coordinates"]),
          );
        }
      case GeoJsonFeatureType.MultiPolygon:
        {
          return GeoJsonMultiPolygon(
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
