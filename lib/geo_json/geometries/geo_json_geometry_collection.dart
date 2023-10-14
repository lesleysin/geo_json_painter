import 'dart:ui';

import 'package:geo_json_painter/geo_json/models/index.dart';

class GeoJsonGeometryCollection extends GeoJsonGeometryObject {
  List<GeoJsonGeometryObject> geometries;

  GeoJsonGeometryCollection({
    required super.type,
    required this.geometries,
    required super.paintProperties,
  });

  @override
  void drawOnCanvas(
    Canvas canvas,
    Paint? paint,
    bool internalPaintOverridingEnabled,
    BeforeRenderHookCallback? callback,
  ) {
    throw UnsupportedError("Collection could not be rendered");
  }

  @override
  Rect computeFeatureRect() {
    throw UnsupportedError("Collection could not be rendered");
  }
}
