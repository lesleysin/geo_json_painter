import 'dart:ui';
import 'package:geo_json_painter/geo_json/default_paint.dart';

import 'geo_json_coordinate_pair_list.dart';
import 'geo_json_geometry_object.dart';

class GeoJsonMultiPoint extends GeoJsonGeometryObject {
  final GeoJsonCoordinatePairList coordinates;

  GeoJsonMultiPoint({
    required super.type,
    required this.coordinates,
  });

  @override
  void drawOnCanvas(Canvas canvas, Paint? paint) {
    final List<Offset> points = [];
    for (var pair in coordinates) {
      points.add(
        Offset(pair[1], pair[0]),
      );
    }
    canvas.drawPoints(
      PointMode.points,
      points,
      paint ?? defaultPaint,
    );
  }
}
