part of 'services_bloc.dart';

@freezed
abstract class ServicesEvent with _$ServicesEvent {
  const factory ServicesEvent.started({required ServicesStatus status}) = ServicesStarted;
  const factory ServicesEvent.fieldNameChanged(String fieldName) = ServicesFieldNameChanged;
  const factory ServicesEvent.fieldDateChanged(String fieldDate) = ServicesFieldDateChanged;
  const factory ServicesEvent.fieldDateOfBirthChanged(String fieldDateOfBirth) = ServicesFieldDateOfBirthChanged;
  const factory ServicesEvent.remarks(String remarks) = ServicesRemarksChanged;
  const factory ServicesEvent.placeOfBirthChanged(String placeOfBirth) = ServicesPlaceOfBirthChanged;
  const factory ServicesEvent.nameOfFatherChanged(String nameOfFather) = ServicesNameOfFatherChanged;
  const factory ServicesEvent.nameOfMotherChanged(String nameOfMother) = ServicesNameOfMotherChanged;
  const factory ServicesEvent.purposeChanged(String purpose) = ServicesPurposeChanged;
  const factory ServicesEvent.dateOfBaptismChanged(String dateOfBaptism) = ServicesDateOfBaptismChanged;
  const factory ServicesEvent.mobileNoChanged(String mobileNo) = ServicesMobileNoChanged;
  const factory ServicesEvent.emailAddressChanged(String emailAddress) = ServicesEmailAddressChanged;
}
