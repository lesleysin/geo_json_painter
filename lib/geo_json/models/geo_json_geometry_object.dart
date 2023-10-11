import 'dart:ui';

import 'drawable.dart';
import 'geo_json_object.dart';
import 'paint_props.dart';

///An abstract class used to combine inherited
///properties of the [GeoJsonObject] object and the [Drawable] interface
abstract class GeoJsonGeometryObject extends GeoJsonObject implements Drawable {
  final PaintProperties paintProperties;

  GeoJsonGeometryObject({required super.type, required this.paintProperties});

  Paint mergePaints(
    Paint? paint,
    bool internalPaintOverridingEnabled,
  ) {
    Paint? resultPaint;

    if (paint != null) {
      resultPaint = paint;
    } else {
      resultPaint = Paint();
    }

    if (internalPaintOverridingEnabled) {
      resultPaint.blendMode =
          paintProperties.blendMode ?? resultPaint.blendMode;
      resultPaint.color = paintProperties.color ?? resultPaint.color;
      resultPaint.strokeWidth =
          paintProperties.strokeWidth ?? resultPaint.strokeWidth;
      resultPaint.isAntiAlias =
          paintProperties.isAntiAlias ?? resultPaint.isAntiAlias;
      resultPaint.invertColors =
          paintProperties.invertColors ?? resultPaint.invertColors;
    }

    return resultPaint;
  }
}
