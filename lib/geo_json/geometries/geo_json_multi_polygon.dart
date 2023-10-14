import 'dart:ui';

import 'package:geo_json_painter/geo_json/models/index.dart';

typedef MultiPolygonCoordinates = List<List<GeoJsonCoordinatePairList>>;

class GeoJsonMultiPolygon extends GeoJsonGeometryObject {
  final MultiPolygonCoordinates coordinates;
  final Path _path = Path();

  GeoJsonMultiPolygon({
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
    for (var polygon in coordinates) {
      for (var line in polygon) {
        for (var i = 0; i < line.length; i++) {
          final pair = line[i];

          if (i == 0) {
            _path.moveTo(pair[1], pair[0]);
          } else {
            _path.lineTo(pair[1], pair[0]);
          }
        }
      }
    }

    final rect = _path.getBounds();

    return rect;
  }
}
