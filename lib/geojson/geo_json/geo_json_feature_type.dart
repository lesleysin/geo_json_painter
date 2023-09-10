enum GeoJsonFeatureType {
  Unknown,
  //
  Point,
  MultiPoint,
  LineString,
  MultiLineString,
  Polygon,
  MultiPolygon,
  GeometryCollection,
  //
  Feature,
  FeatureCollection,
}

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
