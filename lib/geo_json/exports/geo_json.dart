import 'dart:ui';

import 'package:geo_json_painter/geo_json/feature/index.dart';
import 'package:geo_json_painter/geo_json/models/index.dart';

class GeoJson {
  late GeoJsonFeatureCollection? _collection;
  final Map<GeoJsonFeatureType, DrawFunction> _builders = {};
  final Map<GeoJsonFeatureType, Paint> _painters = {};

  Map<GeoJsonFeatureType, Paint> get painters => _painters;

  GeoJsonFeatureCollection? get collection => _collection;

  Map<GeoJsonFeatureType, DrawFunction> get builders => _builders;

  void parseGeoJson(Map<String, dynamic> json) {
    _collection = GeoJsonFeatureCollection.fromJson(json);
  }

  void addDrawMethodOverriding(GeoJsonFeatureType type, DrawFunction fn) {
    _builders[type] = fn;
  }

  void addPainterOverriding(GeoJsonFeatureType type, Paint paint) {
    _painters[type] = paint;
  }
}
