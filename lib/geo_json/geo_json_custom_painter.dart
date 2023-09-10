import 'package:flutter/material.dart';

import 'geo_json.dart';
import 'geo_json_feature_type.dart';

class GeoJsonCustomPainter extends CustomPainter {
  final GeoJson geoJson;
  final Map<GeoJsonFeatureType, Paint> paints;

  GeoJsonCustomPainter({
    required this.geoJson,
    this.paints = const {},
  });

  @override
  void paint(Canvas canvas, Size size) {
    if (geoJson.collection != null) {
      for (var feature in geoJson.collection!.features) {
        feature.geometry.drawOnCanvas(canvas, paints[feature.type]);
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
