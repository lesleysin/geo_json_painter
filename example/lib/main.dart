import 'package:flutter/material.dart';
import 'package:geo_json_painter/geo_json_painter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final json = GeoJson()
      //Only paint override example
      ..addPainterOverriding(
        GeoJsonFeatureType.LineString,
        Paint()
          ..strokeWidth = 3.0
          ..color = Colors.red,
      )
      // Override draw method example
      ..addDrawMethodOverriding(GeoJsonFeatureType.Point, (canvas, feature) {
        //Cast geometry object to concrete type for get access to feature coordinates object
        final point = feature.geometry as GeoJsonPoint;

        //draw feature on canvas
        canvas.drawRect(
            Rect.fromCenter(
                center: Offset(point.coordinates[1], point.coordinates[0]),
                width: 10,
                height: 25),
            Paint()
              ..color = Colors.green
              ..strokeWidth = 2);
      })
      //parse geojson file
      ..parseGeoJson({
        "type": "FeatureCollection",
        "features": [
          {
            "type": "Feature",
            "geometry": {
              "type": "Point",
              "coordinates": [50.0, 50.0]
            },
          },
          {
            "type": "Feature",
            "geometry": {
              "type": "Point",
              "coordinates": [75.0, 75.0]
            },
            "properties": {"prop0": "value0"}
          },
          {
            "type": "Feature",
            "geometry": {
              "type": "Point",
              "coordinates": [50.0, 100.0]
            },
            "properties": {"prop0": "value0"}
          },
          {
            "type": "Feature",
            "geometry": {
              "type": "Point",
              "coordinates": [150.0, 50.0]
            },
            "properties": {"prop0": "value0"}
          },
          {
            "type": "Feature",
            "geometry": {
              "type": "MultiPoint",
              "coordinates": [
                [10.0, 100.0],
                [10.0, 150.0]
              ]
            },
            "properties": {"prop0": "value0"}
          },
          {
            "type": "Feature",
            "geometry": {
              "type": "LineString",
              "coordinates": [
                [10.0, 100.0],
                [200.0, 150.0]
              ]
            },
            "properties": {"prop0": "value0"}
          },
          {
            "type": "Feature",
            "geometry": {
              "type": "Polygon",
              "coordinates": [
                [
                  [100.0, 10.0],
                  [150.0, 10.0],
                  [150.0, 60.0],
                  [100.0, 60.0],
                  [100.0, 10.0]
                ]
              ]
            },
            "properties": {"prop0": "value0"}
          },
          {
            "type": "Feature",
            "geometry": {
              "type": "MultiLineString",
              "coordinates": [
                [
                  [100.0, 100.0],
                  [200.0, 200.0]
                ],
                [
                  [300.0, 100.0],
                  [400.0, 100.0],
                  [400.0, 300.0],
                ],
                [
                  [50.0, 300.0],
                  [10.0, 200.0]
                ],
              ]
            },
            "properties": {"strokeWidth": 15.0, "color": "#EFCC3F"}
          },
        ]
      });

    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: CustomPaint(
            size: Size(
              MediaQuery.of(context).size.width,
              MediaQuery.of(context).size.height,
            ),
            painter: GeoJsonCustomPainter(
              geoJson: json,
              internalPaintOverridingEnabled: false, //true by default
            ),
          ),
        ),
      ),
    );
  }
}
