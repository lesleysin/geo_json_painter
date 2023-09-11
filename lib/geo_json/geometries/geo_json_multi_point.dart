import 'dart:ui';

import 'package:geo_json_painter/geo_json/constants/default_paint.dart';
import 'package:geo_json_painter/geo_json/models/index.dart';

class GeoJsonMultiPoint extends GeoJsonGeometryObject {
  final GeoJsonCoordinatePairList coordinates;

  GeoJsonMultiPoint({
    required super.type,
    required this.coordinates,
  });

  @override
  void drawOnCanvas(
    Canvas canvas,
    Paint? paint,
  ) {
    final List<Offset> points = [];
    for (var pair in coordinates) {
      points.add(
        Offset(pair[1], pair[0]),
      );
    }
    canvas.drawPoints(
      PointMode.points,
      points,
      paint ?? defaultPaint,
    );
  }
}
