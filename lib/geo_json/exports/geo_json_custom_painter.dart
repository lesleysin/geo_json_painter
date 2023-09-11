import 'package:flutter/material.dart';
import 'package:geo_json_painter/geo_json/geometries/index.dart';
import 'package:geo_json_painter/geo_json/models/index.dart';

import 'index.dart';

class GeoJsonCustomPainter extends CustomPainter {
  final GeoJson geoJson;
  final Map<GeoJsonFeatureType, Paint> paints;

  GeoJsonCustomPainter({
    required this.geoJson,
    this.paints = const {},
  });

  void _drawGeometry(GeoJsonGeometryObject geometryObject, Canvas canvas) {
    geometryObject.drawOnCanvas(
      canvas,
      paints[geometryObject.type],
    );
  }

  void _drawCollection(GeoJsonGeometryCollection collection, Canvas canvas) {
    for (var geometry in collection.geometries) {
      _drawGeometry(geometry, canvas);
    }
  }

  @override
  void paint(Canvas canvas, Size size) {
    if (geoJson.collection != null) {
      for (var feature in geoJson.collection!.features) {
        if (feature.geometry.type == GeoJsonFeatureType.GeometryCollection) {
          _drawCollection(
              feature.geometry as GeoJsonGeometryCollection, canvas);
        } else {
          _drawGeometry(feature.geometry, canvas);
        }
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
