import 'geo_json_feature_type.dart';
import 'geo_json_object.dart';
import 'geo_json_geometry_object.dart';

class GeoJsonFeature<T extends Object> extends GeoJsonObject {
  final GeoJsonGeometryObject geometry;
  final T properties;

  GeoJsonFeature({
    required super.type,
    required this.geometry,
    required this.properties,
  });

  factory GeoJsonFeature.fromJson(Map<String, dynamic> json) {
    final featureType = geoJsonFeatureTypeFromString(json['type']);
    return GeoJsonFeature(
      type: featureType,
      properties: json['properties'],
      geometry: GeometryFabric.createFeature(json["geometry"]),
    );
  }
}
