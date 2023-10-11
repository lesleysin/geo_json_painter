import 'package:geo_json_painter/geo_json/geometries/index.dart';
import 'package:geo_json_painter/geo_json/models/index.dart';

class GeoJsonFeature extends GeoJsonObject {
  final GeoJsonGeometryObject geometry;
  final Map<String, dynamic> properties;

  GeoJsonFeature({
    required super.type,
    required this.geometry,
    required this.properties,
    super.id,
  });

  static PaintProperties _parseProperties(Map<String, dynamic> properties) {
    return PaintProperties.fromJson(properties);
  }

  factory GeoJsonFeature.fromJson(Map<String, dynamic> json) {
    final featureType = geoJsonFeatureTypeFromString(json['type']);
    return GeoJsonFeature(
      type: featureType,
      properties: json['properties'] ?? const {},
      geometry: GeometryFabric.createFeature(
          json["geometry"], _parseProperties(json['properties'] ?? const {})),
    );
  }
}
