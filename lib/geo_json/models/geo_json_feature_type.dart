///Listing the set of available features in the
///GeoJson RCF 7946 standard
enum GeoJsonFeatureType {
  ///Unknown type
  ///Throws an exception when json parse
  unknown,

  //Geometry features

  ///Point feature related with [GeoJsonPoint] implementation
  ///
  ///Doc: https://datatracker.ietf.org/doc/html/rfc7946#section-3.1.2
  point,

  ///MultiPoint feature related with [GeoJsonMultiPoint] implementation
  ///
  ///Doc: https://datatracker.ietf.org/doc/html/rfc7946#section-3.1.3
  multiPoint,

  ///LineString feature related with [GeoJsonLineStrings] implementation
  ///
  ///Doc: https://datatracker.ietf.org/doc/html/rfc7946#section-3.1.4
  lineString,

  ///MultiLineString feature related with [GeoJsonMultiLineString] implementation
  ///
  ///Doc: https://datatracker.ietf.org/doc/html/rfc7946#section-3.1.5
  multiLineString,

  ///Polygon feature related with [GeoJsonPolygon] implementation
  ///
  ///Doc: https://datatracker.ietf.org/doc/html/rfc7946#section-3.1.6
  polygon,

  ///MultiPolygon feature related with [GeoJsonMultiPolygon] implementation
  ///
  ///Doc: https://datatracker.ietf.org/doc/html/rfc7946#section-3.1.7
  multiPolygon,

  ///GeometryCollection feature related with [GeoJsonGeometryCollection] implementation
  ///
  ///Doc: https://datatracker.ietf.org/doc/html/rfc7946#section-3.1.8
  geometryCollection,
  //Top-level features

  ///Feature feature related with [GeoJsonFeature] implementation
  ///
  ///Doc: https://datatracker.ietf.org/doc/html/rfc7946#section-3.2
  feature,

  ///FeatureCollection feature related with [GeoJsonFeatureCollection] implementation
  ///
  ///Doc: https://datatracker.ietf.org/doc/html/rfc7946#section-3.3
  featureCollection,
}

///Inferring feature type based on string
GeoJsonFeatureType geoJsonFeatureTypeFromString(String? str) {
  if (str == null || str.isEmpty) {
    throw ArgumentError("Type is null or empty");
  }

  switch (str) {
    case "Point":
      {
        return GeoJsonFeatureType.point;
      }
    case "MultiPoint":
      {
        return GeoJsonFeatureType.multiPoint;
      }
    case "LineString":
      {
        return GeoJsonFeatureType.lineString;
      }
    case "MultiLineString":
      {
        return GeoJsonFeatureType.multiLineString;
      }
    case "Polygon":
      {
        return GeoJsonFeatureType.polygon;
      }
    case "MultiPolygon":
      {
        return GeoJsonFeatureType.multiPolygon;
      }
    case "GeometryCollection":
      {
        return GeoJsonFeatureType.geometryCollection;
      }
    case "FeatureCollection":
      {
        return GeoJsonFeatureType.featureCollection;
      }
    case "Feature":
      {
        return GeoJsonFeatureType.feature;
      }
    default:
      return GeoJsonFeatureType.unknown;
  }
}
