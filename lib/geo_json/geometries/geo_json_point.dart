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
    final rect = Rect.fromCenter(
      center: Offset(
        coordinates[1],
        coordinates[0],
      ),
      width: paint?.strokeWidth ?? 1.0,
      height: paint?.strokeWidth ?? 1.0,
    );

    callback?.call(this, rect);

    final mergedPaint = mergePaints(paint, internalPaintOverridingEnabled);
    canvas.drawRect(
      rect,
      mergedPaint,
    );
  }

  @override
  Rect computeFeatureRect() {
    final rect = Rect.fromCenter(
      center: Offset(
        coordinates[1],
        coordinates[0],
      ),
      width: 1.0,
      height: 1.0,
    );

    return rect;
  }
}
