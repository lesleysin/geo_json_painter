///Listing the set of available features in the
///GeoJson RCF 7946 standard
enum GeoJsonFeatureType {
  ///Unknown type
  ///Throws an exception when json parse
  Unknown,

  //Geometry features

  ///Point feature related with [GeoJsonPoint] implementation
  ///
  ///Doc: https://datatracker.ietf.org/doc/html/rfc7946#section-3.1.2
  Point,

  ///MultiPoint feature related with [GeoJsonMultiPoint] implementation
  ///
  ///Doc: https://datatracker.ietf.org/doc/html/rfc7946#section-3.1.3
  MultiPoint,

  ///LineString feature related with [GeoJsonLineStrings] implementation
  ///
  ///Doc: https://datatracker.ietf.org/doc/html/rfc7946#section-3.1.4
  LineString,

  ///MultiLineString feature related with [GeoJsonMultiLineString] implementation
  ///
  ///Doc: https://datatracker.ietf.org/doc/html/rfc7946#section-3.1.5
  MultiLineString,

  ///Polygon feature related with [GeoJsonPolygon] implementation
  ///
  ///Doc: https://datatracker.ietf.org/doc/html/rfc7946#section-3.1.6
  Polygon,

  ///MultiPolygon feature related with [GeoJsonMultiPolygon] implementation
  ///
  ///Doc: https://datatracker.ietf.org/doc/html/rfc7946#section-3.1.7
  MultiPolygon,

  ///GeometryCollection feature related with [GeoJsonGeometryCollection] implementation
  ///
  ///Doc: https://datatracker.ietf.org/doc/html/rfc7946#section-3.1.8
  GeometryCollection,
  //Top-level features

  ///Feature feature related with [GeoJsonFeature] implementation
  ///
  ///Doc: https://datatracker.ietf.org/doc/html/rfc7946#section-3.2
  Feature,

  ///FeatureCollection feature related with [GeoJsonFeatureCollection] implementation
  ///
  ///Doc: https://datatracker.ietf.org/doc/html/rfc7946#section-3.3
  FeatureCollection,
}

///Inferring feature type based on string
GeoJsonFeatureType geoJsonFeatureTypeFromString(String? str) {
  if (str == null || str.isEmpty) {
    throw ArgumentError("Type is null or empty");
  }

  switch (str) {
    case "Point":
      {
        return GeoJsonFeatureType.Point;
      }
    case "MultiPoint":
      {
        return GeoJsonFeatureType.MultiPoint;
      }
    case "LineString":
      {
        return GeoJsonFeatureType.LineString;
      }
    case "MultiLineString":
      {
        return GeoJsonFeatureType.MultiLineString;
      }
    case "Polygon":
      {
        return GeoJsonFeatureType.Polygon;
      }
    case "MultiPolygon":
      {
        return GeoJsonFeatureType.MultiPolygon;
      }
    case "GeometryCollection":
      {
        return GeoJsonFeatureType.GeometryCollection;
      }
    case "FeatureCollection":
      {
        return GeoJsonFeatureType.FeatureCollection;
      }
    case "Feature":
      {
        return GeoJsonFeatureType.Feature;
      }
    default:
      return GeoJsonFeatureType.Unknown;
  }
}
