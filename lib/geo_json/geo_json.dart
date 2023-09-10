import 'package:geo_json_painter/geo_json/geo_json_feature_collection.dart';

import 'geo_json_feature.dart';

class GeoJson {
  GeoJsonFeatureCollection? _collection;

  GeoJson(Map<String, dynamic> json) {
    _collection = GeoJsonFeatureCollection.fromJson(json);
  }

  GeoJsonFeatureCollection? get collection => _collection;

  Future<void> addFeature(GeoJsonFeature feature) async {
    if (_collection != null) {
      _collection!.features.add(feature);
    }
  }
}

