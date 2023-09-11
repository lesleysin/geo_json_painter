import 'package:flutter/material.dart';
import 'package:geo_json_painter/geo_json/feature/geo_json_feature.dart';
import 'package:geo_json_painter/geo_json/geometries/index.dart';
import 'package:geo_json_painter/geo_json/models/index.dart';

import 'index.dart';

class GeoJsonCustomPainter extends CustomPainter {
  final GeoJson geoJson;

  GeoJsonCustomPainter({
    required this.geoJson,
  });

  void _drawCollectionGeometry(GeoJsonGeometryObject geometry, Canvas canvas) {
    geometry.drawOnCanvas(canvas, geoJson.painters[geometry.type]);
  }

  void _drawFeature(
    GeoJsonFeature feature,
    Canvas canvas,
  ) {
    final builder = geoJson.builders[feature.geometry.type];
    final paint = geoJson.painters[feature.geometry.type];
    if (builder != null) {
      builder(canvas, feature);
    } else {
      feature.geometry.drawOnCanvas(canvas, paint);
    }
  }

  void _drawCollection(
    GeoJsonGeometryCollection collection,
    Canvas canvas,
  ) {
    for (var geometry in collection.geometries) {
      _drawCollectionGeometry(geometry, canvas);
    }
  }

  @override
  void paint(Canvas canvas, Size size) {
    if (geoJson.collection != null) {
      for (var feature in geoJson.collection!.features) {
        if (feature.geometry.type == GeoJsonFeatureType.GeometryCollection) {
          _drawCollection(
            feature.geometry as GeoJsonGeometryCollection,
            canvas,
          );
        } else {
          _drawFeature(
            feature,
            canvas,
          );
        }
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
