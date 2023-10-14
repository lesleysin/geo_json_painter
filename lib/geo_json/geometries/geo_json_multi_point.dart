import 'dart:ui';

import 'package:geo_json_painter/geo_json/models/index.dart';

class GeoJsonMultiPoint extends GeoJsonGeometryObject {
  final GeoJsonCoordinatePairList coordinates;

  GeoJsonMultiPoint({
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
    final List<Offset> points = [];
    for (var pair in coordinates) {
      points.add(
        Offset(pair[1], pair[0]),
      );
    }
    canvas.drawPoints(
      PointMode.points,
      points,
      mergePaints(paint, internalPaintOverridingEnabled),
    );
  }

  @override
  Rect computeFeatureRect() {
    // TODO: implement computeRectSelf
    throw UnimplementedError();
  }
}
