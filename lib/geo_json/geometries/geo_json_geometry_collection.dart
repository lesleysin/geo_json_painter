import 'dart:ui';

import 'package:geo_json_painter/geo_json/models/index.dart';

class GeoJsonGeometryCollection extends GeoJsonGeometryObject {
  List<GeoJsonGeometryObject> geometries;

  GeoJsonGeometryCollection({
    required super.type,
    required this.geometries,
  });

  @override
  void drawOnCanvas(
    Canvas canvas,
    Paint? paint,
  ) {
    throw UnsupportedError("Collection could not be rendered");
  }
}
