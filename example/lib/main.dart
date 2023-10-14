import 'package:flutter/material.dart';
import 'package:geo_json_painter/geo_json_painter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    final json = GeoJson()
      //Only paint override example
      ..addPainterOverriding(
        GeoJsonFeatureType.MultiLineString,
        Paint()
          ..strokeWidth = 3.0
          ..color = Colors.red,
      )
      // Override draw method example
      ..addDrawMethodOverriding(GeoJsonFeatureType.Point,
          (canvas, feature, paint) {
        //Cast geometry object to concrete type for get access to feature coordinates object
        final point = feature.geometry as GeoJsonPoint;

        //if you want to apply custom shader to primitive you must compute rect for this here
        final rect = Rect.fromCenter(
            center: Offset(point.coordinates[1], point.coordinates[0]),
            width: 25,
            height: 25);

        //draw feature on canvas
        canvas.drawRect(
          rect,
          Paint(),
        );
      })
      //parse geojson file
      ..parseGeoJson({
        "type": "FeatureCollection",
        "features": [
          {
            "type": "Feature",
            "geometry": {
              "type": "MultiPoint",
              "coordinates": [
                [10.0, 10.0],
                [20.0, 20.0],
                [30.0, 30.0]
              ]
            },
            "properties": {"strokeWidth": 10.0, "color": "#EFCC3F"}
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
                [500.0, 350.0],
                [500.0, 0.0]
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
                  [10.0, 10.0],
                  [100.0, 10.0],
                  [100.0, 100.0],
                  [10.0, 100.0],
                  [10.0, 10.0]
                ],
                [
                  [10.0, 10.0],
                  [100.0, 10.0],
                  [100.0, 100.0],
                  [10.0, 100.0],
                  [10.0, 10.0]
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
              internalPaintOverridingEnabled: true, //true by default
              beforeRender: (feature, rect) {
                if (feature.type == GeoJsonFeatureType.LineString) {
                  final line = feature as GeoJsonLineString;
                  line.paintProperties.strokeWidth = 25.0;
                  if (rect != null) {
                    line.paintProperties.shader = const LinearGradient(colors: [
                      Colors.red,
                      Colors.orange,
                      Colors.yellow,
                      Colors.green,
                      Colors.lightBlue,
                      Colors.blue,
                      Colors.purple,
                    ]).createShader(rect);
                  }
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}
