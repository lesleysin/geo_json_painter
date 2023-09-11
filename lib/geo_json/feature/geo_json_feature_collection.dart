import 'package:geo_json_painter/geo_json/models/index.dart';

import 'index.dart';

class GeoJsonFeatureCollection extends GeoJsonObject {
  final List<GeoJsonFeature> features;

//<editor-fold desc="Data Methods">
  GeoJsonFeatureCollection({
    required this.features,
    required super.type,
  });

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
