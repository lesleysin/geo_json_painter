import 'package:flutter/material.dart';
import 'package:geo_json_painter/geo_json/feature/geo_json_feature.dart';
import 'package:geo_json_painter/geo_json/geometries/index.dart';
import 'package:geo_json_painter/geo_json/models/index.dart';

import 'index.dart';

class GeoJsonCustomPainter extends CustomPainter {
  final GeoJson geoJson;
  final BeforeRenderHookCallback? beforeRender;
  final AfterRenderHookCallback? afterRender;

  ///Determines whether properties passed in the properties
  ///object will be used during rendering and whether
  ///these properties will override previously defined properties.
  ///
  ///This is possible when you have explicitly overridden
  ///the paint function for the primitive or
  ///explicitly defined a Paint object for the primitive
  final bool internalPaintOverridingEnabled;

  GeoJsonCustomPainter({
    required this.geoJson,
    this.internalPaintOverridingEnabled = true,
    this.beforeRender,
    this.afterRender,
  });

  void _drawCollectionGeometry(GeoJsonGeometryObject geometry, Canvas canvas) {
    geometry.drawOnCanvas(
      canvas,
      geoJson.painters[geometry.type],
      internalPaintOverridingEnabled,
      null,
    );
  }

  void _drawFeature(
    GeoJsonFeature feature,
    Canvas canvas,
  ) {
    final builder = geoJson.builders[feature.geometry.type];
    final paint = geoJson.painters[feature.geometry.type];
    if (builder != null) {
      builder(
        canvas,
        feature,
        paint,
      );
      afterRender?.call(feature.geometry);
    } else {
      feature.geometry.drawOnCanvas(
        canvas,
        paint,
        internalPaintOverridingEnabled,
        beforeRender,
      );
      afterRender?.call(feature.geometry);
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
        if (feature.geometry.type == GeoJsonFeatureType.geometryCollection) {
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
    return oldDelegate != this;
  }
}
