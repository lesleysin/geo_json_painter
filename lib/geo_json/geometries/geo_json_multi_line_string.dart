import 'dart:ui';

import 'package:geo_json_painter/geo_json/models/index.dart';

class GeoJsonMultiLineString extends GeoJsonGeometryObject {
  final List<GeoJsonCoordinatePairList> coordinates;

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
    for (var line in coordinates) {
      final List<Offset> points = [];
      for (var pair in line) {
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

  @override
  Rect computeFeatureRect() {
    // TODO: implement computeRectSelf
    throw UnimplementedError();
  }
}
