import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'services_bloc.freezed.dart';
part 'services_event.dart';
part 'services_state.dart';

const String firebaseCollectionName = 'parishOfferedServices';

class ServicesBloc extends Bloc<ServicesEvent, ServicesState> {
  ServicesBloc() : super(const ServicesState()) {
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

    await Future<void>.delayed(const Duration(seconds: 3));
    emit(state.copyWith(status: ServicesStatus.successful));

    // if (!state.isNameValid ||
    //     !state.isFieldDateValid ||
    //     !state.isFieldDateOfBirthValid ||
    //     !state.isRemarksValid ||
    //     !state.isPlaceOfBirthValid ||
    //     !state.isNameOfFatherValid ||
    //     !state.isNameOfMotherValid ||
    //     !state.isPurposeValid ||
    //     !state.isDateOfBaptismValid ||
    //     !state.isMobileNoValid ||
    //     !state.isEmailAddressValid) {
    //   emit(state.copyWith(status: ServicesStatus.failed));
    //   return;
    // }
  }
}
