import 'dart:ui';

import 'geo_json_coordinate_pair_list.dart';
import 'geo_json_geometry_object.dart';

class GeoJsonLineStrings extends GeoJsonGeometryObject {
  final GeoJsonCoordinatePairList coordinates;

  GeoJsonLineStrings({
    required super.type,
    required this.coordinates,
  });

  @override
  void drawOnCanvas(Canvas canvas) {
    final List<Offset> points = [];
    for (var pair in coordinates) {
      points.add(
        Offset(pair[1], pair[0]),
      );
    }
    canvas.drawPoints(
      PointMode.polygon,
      points,
      Paint(),
    );
  }
}
