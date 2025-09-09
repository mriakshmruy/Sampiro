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
  const factory ServicesEvent.addressChanged(String address) = ServicesAddressChanged;
  const factory ServicesEvent.typeOfCounselingChanged(String typeOfCounseling) = ServicesTypeOfCounselingChanged;
  const factory ServicesEvent.preferredCounselingDateChanged(String preferredCounselingDate) =
      ServicesPreferredCounselingDateChanged;
  const factory ServicesEvent.preferredCounselingTimeChanged(TimeOfDay preferredCounselingTime) =
      ServicesPreferredCounselingTimeChanged;
  const factory ServicesEvent.nameOfTheSickPersonChanged(String nameOfTheSickPeron) = ServicesNameOfTheSickPeronChanged;
  const factory ServicesEvent.ageChanged(String age) = ServicesAgeChanged;
  const factory ServicesEvent.barangayChanged(String barangay) = ServicesBarangayChanged;
  const factory ServicesEvent.sicknessChanged(String sickness) = ServicesSicknessChanged;
  const factory ServicesEvent.nameOfRequestingPersonChanged(String nameOfRequestingPerson) =
      ServicesNameOfRequestingPersonChanged;
  const factory ServicesEvent.relationshipWithSick(String relationshipWithSick) = ServicesRelationshipWithSickChanged;
  const factory ServicesEvent.contactNumberOfRequestingPersonChanged(String contactNumberOfRequestingPerson) =
      ServicesContactNumberOfRequestingPersonChanged;
  const factory ServicesEvent.dateOfAnointingChanged(String dateOfAnointing) = ServicesDateOfAnointingChanged;
  const factory ServicesEvent.timeOfAnointingChanged(TimeOfDay timeOfAnointing) = ServicesTimeOfAnointingChanged;

  const factory ServicesEvent.submitted(String selectedServices) = ServicesSubmitted;
}
