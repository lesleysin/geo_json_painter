import 'dart:ui';

import 'index.dart';

typedef BeforeRenderHookCallback = void Function(GeoJsonGeometryObject, Rect?);
typedef AfterRenderHookCallback = void Function(GeoJsonGeometryObject);
