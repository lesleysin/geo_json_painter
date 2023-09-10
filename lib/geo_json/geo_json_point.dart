import 'dart:ui';
import 'package:geo_json_painter/geo_json/default_paint.dart';

import 'geo_json_geometry_object.dart';
import 'geo_json_coordinate_pair.dart';

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
