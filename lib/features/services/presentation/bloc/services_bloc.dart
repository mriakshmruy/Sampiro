import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sampiro/features/services/data/models/parish_offered_service.dart';
import 'package:sampiro/features/services/domain/repositories/iservices_repository.dart';

part 'services_bloc.freezed.dart';
part 'services_event.dart';
part 'services_state.dart';

const String firebaseCollectionName = 'parishOfferedServices';

class ServicesBloc extends Bloc<ServicesEvent, ServicesState> {
  ServicesBloc({required IServicesRepository servicesRepository})
    : _servicesRepository = servicesRepository,

      super(const ServicesState()) {
    on<ServicesFieldNameChanged>(_onServicesFieldNameChanged);
    on<ServicesFieldDateChanged>(_onServicesFieldDateChanged);
    on<ServicesFieldDateOfBirthChanged>(_onServicesFieldDateOfBirthChanged);
    on<ServicesPlaceOfBirthChanged>(_onServicesPlaceOfBirthChanged);
    on<ServicesNameOfFatherChanged>(_onServicesNameOfFatherChanged);
    on<ServicesNameOfMotherChanged>(_onServicesNameOfMotherChanged);
    on<ServicesPurposeChanged>(_onServicesPurposeChanged);
    on<ServicesRemarksChanged>(_onServicesRemarksChanged);
    on<ServicesDateOfBaptismChanged>(_onServicesDateOfBaptismChanged);
    on<ServicesMobileNoChanged>(_onServicesMobileNoChanged);
    on<ServicesEmailAddressChanged>(_onServicesEmailAddressChanged);
    on<ServicesAddressChanged>(_onServicesAddressChanged);
    on<ServicesTypeOfCounselingChanged>(_onServicesTypeOfCounselingChanged);
    on<ServicesPreferredCounselingDateChanged>(_onServicesPreferredCounselingDateChanged);
    on<ServicesPreferredCounselingTimeChanged>(_onServicesPreferredCounselingTimeChanged);
    on<ServicesSubmitted>(_onServicesSubmitted);
    on<ServicesNameOfTheSickPersonChanged>(_onServicesNameOfTheSickPersonChanged);
    on<ServicesAgeChanged>(_onServicesAgeChanged);
    on<ServicesBarangayChanged>(_onServicesBarangayChanged);
    on<ServicesSicknessChanged>(_onServicesSicknessChanged);
    on<ServicesNameOfRequestingPersonChanged>(_onServicesNameOfRequestingPersonChanged);
    on<ServicesRelationshipWithSickChanged>(_onServicesRelationshipWithSickChanged);
    on<ServicesContactNumberOfRequestingPersonChanged>(_onServicesContactNumberOfRequestingPersonChanged);
    on<ServicesDateOfAnointingChanged>(_onServicesDateOfAnointingChanged);
    on<ServicesTimeOfAnointingChanged>(_onServicesTimeOfAnointingChanged);
    on<ServicesPropertyChanged>(_onServicesPropertyChanged);
    on<ServicesDateOfBlessingChanged>(_onServicesDateOfBlessingChanged);
    on<ServicesTimeOfBlessingChanged>(_onServicesTimeOfBlessingChanged);
    on<ServicesReligionChanged>(_onServicesReligionChanged);
    on<ServicesReasonChanged>(_onServicesReasonChanged);
  }

  // dependency/private property
  final IServicesRepository _servicesRepository;

  void _onServicesPropertyChanged(
    ServicesPropertyChanged event,
    Emitter<ServicesState> emit,
  ) {
    emit(state.copyWith(property: event.property.trim()));
  }

  void _onServicesDateOfBlessingChanged(
    ServicesDateOfBlessingChanged event,
    Emitter<ServicesState> emit,
  ) {
    emit(state.copyWith(dateOfBlessing: event.dateOfBlessing.trim()));
  }

  void _onServicesTimeOfBlessingChanged(
    ServicesTimeOfBlessingChanged event,
    Emitter<ServicesState> emit,
  ) {
    emit(state.copyWith(timeOfBlessing: event.timeOfBlessing));
  }

  void _onServicesReligionChanged(
    ServicesReligionChanged event,
    Emitter<ServicesState> emit,
  ) {
    emit(state.copyWith(religion: event.religion.trim()));
  }

  void _onServicesReasonChanged(
    ServicesReasonChanged event,
    Emitter<ServicesState> emit,
  ) {
    emit(state.copyWith(reason: event.reason.trim()));
  }

  void _onServicesNameOfTheSickPersonChanged(
    ServicesNameOfTheSickPersonChanged event,
    Emitter<ServicesState> emit,
  ) {
    emit(state.copyWith(nameOfSickThePerson: event.nameOfTheSickPerson.trim()));
  }

  void _onServicesTimeOfAnointingChanged(
    ServicesTimeOfAnointingChanged event,
    Emitter<ServicesState> emit,
  ) {
    emit(state.copyWith(timeOfAnointing: event.timeOfAnointing));
  }

  void _onServicesDateOfAnointingChanged(
    ServicesDateOfAnointingChanged event,
    Emitter<ServicesState> emit,
  ) {
    emit(state.copyWith(dateOfAnointing: event.dateOfAnointing.trim()));
  }

  void _onServicesContactNumberOfRequestingPersonChanged(
    ServicesContactNumberOfRequestingPersonChanged event,
    Emitter<ServicesState> emit,
  ) {
    emit(state.copyWith(contactNumberOfRequestingPerson: event.contactNumberOfRequestingPerson.trim()));
  }

  void _onServicesRelationshipWithSickChanged(
    ServicesRelationshipWithSickChanged event,
    Emitter<ServicesState> emit,
  ) {
    emit(state.copyWith(relationshipWithSick: event.relationshipWithSick.trim()));
  }

  void _onServicesNameOfRequestingPersonChanged(
    ServicesNameOfRequestingPersonChanged event,
    Emitter<ServicesState> emit,
  ) {
    emit(state.copyWith(nameOfRequestingPerson: event.nameOfRequestingPerson.trim()));
  }

  void _onServicesSicknessChanged(
    ServicesSicknessChanged event,
    Emitter<ServicesState> emit,
  ) {
    emit(state.copyWith(sickness: event.sickness.trim()));
  }

  void _onServicesBarangayChanged(
    ServicesBarangayChanged event,
    Emitter<ServicesState> emit,
  ) {
    emit(state.copyWith(barangay: event.barangay.trim()));
  }

  void _onServicesAgeChanged(
    ServicesAgeChanged event,
    Emitter<ServicesState> emit,
  ) {
    emit(state.copyWith(age: event.age.trim()));
  }

  void _onServicesAddressChanged(
    ServicesAddressChanged event,
    Emitter<ServicesState> emit,
  ) {
    emit(state.copyWith(address: event.address.trim()));
  }

  void _onServicesTypeOfCounselingChanged(
    ServicesTypeOfCounselingChanged event,
    Emitter<ServicesState> emit,
  ) {
    emit(state.copyWith(typeOfCounseling: event.typeOfCounseling.trim()));
  }

  void _onServicesPreferredCounselingDateChanged(
    ServicesPreferredCounselingDateChanged event,
    Emitter<ServicesState> emit,
  ) {
    emit(state.copyWith(preferredCounselingDate: event.preferredCounselingDate.trim()));
  }

  void _onServicesPreferredCounselingTimeChanged(
    ServicesPreferredCounselingTimeChanged event,
    Emitter<ServicesState> emit,
  ) {
    emit(state.copyWith(preferredCounselingTime: event.preferredCounselingTime));
  }

  void _onServicesFieldNameChanged(
    ServicesFieldNameChanged event,
    Emitter<ServicesState> emit,
  ) {
    emit(state.copyWith(fieldName: event.fieldName.trim()));
  }

  void _onServicesFieldDateChanged(
    ServicesFieldDateChanged event,
    Emitter<ServicesState> emit,
  ) {
    emit(state.copyWith(fieldDate: event.fieldDate.trim()));
  }

  void _onServicesFieldDateOfBirthChanged(
    ServicesFieldDateOfBirthChanged event,
    Emitter<ServicesState> emit,
  ) {
    emit(state.copyWith(fieldDateOfBirth: event.fieldDateOfBirth.trim()));
  }

  void _onServicesPlaceOfBirthChanged(
    ServicesPlaceOfBirthChanged event,
    Emitter<ServicesState> emit,
  ) {
    emit(state.copyWith(placeOfBirth: event.placeOfBirth.trim()));
  }

  void _onServicesNameOfFatherChanged(
    ServicesNameOfFatherChanged event,
    Emitter<ServicesState> emit,
  ) {
    emit(state.copyWith(nameOfFather: event.nameOfFather.trim()));
  }

  void _onServicesNameOfMotherChanged(
    ServicesNameOfMotherChanged event,
    Emitter<ServicesState> emit,
  ) {
    emit(state.copyWith(nameOfMother: event.nameOfMother.trim()));
  }

  void _onServicesPurposeChanged(
    ServicesPurposeChanged event,
    Emitter<ServicesState> emit,
  ) {
    emit(state.copyWith(purpose: event.purpose.trim()));
  }

  void _onServicesDateOfBaptismChanged(
    ServicesDateOfBaptismChanged event,
    Emitter<ServicesState> emit,
  ) {
    emit(state.copyWith(dateOfBaptism: event.dateOfBaptism.trim()));
  }

  void _onServicesMobileNoChanged(
    ServicesMobileNoChanged event,
    Emitter<ServicesState> emit,
  ) {
    emit(state.copyWith(mobileNo: event.mobileNo.trim()));
  }

  void _onServicesEmailAddressChanged(
    ServicesEmailAddressChanged event,
    Emitter<ServicesState> emit,
  ) {
    emit(state.copyWith(emailAddress: event.emailAddress.trim()));
  }

  void _onServicesRemarksChanged(
    ServicesRemarksChanged event,
    Emitter<ServicesState> emit,
  ) {
    emit(state.copyWith(remarks: event.remarks.trim()));
  }

  Future<void> _onServicesSubmitted(
    ServicesSubmitted event,
    Emitter<ServicesState> emit,
  ) async {
    emit(state.copyWith(status: ServicesStatus.loading));

    final baptismalModel = ParishOfferedService(
      createdAt: FieldValue.serverTimestamp(),
      selectedParishService: event.selectedServices,
      name: state.fieldName,
      dateOfBaptism: state.fieldDate,
      dateOfBirth: state.fieldDateOfBirth,
      remarks: state.remarks,
      placeOfBirth: state.placeOfBirth,
      nameOfFather: state.nameOfFather,
      nameOfMother: state.nameOfMother,
      purpose: state.purpose,
      contactNumber: '09${state.mobileNo}',
      emailAddress: state.emailAddress,
      presentAddress: state.address,
      counselingType: state.typeOfCounseling,
      dateOfCounselling: state.preferredCounselingDate,
      time: state.formattedTime,
    );

    final inputEither = await _servicesRepository.requestAService(baptismalModel);

    inputEither.fold(
      (left) {
        emit(
          state.copyWith(
            status: ServicesStatus.failed,
            errorMessage: left.message,
          ),
        );
      },
      (docRefId) {
        emit(
          state.copyWith(
            status: ServicesStatus.successful,
            docRefId: docRefId,
          ),
        );
      },
    );
  }
}
