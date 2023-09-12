# geo_json_painter
Library for parsing the GeoJson format based on the [RCF 7946](https://datatracker.ietf.org/doc/html/rfc7946) specification and displaying GeoJson on canvas.  
All the main features described in the RCF 7946 specification have been implemented.

## Getting started

The library provides two main entities that allow you to perform GeoJson rendering and processing tasks:
- GeoJson - сlass for parsing and configuring painter operation
- GeoJsonCustomPainter - class that controls rendering GeoJson data in accordance with a given configuration

Also, thanks to the GeoJson class, you can, if necessary, override both the Paint class for each individual GeoJson feature, and the entire drawing method using built-in methods:

```dart
//Draw method overriding
void addDrawMethodOverriding(GeoJsonFeatureType type, DrawFunction fn);

//Paint class overriding
void addPainterOverriding(GeoJsonFeatureType type, Paint paint)
```

This can be useful when you want to replace the default implementation with your own. For example, to replace the point drawn by the Point feature with an svg image.
To get started, you can check out the code snippets below:

### GeoJson parsing, paint and draw method overriding

```dart
final json = GeoJson()
      ..addPainterOverriding(
        GeoJsonFeatureType.Point,
        Paint()
          ..color = Colors.green
          ..strokeWidth = 10,
      )
      ..addDrawMethodOverriding(GeoJsonFeatureType.Point, (canvas, feature) {
        final point = feature.geometry as GeoJsonPoint;
        canvas.drawRect(
            Rect.fromCenter(
                center: Offset(point.coordinates[1], point.coordinates[0]),
                width: 10,
                height: 25),
            Paint()
              ..color = Colors.green
              ..strokeWidth = 10);
      })
      ..parseGeoJson({
        "type": "FeatureCollection",
        "features": [
          {
            "type": "Feature",
            "id": "1",
            "properties": {
              "prop0": "val0",
            },
            "geometry": {
              "type": "Polygon",
              "coordinates": [
                [
                  [33.531650, 746.086982],
                  [467.606602, 746.086982],
                  [467.606602, 1160.930231],
                  [33.531650, 1160.930231],
                  [33.531650, 746.086982]
                ]
              ]
            }
          },
          {
            "type": "Feature",
            "id": "2",
            "properties": {
              "prop0": "val0",
            },
            "geometry": {
              "type": "Point",
              "coordinates":  [100.531650, 100.086982],
            }
          },
        ],
      });
```

### Example of using a widget

```dart
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ColoredBox(
        color: Colors.white54,
        child: InteractiveViewer(
          child: CustomPaint(
            size: Size(
              MediaQuery.of(context).size.width,
              MediaQuery.of(context).size.height,
            ),
            painter: GeoJsonCustomPainter(
              geoJson: json, //GeoJson instance
            ),
          ),
        ),
      ),
    );
  }
```
