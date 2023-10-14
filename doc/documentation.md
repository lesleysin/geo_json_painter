## Available geometry features

- Geometry collection
- Point
- MultiPoint
- LineString
- MultiLineString
- Polygon
- MultiPolygon

## GeoJson "properties" object

GeoJson feature object may contain some foreign members. According to the naming convention
we use "properties" object key to pass custom options to feature instance.

This library provides the ability to parse a limited list of
values hat will be passed to a Paint object for drawing on the canvas.

List of properties:

```dart
  final Color? color; //HEX string, List<int> with 4 or 3 length, List<double> with 4 or 3 length
final double? strokeWidth;
final BlendMode? blendMode; //String or index of BlendMode enum value
final bool? isAntiAlias;
final bool? invertColors;
```

Other passed properties will be ignored during rendering and processing.

## Overriding rules

The library provides several ways to change the default appearance of primitives.

- Passing a "properties" object with set parameters
- Paint object override method (applies to all objects of the selected primitive)

```dart
//Paint class overriding
void addPainterOverriding(GeoJsonFeatureType type, Paint paint);
```

- Overriding the entire drawing method. You independently implement methods for processing
  coordinates and rendering on the canvas of the selected primitive.

```dart
//Draw method overriding
void addDrawMethodOverriding(GeoJsonFeatureType type, DrawFunction fn);
```

All overriding methods have a rule according to which they are applied to primitives.
The following is a list in descending order of priority:

1. Drawing method have highest priority. Ignore paint override and passed properties;
2. Paint override. Override Paint object for all primitives of the given type. You can set
   GeoJsonCustomPainter *internalPaintOverridingEnabled* property to false to disable overriding
   with passed properties.
3. Properties. Passed properties apply only to the object to which they were attached. Have the
   lowest priority.

## Render hooks

GeoJsonCustomPainter has two hook callbacks who will be called on pre-render stage and after feature
rendering.

```dart
typedef BeforeRenderHookCallback = void Function(GeoJsonGeometryObject, Rect?);
typedef AfterRenderHookCallback = void Function(GeoJsonGeometryObject);
```

BeforeRenderHookCallback will be called after Paint instances merging anf before canvas drawing
method call.
AfterRenderHookCallback will be called after canvas drawing method call.

In addition to a reference to a GeoJsonGeometryObject, does the BeforeRenderHookCallback contain a
reference to an object of type Rect?.
Thanks to this, you can assign custom shaders (gradients or shaders compiled from FragmentProgramm)
to the shader property of the PaintProperties object (see example app);
