import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';

extension SampiroSizeSetter on WidgetTester {
  void setDisplaySize(Size size) {
    view
      ..devicePixelRatio = 1.0
      ..physicalSize = size;

    addTearDown(() {
      view.resetPhysicalSize();
    });
  }

  void setDesktopDisplaySize() {
    setDisplaySize(const Size(1921, 900));
  }

  void setTabletDisplaySize() {
    setDisplaySize(const Size(780, 900));
  }
}
