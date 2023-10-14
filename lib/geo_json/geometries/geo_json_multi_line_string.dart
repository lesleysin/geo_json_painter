import 'dart:ui';

import 'package:geo_json_painter/geo_json/models/index.dart';

class GeoJsonMultiLineString extends GeoJsonGeometryObject {
  final List<GeoJsonCoordinatePairList> coordinates;
  final Path _path = Path();

  GeoJsonMultiLineString({
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
    final rect = computeFeatureRect();

    callback?.call(this, rect);

    final resultingPaint = mergePaints(paint, internalPaintOverridingEnabled);

    canvas.drawPath(_path, resultingPaint);
  }

  @override
  Rect computeFeatureRect() {
    // TODO: implement computeRectSelf
    for (var line in coordinates) {
      for (var i = 0; i < line.length; i++) {
        final pair = line[i];

        if (i == 0) {
          _path.moveTo(pair[1], pair[0]);
        } else {
          _path.lineTo(pair[1], pair[0]);
        }
      }
    }

    return _path.getBounds();
  }
}
