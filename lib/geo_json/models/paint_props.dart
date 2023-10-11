import 'package:flutter/material.dart';

///A class that describes the basic properties of the [Paint] class,
///which can be passed to the "properties" field
///of the [GeoJsonFeature] and used to draw a specific feature
class PaintProperties {
  final Color? color;
  final double? strokeWidth;
  final BlendMode? blendMode;
  final bool? isAntiAlias;
  final bool? invertColors;

  PaintProperties({
    required this.strokeWidth,
    required this.color,
    required this.blendMode,
    required this.isAntiAlias,
    required this.invertColors,
  });

  ///The method is designed to interpret
  ///input color value into [Color] class instance
  static Color? _tryParseColor(dynamic color) {
    ///Parse HEX color string to Color instance
    if (color is String) {
      final isHexColor = color.startsWith("#");
      if (isHexColor) {
        final buffer = StringBuffer();
        if (color.length == 6 || color.length == 7) buffer.write('ff');
        buffer.write(color.replaceFirst('#', ''));
        return Color(int.parse(buffer.toString(), radix: 16));
      } else {
        throw ArgumentError("Color must be valid HEX string");
      }
    }

    ///Parse array by fromARGB method to Color instance
    if (color is List<int>) {
      if (color.length == 4) {
        return Color.fromARGB(color[3], color[0], color[1], color[2]);
      } else if (color.length == 3) {
        ///If passed only r g b channels set alpha channel to 1.0 automatically
        return Color.fromARGB(1, color[0], color[1], color[2]);
      } else {
        throw ArgumentError(
            "Color must be valid list of integers with length 4 or 3");
      }
    }

    ///Parse array by fromRGBO method to Color instance
    if (color is List<double>) {
      if (color.length == 4) {
        return Color.fromRGBO(
          color[0].toInt(),
          color[1].toInt(),
          color[2].toInt(),
          color[3],
        );
      } else if (color.length == 3) {
        ///If passed only r g b channels set opacity to 1.0 automatically
        return Color.fromRGBO(
          color[0].toInt(),
          color[1].toInt(),
          color[2].toInt(),
          1.0,
        );
      } else {
        throw ArgumentError("Color must be valid list of double with length 4");
      }
    }

    return null;
  }

  static BlendMode? _tryParseBlendMode(dynamic mode) {
    if (mode is int) {
      final value = BlendMode.values.elementAtOrNull(mode);

      if (value != null) {
        return value;
      } else {
        throw ArgumentError(
            "BlendMode must be valid index of BlendMode.values list");
      }
    }

    if (mode is String) {
      BlendMode? result;
      const arr = BlendMode.values;
      for (var i = 0; i < arr.length; i++) {
        final blend = arr[i];
        if (blend.name == mode) {
          result = blend;
        }
      }

      if (result == null) {
        throw ArgumentError(
            "BlendMode must be valid string name of BlendMode enum element");
      } else {
        return result;
      }
    }

    return null;
  }

  factory PaintProperties.fromJson(Map<String, dynamic> json) {
    return PaintProperties(
      color: _tryParseColor(json['color']),
      strokeWidth: json['strokeWidth'],
      blendMode: _tryParseBlendMode(json['blendMode']),
      invertColors: json['invertColors'],
      isAntiAlias: json['isAntiAlias'],
    );
  }
}
