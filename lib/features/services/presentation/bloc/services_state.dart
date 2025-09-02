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
}
