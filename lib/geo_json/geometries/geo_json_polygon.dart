import 'dart:ui';

import 'package:geo_json_painter/geo_json/constants/default_paint.dart';
import 'package:geo_json_painter/geo_json/models/index.dart';

class GeoJsonPolygon extends GeoJsonGeometryObject {
  final List<GeoJsonCoordinatePairList> coordinates;

  GeoJsonPolygon({
    required super.type,
    required this.coordinates,
  });

  @override
  void drawOnCanvas(Canvas canvas, Paint? paint) {
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
        paint ?? defaultPaint,
      );
    }
  }
}
