// dart format off
// coverage:ignore-file
import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'gen/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en')
  ];

  /// No description provided for @services.
  ///
  /// In en, this message translates to:
  /// **'Services'**
  String get services;

  /// No description provided for @updates.
  ///
  /// In en, this message translates to:
  /// **'Updates'**
  String get updates;

  /// No description provided for @more.
  ///
  /// In en, this message translates to:
  /// **'More'**
  String get more;

  /// No description provided for @home.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get home;

  /// No description provided for @goToPrayers.
  ///
  /// In en, this message translates to:
  /// **'Go to prayers'**
  String get goToPrayers;

  /// No description provided for @prayers.
  ///
  /// In en, this message translates to:
  /// **'Prayers'**
  String get prayers;

  /// No description provided for @name.
  ///
  /// In en, this message translates to:
  /// **'Name'**
  String get name;

  /// No description provided for @name1.
  ///
  /// In en, this message translates to:
  /// **'Name:*'**
  String get name1;

  /// No description provided for @cairo.
  ///
  /// In en, this message translates to:
  /// **'Cairo'**
  String get cairo;

  /// No description provided for @stsPeterAndPaulParish.
  ///
  /// In en, this message translates to:
  /// **'Sts. Peter and Paul Parish'**
  String get stsPeterAndPaulParish;

  /// No description provided for @dashboard.
  ///
  /// In en, this message translates to:
  /// **'Dashboard'**
  String get dashboard;

  /// No description provided for @goToHome.
  ///
  /// In en, this message translates to:
  /// **'Go to Home'**
  String get goToHome;

  /// No description provided for @testimonials.
  ///
  /// In en, this message translates to:
  /// **'Testimonials'**
  String get testimonials;

  /// No description provided for @dailyReflection.
  ///
  /// In en, this message translates to:
  /// **'Daily Reflection'**
  String get dailyReflection;

  /// No description provided for @videos.
  ///
  /// In en, this message translates to:
  /// **'Videos'**
  String get videos;

  /// No description provided for @baptismalCertificate.
  ///
  /// In en, this message translates to:
  /// **'Baptismal Certificate'**
  String get baptismalCertificate;

  /// No description provided for @baptismalCertificateRequest.
  ///
  /// In en, this message translates to:
  /// **'Baptismal Certificate Request'**
  String get baptismalCertificateRequest;

  /// No description provided for @parishSchedule.
  ///
  /// In en, this message translates to:
  /// **'Parish Schedule'**
  String get parishSchedule;

  /// No description provided for @sampiro.
  ///
  /// In en, this message translates to:
  /// **'Sampiro'**
  String get sampiro;

  /// No description provided for @parishOffice.
  ///
  /// In en, this message translates to:
  /// **'Parish Office'**
  String get parishOffice;

  /// No description provided for @parishServices.
  ///
  /// In en, this message translates to:
  /// **'Parish Services'**
  String get parishServices;

  /// No description provided for @dateOfBirth.
  ///
  /// In en, this message translates to:
  /// **'Date of Birth: (mm/dd/yyyy)'**
  String get dateOfBirth;

  /// No description provided for @dateRemarks.
  ///
  /// In en, this message translates to:
  /// **'Date Remarks'**
  String get dateRemarks;

  /// No description provided for @placeOfBirth.
  ///
  /// In en, this message translates to:
  /// **'Place of Birth:*'**
  String get placeOfBirth;

  /// No description provided for @nameOfFather.
  ///
  /// In en, this message translates to:
  /// **'Name of Father:*'**
  String get nameOfFather;

  /// No description provided for @nameOfMother.
  ///
  /// In en, this message translates to:
  /// **'Name of Mother:*'**
  String get nameOfMother;

  /// No description provided for @purpose.
  ///
  /// In en, this message translates to:
  /// **'Purpose:*'**
  String get purpose;

  /// No description provided for @mobileNo.
  ///
  /// In en, this message translates to:
  /// **'Mobile No.:*'**
  String get mobileNo;

  /// No description provided for @emailAddress.
  ///
  /// In en, this message translates to:
  /// **'Email Address: (Optional)'**
  String get emailAddress;

  /// No description provided for @dateOfBaptism.
  ///
  /// In en, this message translates to:
  /// **'Date of Baptism: (mm/dd/yyyy)'**
  String get dateOfBaptism;

  /// No description provided for @top.
  ///
  /// In en, this message translates to:
  /// **'Please ensure that all the provided information is accurate to assist the parish office in locating your record accordingly.'**
  String get top;

  /// No description provided for @remarks.
  ///
  /// In en, this message translates to:
  /// **'If you are unsure about the date, please add a remark here.'**
  String get remarks;

  /// No description provided for @mmddyyyy.
  ///
  /// In en, this message translates to:
  /// **'mm/dd/yyyy'**
  String get mmddyyyy;

  /// No description provided for @submit.
  ///
  /// In en, this message translates to:
  /// **'Submit'**
  String get submit;

  /// No description provided for @counseling.
  ///
  /// In en, this message translates to:
  /// **'Counseling'**
  String get counseling;

  /// No description provided for @counselingRequest.
  ///
  /// In en, this message translates to:
  /// **'Counseling Request'**
  String get counselingRequest;

  /// No description provided for @address.
  ///
  /// In en, this message translates to:
  /// **'Address:*'**
  String get address;

  /// No description provided for @addiction.
  ///
  /// In en, this message translates to:
  /// **'Addiction'**
  String get addiction;

  /// No description provided for @career.
  ///
  /// In en, this message translates to:
  /// **'Career'**
  String get career;

  /// No description provided for @crisis.
  ///
  /// In en, this message translates to:
  /// **'Crisis'**
  String get crisis;

  /// No description provided for @grief.
  ///
  /// In en, this message translates to:
  /// **'Grief'**
  String get grief;

  /// No description provided for @marriageAndFamily.
  ///
  /// In en, this message translates to:
  /// **'Marriage and Family'**
  String get marriageAndFamily;

  /// No description provided for @mentalHealth.
  ///
  /// In en, this message translates to:
  /// **'Mental Health'**
  String get mentalHealth;

  /// No description provided for @trauma.
  ///
  /// In en, this message translates to:
  /// **'Trauma'**
  String get trauma;

  /// No description provided for @typeOfCounseling.
  ///
  /// In en, this message translates to:
  /// **'Type of Counseling:*'**
  String get typeOfCounseling;

  /// No description provided for @preferredCounselingDate.
  ///
  /// In en, this message translates to:
  /// **'Preferred Counseling Date:*'**
  String get preferredCounselingDate;

  /// No description provided for @preferredCounselingTime.
  ///
  /// In en, this message translates to:
  /// **'Preferred Counseling Time:*'**
  String get preferredCounselingTime;

  /// No description provided for @topC.
  ///
  /// In en, this message translates to:
  /// **'Note: Request must be made ahead of time to allow the parish office to plan accordingly'**
  String get topC;

  /// No description provided for @menu.
  ///
  /// In en, this message translates to:
  /// **'Menu'**
  String get menu;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en': return AppLocalizationsEn();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
