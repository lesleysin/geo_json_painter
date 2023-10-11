import 'dart:ui';

import 'package:geo_json_painter/geo_json/models/index.dart';

class GeoJsonPolygon extends GeoJsonGeometryObject {
  final List<GeoJsonCoordinatePairList> coordinates;

  GeoJsonPolygon({
    required super.type,
    required this.coordinates,
    required super.paintProperties,
  });

  @override
  void drawOnCanvas(
    Canvas canvas,
    Paint? paint,
    bool internalPaintOverridingEnabled,
  ) {
    for (var polygon in coordinates) {
      final List<Offset> points = [];
      for (var pair in polygon) {
        points.add(
          Offset(pair[1], pair[0]),
        );
      }
      canvas.drawPoints(
        PointMode.polygon,
        points,
        mergePaints(paint, internalPaintOverridingEnabled),
      );
    }
  }
}
