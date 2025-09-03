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
  }) = _ServicesState;
  const ServicesState._();

  bool get isNameValid {
    return fieldName.length > 3;
  }

  bool get isFieldDateValid {
    return fieldDate.length == 10;
  }

  bool get isFieldDateOfBirthValid {
    return fieldDateOfBirth.length == 10;
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

  bool get isDateOfBaptismValid {
    return dateOfBaptism.length == 10;
  }

  bool get isMobileNoValid {
    return mobileNo.length == 11;
  }

  bool get isEmailAddressValid {
    return emailAddress.contains('@');
  }

  bool get isFormValid {
    return isNameValid &&
        isFieldDateValid &&
        isFieldDateOfBirthValid &&
        isNameOfFatherValid &&
        isNameOfMotherValid &&
        isPurposeValid &&
        isDateOfBaptismValid &&
        isMobileNoValid &&
        isEmailAddressValid;
  }
}
