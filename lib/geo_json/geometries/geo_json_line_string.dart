import 'dart:ui';

import 'package:geo_json_painter/geo_json/models/index.dart';

class GeoJsonLineString extends GeoJsonGeometryObject {
  final GeoJsonCoordinatePairList coordinates;
  final Path _path = Path();

  GeoJsonLineString({
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
    for (var i = 0; i < coordinates.length; i++) {
      final pair = coordinates[i];

      if (i == 0) {
        _path.moveTo(pair[1], pair[0]);
      } else {
        _path.lineTo(pair[1], pair[0]);
      }
    }

    final rect = _path.getBounds();

    callback?.call(this, rect);

    final resultingPaint = mergePaints(paint, internalPaintOverridingEnabled);

    canvas.drawPath(_path, resultingPaint);
  }

  @override
  Rect computeFeatureRect() {
    for (var i = 0; i < coordinates.length; i++) {
      final pair = coordinates[i];

      if (i == 0) {
        _path.moveTo(pair[1], pair[0]);
      } else {
        _path.lineTo(pair[1], pair[0]);
      }
    }

    final rect = _path.getBounds();

    return rect;
  }
}
