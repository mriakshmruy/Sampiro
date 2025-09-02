import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'services_bloc.freezed.dart';
part 'services_event.dart';
part 'services_state.dart';

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
    emit(state.copyWith(fieldDate: event.fieldDate));
  }

  void _onServicesFieldDateOfBirthChanged(
    ServicesFieldDateOfBirthChanged event,
    Emitter<ServicesState> emit,
  ) {
    emit(state.copyWith(fieldDateOfBirth: event.fieldDateOfBirth));
  }

  void _onServicesPlaceOfBirthChanged(
    ServicesPlaceOfBirthChanged event,
    Emitter<ServicesState> emit,
  ) {
    emit(state.copyWith(placeOfBirth: event.placeOfBirth));
  }

  void _onServicesNameOfFatherChanged(
    ServicesNameOfFatherChanged event,
    Emitter<ServicesState> emit,
  ) {
    emit(state.copyWith(nameOfFather: event.nameOfFather));
  }

  void _onServicesNameOfMotherChanged(
    ServicesNameOfMotherChanged event,
    Emitter<ServicesState> emit,
  ) {
    emit(state.copyWith(nameOfMother: event.nameOfMother));
  }

  void _onServicesPurposeChanged(
    ServicesPurposeChanged event,
    Emitter<ServicesState> emit,
  ) {
    emit(state.copyWith(purpose: event.purpose));
  }

  void _onServicesDateOfBaptismChanged(
    ServicesDateOfBaptismChanged event,
    Emitter<ServicesState> emit,
  ) {
    emit(state.copyWith(dateOfBaptism: event.dateOfBaptism));
  }

  void _onServicesMobileNoChanged(
    ServicesMobileNoChanged event,
    Emitter<ServicesState> emit,
  ) {
    emit(state.copyWith(mobileNo: event.mobileNo));
  }

  void _onServicesEmailAddressChanged(
    ServicesEmailAddressChanged event,
    Emitter<ServicesState> emit,
  ) {
    emit(state.copyWith(emailAddress: event.emailAddress));
  }

  void _onServicesRemarksChanged(
    ServicesRemarksChanged event,
    Emitter<ServicesState> emit,
  ) {
    emit(state.copyWith(remarks: event.remarks));
  }
}
