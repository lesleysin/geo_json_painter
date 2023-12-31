import 'package:geo_json_painter/geo_json/models/index.dart';

import 'index.dart';

class GeometryFabric {
  static GeoJsonGeometryObject createFeature(
    Map<String, dynamic> json,
    PaintProperties props,
  ) {
    final featureType = geoJsonFeatureTypeFromString(json["type"]);

    switch (featureType) {
      case GeoJsonFeatureType.point:
        {
          return GeoJsonPoint(
            type: featureType,
            coordinates: List.from(json["coordinates"]),
            paintProperties: props,
          );
        }
      case GeoJsonFeatureType.multiPoint:
        {
          return GeoJsonMultiPoint(
            type: featureType,
            coordinates: List.from(json["coordinates"]),
            paintProperties: props,
          );
        }
      case GeoJsonFeatureType.lineString:
        {
          return GeoJsonLineString(
            type: featureType,
            coordinates: List.from(json["coordinates"]),
            paintProperties: props,
          );
        }
      case GeoJsonFeatureType.multiLineString:
        {
          return GeoJsonMultiLineString(
            type: featureType,
            coordinates: List.from(json["coordinates"]),
            paintProperties: props,
          );
        }
      case GeoJsonFeatureType.polygon:
        {
          return GeoJsonPolygon(
            type: featureType,
            coordinates: List.from(json["coordinates"]),
            paintProperties: props,
          );
        }
      case GeoJsonFeatureType.multiPolygon:
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
