import 'dart:ui';

import 'package:geo_json_painter/geo_json/feature/geo_json_feature.dart';

import 'callbacks.dart';

///Interface for interaction of a feature object with a consumer (CustomPainter)
abstract class Drawable {
  ///The method accepts a link to the [Canvas] as parameters
  ///as well as an additional parameter of type [Paint]
  ///
  /// Must be descendant classes and perform the function of
  ///drawing the corresponding element on the canvas
  void drawOnCanvas(
    Canvas canvas,
    Paint? paint,
    bool internalPaintOverridingEnabled,
    BeforeRenderHookCallback? beforeRenderCallback,
  );

  Rect computeFeatureRect();
}

typedef DrawFunction = void Function(
  Canvas canvas,
  GeoJsonFeature feature,
  Paint? paint,
);
