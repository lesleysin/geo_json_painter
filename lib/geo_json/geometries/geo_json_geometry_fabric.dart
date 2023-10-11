import 'package:geo_json_painter/geo_json/models/index.dart';

import 'index.dart';

class GeometryFabric {
  static GeoJsonGeometryObject createFeature(
    Map<String, dynamic> json,
    PaintProperties props,
  ) {
    final featureType = geoJsonFeatureTypeFromString(json["type"]);

    switch (featureType) {
      case GeoJsonFeatureType.Point:
        {
          return GeoJsonPoint(
            type: featureType,
            coordinates: List.from(json["coordinates"]),
            paintProperties: props,
          );
        }
      case GeoJsonFeatureType.MultiPoint:
        {
          return GeoJsonMultiPoint(
            type: featureType,
            coordinates: List.from(json["coordinates"]),
            paintProperties: props,
          );
        }
      case GeoJsonFeatureType.LineString:
        {
          return GeoJsonLineStrings(
            type: featureType,
            coordinates: List.from(json["coordinates"]),
            paintProperties: props,
          );
        }
      case GeoJsonFeatureType.MultiLineString:
        {
          return GeoJsonMultiLineString(
            type: featureType,
            coordinates: List.from(json["coordinates"]),
            paintProperties: props,
          );
        }
      case GeoJsonFeatureType.Polygon:
        {
          return GeoJsonPolygon(
            type: featureType,
            coordinates: List.from(json["coordinates"]),
            paintProperties: props,
          );
        }
      case GeoJsonFeatureType.MultiPolygon:
        {
          return GeoJsonMultiPolygon(
            type: featureType,
            coordinates: List.from(json["coordinates"]),
            paintProperties: props,
          );
        }
      default:
        {
          throw ArgumentError("Feature type must be valid GeoJsonFeatureType");
        }
    }
  }
}
