import 'package:flutter_multi_formatter/flutter_multi_formatter.dart';

final monthDateYearFormatter = MaskedInputFormatter(
  '##/##/####',
  allowedCharMatcher: RegExp('[0-9]'),
);

final mobileNoFormatter = MaskedInputFormatter(
  '##-###-####',
  allowedCharMatcher: RegExp('[0-9]'),
);
