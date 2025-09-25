import 'package:flutter/widgets.dart';

abstract class SampiroKeys {
  // Counseling Page
  static const ValueKey<String> dialogKey = ValueKey('counseling_dialog_key');

  static const ValueKey<String> requestDialogKey = ValueKey('request_dialog_key');

  static const ValueKey<String> counselingNameKey = ValueKey('counselingNameKey');

  static const ValueKey<String> counselingMobileNoKey = ValueKey('counselingMobileNoKey');

  static const ValueKey<String> counselingAddressKey = ValueKey('counselingAddressKey');

  static const ValueKey<String> typeOfCounselingKey = ValueKey('typeOfCounselingKey');

  static const ValueKey<String> preferredCounselingDateKey = ValueKey('preferredCounselingDateKey');

  static const ValueKey<String> preferredCounselingTimeKey = ValueKey('preferredCounselingTimeKey');

  static const ValueKey<String> requestCounselingKey = ValueKey('requestCounselingKey');

  //Reflection Page

  static const ValueKey<String> dailyReflectionKey = ValueKey('dailyReflectionKey');
  static const ValueKey<String> dailyReflectionErrorKey = ValueKey('dailyReflectionErrorKey');
}
