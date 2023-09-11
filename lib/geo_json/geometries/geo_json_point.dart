import 'dart:ui';

import 'package:geo_json_painter/geo_json/constants/default_paint.dart';
import 'package:geo_json_painter/geo_json/models/index.dart';

class GeoJsonPoint extends GeoJsonGeometryObject {
  final GeoJsonCoordinatePair coordinates;

  GeoJsonPoint({
    required super.type,
    required this.coordinates,
  });

  @override
  void drawOnCanvas(Canvas canvas, Paint? paint) {
    canvas.drawPoints(
      PointMode.points,
      [
        Offset(coordinates[1], coordinates[0]),
      ],
      paint ?? defaultPaint,
    );
  }
}
