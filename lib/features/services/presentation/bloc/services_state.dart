part of 'services_bloc.dart';

enum ServicesStatus { none, loading, successful, failed }

@freezed
abstract class ServicesState with _$ServicesState {
  const factory ServicesState({
    @Default(ServicesStatus.none) ServicesStatus status,
    @Default('') String fieldName,
    @Default('') String fieldDate,
    @Default('') String fieldDateOfBirth,
    @Default('') String placeOfBirth,
    @Default('') String nameOfFather,
    @Default('') String nameOfMother,
    @Default('') String remarks,
    @Default('') String purpose,
    @Default('') String dateOfBaptism,
    @Default('') String mobileNo,
    @Default('') String emailAddress,
    @Default('') String docRefId,
    @Default('') String errorMessage,
    @Default('') String address,
    @Default('') String nameOfSickPerson,
    @Default('') String age,
    @Default('') String barangay,
    @Default('') String sickness,
    @Default('') String nameOfRequestingPerson,
    @Default('') String relationshipWithSick,
    @Default('') String contactNumberOfRequestingPerson,
    @Default('') String dateOfAnointing,
    @Default('') String typeOfCounseling,
    @Default('') String preferredCounselingDate,
    TimeOfDay? preferredCounselingTime,
    TimeOfDay? timeOfAnointing,
  }) = _ServicesState;
  const ServicesState._();

  String get formattedTime {
    if (preferredCounselingTime == null) return '';
    final hour = preferredCounselingTime!.hourOfPeriod == 0 ? 12 : preferredCounselingTime!.hourOfPeriod;
    final period = preferredCounselingTime!.period == DayPeriod.am ? 'AM' : 'PM';
    final minute = preferredCounselingTime!.minute.toString().padLeft(2, '0');
    return '$hour:$minute $period';
  }

  String get formattedTimeAnointing {
    if (timeOfAnointing == null) return '';
    final hour = timeOfAnointing!.hourOfPeriod == 0 ? 12 : timeOfAnointing!.hourOfPeriod;
    final period = timeOfAnointing!.period == DayPeriod.am ? 'AM' : 'PM';
    final minute = timeOfAnointing!.minute.toString().padLeft(2, '0');
    return '$hour:$minute $period';
  }

  bool get isNameOfSickPersonValid {
    return nameOfSickPerson.length > 3;
  }

  bool get isTimeOfAnointing {
    return timeOfAnointing != null;
  }

  bool get isDateOfAnointingValid {
    return dateOfAnointing.length == 10;
  }

  bool get isContactNumberOfRequestingPersonValid {
    return contactNumberOfRequestingPerson.length == 9;
  }

  bool get isRelationshipWithSickValid {
    return relationshipWithSick.length > 3;
  }

  bool get isNameOfRequestingPersonValid {
    return nameOfRequestingPerson.length > 3;
  }

  bool get isSicknessValid {
    return sickness.length > 3;
  }

  bool get isBarangayValid {
    return barangay.length > 3;
  }

  bool get isAgeValid {
    return age.isNotEmpty;
  }

  bool get isNameValid {
    return fieldName.length > 3;
  }

  bool get isAddressValid {
    return address.length > 3;
  }

  bool get isTypeOfCounselingValid {
    return typeOfCounseling.length > 3;
  }

  bool get isFieldDateOfBirthValid {
    return fieldDateOfBirth.length == 10;
  }

  bool get isFieldDateValid {
    return fieldDate.length == 10;
  }

  bool get isPreferredCounselingDateValid {
    return preferredCounselingDate.length == 10;
  }

  bool get isPreferredCounselingTimeValid {
    return preferredCounselingTime != null;
  }

  bool get isRemarksValid {
    return remarks.length > 3;
  }

  bool get isPlaceOfBirthValid {
    return placeOfBirth.length > 3;
  }

  bool get isNameOfFatherValid {
    return nameOfFather.length > 3;
  }

  bool get isNameOfMotherValid {
    return nameOfMother.length > 3;
  }

  bool get isPurposeValid {
    return purpose.length > 3;
  }

  bool get isMobileNoValid {
    return mobileNo.length == 9;
  }

  bool get isEmailAddressValid {
    return emailAddress.contains('@');
  }

  bool get isFormValid {
    return isNameValid &&
        isFieldDateValid &&
        isFieldDateOfBirthValid &&
        isRemarksValid &&
        isNameOfFatherValid &&
        isNameOfMotherValid &&
        isPurposeValid &&
        isMobileNoValid &&
        isEmailAddressValid;
  }

  bool get isRequestValid {
    return isNameValid &&
        isMobileNoValid &&
        isAddressValid &&
        isPreferredCounselingDateValid &&
        isPreferredCounselingTimeValid &&
        isTypeOfCounselingValid;
  }

  bool get isRequestFormValid {
    return isNameOfSickPersonValid &&
        isBarangayValid &&
        isAddressValid &&
        isAgeValid &&
        isSicknessValid &&
        isNameOfRequestingPersonValid &&
        isRelationshipWithSickValid &&
        isContactNumberOfRequestingPersonValid &&
        isDateOfAnointingValid &&
        isTimeOfAnointing;
  }
}
