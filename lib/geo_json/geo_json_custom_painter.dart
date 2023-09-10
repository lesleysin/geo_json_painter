import 'package:flutter/material.dart';

import 'geo_json.dart';

class GeoJsonCustomPainter extends CustomPainter {
  final GeoJson geoJson;

  GeoJsonCustomPainter(
    this.geoJson,
  );

  @override
  void paint(Canvas canvas, Size size) {
    if (geoJson.collection != null) {
      for (var feature in geoJson.collection!.features) {
        feature.geometry.drawOnCanvas(canvas);
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
