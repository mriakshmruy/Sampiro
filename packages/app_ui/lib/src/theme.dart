import 'package:app_ui/src/colors.dart';
import 'package:app_ui/src/typography/typography.dart';
import 'package:flutter/material.dart';

const _normalTextScaleFactor = 1;
const _largeTextScaleFactor = 1.20;

/// Namespace for the Sampiro [ThemeData].
class SampiroTheme {
  /// Standard `ThemeData` for Sampiro UI.
  static ThemeData get standard {
    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: SampiroColors.primary,
        primary: SampiroColors.primary,
        primaryContainer: SampiroColors.primaryContainer,
        secondary: SampiroColors.secondary,
        surface: SampiroColors.white,
        tertiary: SampiroColors.black,
        tertiaryContainer: SampiroColors.green,
        error: SampiroColors.red,
        shadow: SampiroColors.gray,
      ),
      appBarTheme: _appBarTheme,
      textTheme: _textTheme,
    );
  }

  /// `ThemeData` for Sampiro UI for small screens.
  static ThemeData get small {
    return standard.copyWith(textTheme: _smallTextTheme);
  }

  /// `ThemeData` for Sampiro UI for medium screens.
  static ThemeData get medium {
    return standard.copyWith(textTheme: _smallTextTheme);
  }

  /// `ThemeData` for Sampiro UI for large screens.
  static ThemeData get large {
    return standard.copyWith(textTheme: _largeTextTheme);
  }

  static TextTheme get _textTheme {
    return TextTheme(
      displayLarge: SampiroTextStyle.displayLarge,
      displayMedium: SampiroTextStyle.displayMedium,
      displaySmall: SampiroTextStyle.displaySmall,
      headlineMedium: SampiroTextStyle.headlineMedium,
      headlineSmall: SampiroTextStyle.headlineSmall,
      titleLarge: SampiroTextStyle.titleLarge,
      titleMedium: SampiroTextStyle.titleMedium,
      titleSmall: SampiroTextStyle.titleSmall,
      bodyLarge: SampiroTextStyle.bodyLarge,
      bodyMedium: SampiroTextStyle.bodyMedium,
      bodySmall: SampiroTextStyle.bodySmall,
      labelSmall: SampiroTextStyle.labelSmall,
      labelLarge: SampiroTextStyle.labelLarge,
    );
  }

  static TextTheme get _smallTextTheme {
    return TextTheme(
      displayLarge: SampiroTextStyle.displayLarge.copyWith(
        fontSize: _textTheme.displayLarge!.fontSize! * _normalTextScaleFactor,
      ),
      displayMedium: SampiroTextStyle.displayMedium.copyWith(
        fontSize: _textTheme.displayMedium!.fontSize! * _normalTextScaleFactor,
      ),
      displaySmall: SampiroTextStyle.displaySmall.copyWith(
        fontSize: _textTheme.displaySmall!.fontSize! * _normalTextScaleFactor,
      ),
      headlineMedium: SampiroTextStyle.headlineMedium.copyWith(
        fontSize: _textTheme.headlineMedium!.fontSize! * _normalTextScaleFactor,
      ),
      headlineSmall: SampiroTextStyle.headlineSmall.copyWith(
        fontSize: _textTheme.headlineSmall!.fontSize! * _normalTextScaleFactor,
      ),
      titleLarge: SampiroTextStyle.titleLarge.copyWith(
        fontSize: _textTheme.titleLarge!.fontSize! * _normalTextScaleFactor,
      ),
      titleMedium: SampiroTextStyle.titleMedium.copyWith(
        fontSize: _textTheme.titleMedium!.fontSize! * _normalTextScaleFactor,
      ),
      titleSmall: SampiroTextStyle.titleSmall.copyWith(
        fontSize: _textTheme.titleSmall!.fontSize! * _normalTextScaleFactor,
      ),
      bodyLarge: SampiroTextStyle.bodyLarge.copyWith(
        fontSize: _textTheme.bodyLarge!.fontSize! * _normalTextScaleFactor,
      ),
      bodyMedium: SampiroTextStyle.bodyMedium.copyWith(
        fontSize: _textTheme.bodyMedium!.fontSize! * _normalTextScaleFactor,
      ),
      bodySmall: SampiroTextStyle.bodySmall.copyWith(
        fontSize: _textTheme.bodySmall!.fontSize! * _normalTextScaleFactor,
      ),
      labelSmall: SampiroTextStyle.labelSmall.copyWith(
        fontSize: _textTheme.labelSmall!.fontSize! * _normalTextScaleFactor,
      ),
      labelLarge: SampiroTextStyle.labelLarge.copyWith(
        fontSize: _textTheme.labelLarge!.fontSize! * _normalTextScaleFactor,
      ),
    );
  }

  static TextTheme get _largeTextTheme {
    return TextTheme(
      displayLarge: SampiroTextStyle.displayLarge.copyWith(
        fontSize: _textTheme.displayLarge!.fontSize! * _largeTextScaleFactor,
      ),
      displayMedium: SampiroTextStyle.displayMedium.copyWith(
        fontSize: _textTheme.displayMedium!.fontSize! * _largeTextScaleFactor,
      ),
      displaySmall: SampiroTextStyle.displaySmall.copyWith(
        fontSize: _textTheme.displaySmall!.fontSize! * _largeTextScaleFactor,
      ),
      headlineMedium: SampiroTextStyle.headlineMedium.copyWith(
        fontSize: _textTheme.headlineMedium!.fontSize! * _largeTextScaleFactor,
      ),
      headlineSmall: SampiroTextStyle.headlineSmall.copyWith(
        fontSize: _textTheme.headlineSmall!.fontSize! * _largeTextScaleFactor,
      ),
      titleLarge: SampiroTextStyle.titleLarge.copyWith(
        fontSize: _textTheme.titleLarge!.fontSize! * _largeTextScaleFactor,
      ),
      titleMedium: SampiroTextStyle.titleMedium.copyWith(
        fontSize: _textTheme.titleMedium!.fontSize! * _largeTextScaleFactor,
      ),
      titleSmall: SampiroTextStyle.titleSmall.copyWith(
        fontSize: _textTheme.titleSmall!.fontSize! * _largeTextScaleFactor,
      ),
      bodyLarge: SampiroTextStyle.bodyLarge.copyWith(
        fontSize: _textTheme.bodyLarge!.fontSize! * _largeTextScaleFactor,
      ),
      bodyMedium: SampiroTextStyle.bodyMedium.copyWith(
        fontSize: _textTheme.bodyMedium!.fontSize! * _largeTextScaleFactor,
      ),
      bodySmall: SampiroTextStyle.bodySmall.copyWith(
        fontSize: _textTheme.bodySmall!.fontSize! * _largeTextScaleFactor,
      ),
      labelSmall: SampiroTextStyle.labelSmall.copyWith(
        fontSize: _textTheme.labelSmall!.fontSize! * _largeTextScaleFactor,
      ),
      labelLarge: SampiroTextStyle.labelLarge.copyWith(
        fontSize: _textTheme.labelLarge!.fontSize! * _largeTextScaleFactor,
      ),
    );
  }

  static AppBarTheme get _appBarTheme {
    return const AppBarTheme(
      scrolledUnderElevation: 0,
      backgroundColor: SampiroColors.primary,
      iconTheme: IconThemeData(color: SampiroColors.white),
    );
  }
}
