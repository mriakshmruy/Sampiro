import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
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
    on<ServicesStarted>(_onServicesStarted);
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
    on<ServicesSubmitted>(_onServicesSubmitted);
  }

  // dependency/private property
  final IServicesRepository _servicesRepository;

  void _onServicesStarted(
    ServicesStarted event,
    Emitter<ServicesState> emit,
  ) {}

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
      selectedParishService: 'baptism',
      name: state.fieldName,
      dateOfBaptism: state.fieldDate,
      dateOfBirth: state.fieldDateOfBirth,
      remarks: state.remarks,
      placeOfBirth: state.placeOfBirth,
      nameOfFather: state.nameOfFather,
      nameOfMother: state.nameOfMother,
      purpose: state.purpose,
      contactNumber: state.mobileNo,
      emailAddress: state.emailAddress,
    );
    if (!kReleaseMode) debugPrint('--x $baptismalModel');

    final inputEither = await _servicesRepository.requestAService(baptismalModel);

    inputEither.fold(
      (left) {
        emit(state.copyWith(status: ServicesStatus.failed));
      },
      (right) {
        emit(state.copyWith(status: ServicesStatus.successful));
      },
    );
  }
}
