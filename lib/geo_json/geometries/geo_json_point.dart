import 'dart:ui';

import 'package:geo_json_painter/geo_json/models/index.dart';

class GeoJsonPoint extends GeoJsonGeometryObject {
  final GeoJsonCoordinatePair coordinates;

  GeoJsonPoint({
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
    canvas.drawPoints(
      PointMode.points,
      [
        Offset(coordinates[1], coordinates[0]),
      ],
      mergePaints(paint, internalPaintOverridingEnabled),
    );
  }
}
