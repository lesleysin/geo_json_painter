import 'package:flutter/material.dart';

import 'geojson/geo_json/geo_json_feature_collection.dart';


class DevPainter extends CustomPainter {
  final GeoJsonFeatureCollection collection;

  DevPainter(
    this.collection,
  );

  @override
  void paint(Canvas canvas, Size size) {
    for (var feature in collection.features) {
      feature.geometry.drawOnCanvas(canvas);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
