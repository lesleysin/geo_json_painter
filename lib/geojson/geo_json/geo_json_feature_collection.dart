import 'geo_json_feature.dart';
import 'geo_json_feature_type.dart';
import 'geo_json_object.dart';

class GeoJsonFeatureCollection extends GeoJsonObject {
  final List<GeoJsonFeature> features;

//<editor-fold desc="Data Methods">
  GeoJsonFeatureCollection({
    required this.features,
    required super.type,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          (other is GeoJsonFeatureCollection &&
              runtimeType == other.runtimeType &&
              type == other.type &&
              features == other.features);

  @override
  int get hashCode => type.hashCode ^ features.hashCode;

  @override
  String toString() {
    return 'FeatureCollection{ type: $type, features: $features,}';
  }

  Map<String, dynamic> toMap() {
    return {
      'type': type,
      'features': features,
    };
  }

  factory GeoJsonFeatureCollection.fromJson(Map<String, dynamic> json) {
    final featureList = List<GeoJsonFeature>.empty(growable: true);
    if (json['features'] != null) {
      json['features'].forEach((feature) {
        featureList.add(
          GeoJsonFeature.fromJson(feature),
        );
      });
    }

    return GeoJsonFeatureCollection(
      type: geoJsonFeatureTypeFromString(json['type']),
      features: featureList,
    );
  }

//</editor-fold>
}
