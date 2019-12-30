import 'dart:async';

import 'package:flutter_smart_home_app/configs/themes.dart';

// import 'package:playground_flutter/configs/themes.dart';

class ThemeBloc {
  final StreamController<Themes> _themeController = StreamController<Themes>();
  get changeTheme => _themeController.sink.add;
  get themeEnabled => _themeController.stream;
}

final themeBloc = ThemeBloc();
