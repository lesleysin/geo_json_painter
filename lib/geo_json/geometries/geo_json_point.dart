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
    BeforeRenderHookCallback? callback,
  ) {
    final pointOffset = Offset(coordinates[1], coordinates[0]);
    canvas.drawPoints(
      PointMode.points,
      [pointOffset],
      mergePaints(paint, internalPaintOverridingEnabled),
    );
  }

  @override
  Rect computeFeatureRect() {
    throw UnsupportedError("Rect computation for Point feature unavailable");
  }
}
