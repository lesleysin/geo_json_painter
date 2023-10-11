import 'dart:ui';

import 'package:geo_json_painter/geo_json/models/index.dart';

class GeoJsonLineStrings extends GeoJsonGeometryObject {
  final GeoJsonCoordinatePairList coordinates;

  GeoJsonLineStrings({
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
    final List<Offset> points = [];
    for (var pair in coordinates) {
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
