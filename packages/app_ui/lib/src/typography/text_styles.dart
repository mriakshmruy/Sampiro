import 'package:app_ui/src/colors.dart';
import 'package:app_ui/src/typography/typography.dart';
import 'package:flutter/widgets.dart';

/// Sampiro Text Style Definitions
class SampiroTextStyle {
  static const _baseTextStyle = TextStyle(
    package: 'app_ui',
    fontFamily: 'Raleway',
    color: SampiroColors.black,
    fontWeight: SampiroFontWeight.regular,
  );

  /// Headline 1 Text Style
  static TextStyle get displayLarge {
    return _baseTextStyle.copyWith(
      fontSize: 50,
      fontWeight: SampiroFontWeight.semiBold,
      color: SampiroColors.white,
    );
  }

  /// Headline 2 Text Style
  static TextStyle get displayMedium {
    return _baseTextStyle.copyWith(
      fontSize: 22, // OK
      fontWeight: SampiroFontWeight.semiBold,
      color: SampiroColors.white,
    );
  }

  /// Headline 3 Text Style
  static TextStyle get displaySmall {
    return _baseTextStyle.copyWith(
      fontSize: 20,
      fontWeight: SampiroFontWeight.semiBold,
      color: SampiroColors.white,
    );
  }

  /// Headline 4 Text Style
  static TextStyle get headlineMedium {
    return _baseTextStyle.copyWith(
      fontSize: 22.5,
      fontWeight: SampiroFontWeight.regular,
      color: SampiroColors.white,
    );
  }

  /// Headline 5 Text Style
  static TextStyle get headlineSmall {
    return _baseTextStyle.copyWith(
      fontSize: 18,
      fontWeight: SampiroFontWeight.medium,
      color: SampiroColors.primary,
    );
  }

  /// Headline 6 Text Style
  static TextStyle get titleLarge {
    return _baseTextStyle.copyWith(
      fontSize: 12.5,
      fontWeight: SampiroFontWeight.regular,
      color: SampiroColors.white,
    );
  }

  /// Subtitle 1 Text Style
  static TextStyle get titleMedium {
    return _baseTextStyle.copyWith(
      fontSize: 18, // OK
      fontWeight: SampiroFontWeight.bold,
      color: SampiroColors.white,
    );
  }

  /// Subtitle 2 Text Style
  static TextStyle get titleSmall {
    return _baseTextStyle.copyWith(
      fontSize: 15,
      fontWeight: SampiroFontWeight.semiBold,
      color: SampiroColors.black,
    );
  }

  /// Body Text 1 Text Style
  static TextStyle get bodyLarge {
    return _baseTextStyle.copyWith(
      fontSize: 18,
      fontWeight: SampiroFontWeight.medium,
      color: SampiroColors.black,
    );
  }

  /// Body Text 2 Text Style (the default)
  static TextStyle get bodyMedium {
    return _baseTextStyle.copyWith(
      fontSize: 16, // OK
      fontWeight: SampiroFontWeight.regular,
      color: SampiroColors.black,
    );
  }

  /// Caption Text Style
  static TextStyle get bodySmall {
    return _baseTextStyle.copyWith(
      fontSize: 14, // OK
      fontWeight: SampiroFontWeight.medium,
      color: SampiroColors.white,
    );
  }

  /// Overline Text Style
  static TextStyle get labelSmall {
    return _baseTextStyle.copyWith(
      fontSize: 12, // Ok
      fontWeight: SampiroFontWeight.regular,
      color: SampiroColors.white,
    );
  }

  /// Button Text Style
  static TextStyle get labelLarge {
    return _baseTextStyle.copyWith(
      fontSize: 20, // OK
      fontWeight: SampiroFontWeight.semiBold,
    );
  }
}
