// ignore_for_file: prefer_const_constructors

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';
import 'package:sampiro/core/failures/failures.dart';
import 'package:sampiro/features/services/data/models/parish_offered_service.dart';
import 'package:sampiro/features/services/domain/repositories/iservices_repository.dart';
import 'package:sampiro/features/services/presentation/bloc/services_bloc.dart';

class MockIServicesRepository extends Mock implements IServicesRepository {}

void main() {
  late MockIServicesRepository mockIServicesRepository;
  late ServicesBloc servicesBloc;

  setUp(() {
    registerFallbackValue(
      ParishOfferedService(
        createdAt: 'fallback',
        selectedParishService: 'fallback',
      ),
    );
    mockIServicesRepository = MockIServicesRepository();
    servicesBloc = ServicesBloc(servicesRepository: mockIServicesRepository);
  });

  tearDown(() => servicesBloc.close());

  blocTest<ServicesBloc, ServicesState>(
    'emit updated state with trimmed property when ServicesPropertyChanged event is added',
    build: () => servicesBloc,
    act: (bloc) {
      bloc.add(ServicesPropertyChanged('newProperty'));
    },
    expect: () => const <ServicesState>[ServicesState(property: 'newProperty')],
  );

  blocTest<ServicesBloc, ServicesState>(
    'emit updated state trimmed property when ServicesDateOfBlessingChanged event is added',
    build: () => servicesBloc,
    act: (bloc) {
      bloc.add(ServicesDateOfBlessingChanged('dateOfBlessing'));
    },
    expect: () => <ServicesState>[ServicesState(dateOfBlessing: 'dateOfBlessing')],
  );

  blocTest<ServicesBloc, ServicesState>(
    'emit updated state when ServicesTimeOfBlessingChanged event is added ',
    build: () => servicesBloc,
    act: (bloc) {
      bloc.add(ServicesTimeOfBlessingChanged(TimeOfDay(hour: 1, minute: 1)));
    },
    expect: () => <ServicesState>[ServicesState(timeOfBlessing: TimeOfDay(hour: 1, minute: 1))],
  );

  blocTest<ServicesBloc, ServicesState>(
    'emit updated state trimmed property when ServicesReligionChanged event is added ',
    build: () => servicesBloc,
    act: (bloc) {
      bloc.add(ServicesReligionChanged('religion'));
    },
    expect: () => <ServicesState>[ServicesState(religion: 'religion')],
  );

  blocTest<ServicesBloc, ServicesState>(
    'emit updated state trimmed property when ServicesReasonChanged event is added ',
    build: () => servicesBloc,
    act: (bloc) {
      bloc.add(ServicesReasonChanged('reason'));
    },
    expect: () => <ServicesState>[ServicesState(reason: 'reason')],
  );

  blocTest<ServicesBloc, ServicesState>(
    'emit updated state trimmed property when ServicesNameOfTheSickPersonChanged event is added ',
    build: () => servicesBloc,
    act: (bloc) {
      bloc.add(ServicesNameOfTheSickPersonChanged('nameOfSickThePerson'));
    },
    expect: () => <ServicesState>[ServicesState(nameOfSickThePerson: 'nameOfSickThePerson')],
  );

  blocTest<ServicesBloc, ServicesState>(
    'emit updated state when ServicesTimeOfAnointingChanged event is added ',
    build: () => servicesBloc,
    act: (bloc) {
      bloc.add(ServicesTimeOfAnointingChanged(TimeOfDay(hour: 1, minute: 1)));
    },
    expect: () => <ServicesState>[ServicesState(timeOfAnointing: TimeOfDay(hour: 1, minute: 1))],
  );

  blocTest<ServicesBloc, ServicesState>(
    'emit updated state trimmed property when ServicesDateOfAnointingChanged event is added ',
    build: () => servicesBloc,
    act: (bloc) {
      bloc.add(ServicesDateOfAnointingChanged('dateOfAnointing'));
    },
    expect: () => <ServicesState>[ServicesState(dateOfAnointing: 'dateOfAnointing')],
  );

  blocTest<ServicesBloc, ServicesState>(
    'emit updated state trimmed property when ServicesContactNumberOfRequestingPersonChanged event is added ',
    build: () => servicesBloc,
    act: (bloc) {
      bloc.add(ServicesContactNumberOfRequestingPersonChanged('contactNumberOfRequestingPerson'));
    },
    expect: () => <ServicesState>[ServicesState(contactNumberOfRequestingPerson: 'contactNumberOfRequestingPerson')],
  );

  blocTest<ServicesBloc, ServicesState>(
    'emit updated state trimmed property when ServicesRelationshipWithSickChanged event is added ',
    build: () => servicesBloc,
    act: (bloc) {
      bloc.add(ServicesRelationshipWithSickChanged('relationshipWithSick'));
    },
    expect: () => <ServicesState>[ServicesState(relationshipWithSick: 'relationshipWithSick')],
  );

  blocTest<ServicesBloc, ServicesState>(
    'emit updated state trimmed property when ServicesNameOfRequestingPersonChanged event is added ',
    build: () => servicesBloc,
    act: (bloc) {
      bloc.add(ServicesNameOfRequestingPersonChanged('nameOfRequestingPerson'));
    },
    expect: () => <ServicesState>[ServicesState(nameOfRequestingPerson: 'nameOfRequestingPerson')],
  );

  blocTest<ServicesBloc, ServicesState>(
    'emit updated state trimmed property when ServicesSicknessChanged event is added ',
    build: () => servicesBloc,
    act: (bloc) {
      bloc.add(ServicesSicknessChanged('sickness'));
    },
    expect: () => <ServicesState>[ServicesState(sickness: 'sickness')],
  );

  blocTest<ServicesBloc, ServicesState>(
    'emit updated state trimmed property when ServicesBarangayChanged event is added ',
    build: () => servicesBloc,
    act: (bloc) {
      bloc.add(ServicesBarangayChanged('barangay'));
    },
    expect: () => <ServicesState>[ServicesState(barangay: 'barangay')],
  );

  blocTest<ServicesBloc, ServicesState>(
    'emit updated state trimmed property when ServicesAgeChanged event is added ',
    build: () => servicesBloc,
    act: (bloc) {
      bloc.add(ServicesAgeChanged('age'));
    },
    expect: () => <ServicesState>[ServicesState(age: 'age')],
  );

  blocTest<ServicesBloc, ServicesState>(
    'emit updated state trimmed property when ServicesAddressChanged event is added ',
    build: () => servicesBloc,
    act: (bloc) {
      bloc.add(ServicesAddressChanged('address'));
    },
    expect: () => <ServicesState>[ServicesState(address: 'address')],
  );

  blocTest<ServicesBloc, ServicesState>(
    'emit updated state trimmed property when ServicesTypeOfCounselingChanged event is added ',
    build: () => servicesBloc,
    act: (bloc) {
      bloc.add(ServicesTypeOfCounselingChanged('typeOfCounseling'));
    },
    expect: () => <ServicesState>[ServicesState(typeOfCounseling: 'typeOfCounseling')],
  );

  blocTest<ServicesBloc, ServicesState>(
    'emit updated state trimmed property when ServicesPreferredCounselingDateChanged event is added ',
    build: () => servicesBloc,
    act: (bloc) {
      bloc.add(ServicesPreferredCounselingDateChanged('preferredCounselingDate'));
    },
    expect: () => <ServicesState>[ServicesState(preferredCounselingDate: 'preferredCounselingDate')],
  );

  blocTest<ServicesBloc, ServicesState>(
    'emit updated state when ServicesPreferredCounselingTimeChanged event is added ',
    build: () => servicesBloc,
    act: (bloc) {
      bloc.add(ServicesPreferredCounselingTimeChanged(TimeOfDay(hour: 1, minute: 1)));
    },
    expect: () => <ServicesState>[ServicesState(preferredCounselingTime: TimeOfDay(hour: 1, minute: 1))],
  );

  blocTest<ServicesBloc, ServicesState>(
    'emit updated state trimmed property when ServicesPreferredCounselingDateChanged event is added ',
    build: () => servicesBloc,
    act: (bloc) {
      bloc.add(ServicesPreferredCounselingDateChanged('preferredCounselingDate'));
    },
    expect: () => <ServicesState>[ServicesState(preferredCounselingDate: 'preferredCounselingDate')],
  );

  blocTest<ServicesBloc, ServicesState>(
    'emit updated state trimmed property when ServicesFieldNameChanged event is added ',
    build: () => servicesBloc,
    act: (bloc) {
      bloc.add(ServicesFieldNameChanged('fieldName'));
    },
    expect: () => <ServicesState>[ServicesState(fieldName: 'fieldName')],
  );

  blocTest<ServicesBloc, ServicesState>(
    'emit updated state trimmed property when ServicesFieldDateChanged event is added ',
    build: () => servicesBloc,
    act: (bloc) {
      bloc.add(ServicesFieldDateChanged('fieldDate'));
    },
    expect: () => <ServicesState>[ServicesState(fieldDate: 'fieldDate')],
  );

  blocTest<ServicesBloc, ServicesState>(
    'emit updated state trimmed property when ServicesFieldDateOfBirthChanged event is added ',
    build: () => servicesBloc,
    act: (bloc) {
      bloc.add(ServicesFieldDateOfBirthChanged('fieldDateOfBirth'));
    },
    expect: () => <ServicesState>[ServicesState(fieldDateOfBirth: 'fieldDateOfBirth')],
  );

  blocTest<ServicesBloc, ServicesState>(
    'emit updated state trimmed property when ServicesPlaceOfBirthChanged event is added ',
    build: () => servicesBloc,
    act: (bloc) {
      bloc.add(ServicesPlaceOfBirthChanged('placeOfBirth'));
    },
    expect: () => <ServicesState>[ServicesState(placeOfBirth: 'placeOfBirth')],
  );

  blocTest<ServicesBloc, ServicesState>(
    'emit updated state trimmed property when ServicesNameOfFatherChanged event is added ',
    build: () => servicesBloc,
    act: (bloc) {
      bloc.add(ServicesNameOfFatherChanged('nameOfFather'));
    },
    expect: () => <ServicesState>[ServicesState(nameOfFather: 'nameOfFather')],
  );

  blocTest<ServicesBloc, ServicesState>(
    'emit updated state trimmed property when ServicesNameOfMotherChanged event is added ',
    build: () => servicesBloc,
    act: (bloc) {
      bloc.add(ServicesNameOfMotherChanged('nameOfMother'));
    },
    expect: () => <ServicesState>[ServicesState(nameOfMother: 'nameOfMother')],
  );

  blocTest<ServicesBloc, ServicesState>(
    'emit updated state trimmed property when ServicesPurposeChanged event is added ',
    build: () => servicesBloc,
    act: (bloc) {
      bloc.add(ServicesPurposeChanged('purpose'));
    },
    expect: () => <ServicesState>[ServicesState(purpose: 'purpose')],
  );

  blocTest<ServicesBloc, ServicesState>(
    'emit updated state trimmed property when ServicesDateOfBaptismChanged event is added ',
    build: () => servicesBloc,
    act: (bloc) {
      bloc.add(ServicesDateOfBaptismChanged('dateOfBaptism'));
    },
    expect: () => <ServicesState>[ServicesState(dateOfBaptism: 'dateOfBaptism')],
  );

  blocTest<ServicesBloc, ServicesState>(
    'emit updated state trimmed property when ServicesMobileNoChanged event is added ',
    build: () => servicesBloc,
    act: (bloc) {
      bloc.add(ServicesMobileNoChanged('mobileNo'));
    },
    expect: () => <ServicesState>[ServicesState(mobileNo: 'mobileNo')],
  );

  blocTest<ServicesBloc, ServicesState>(
    'emit updated state trimmed property when ServicesEmailAddressChanged event is added ',
    build: () => servicesBloc,
    act: (bloc) {
      bloc.add(ServicesEmailAddressChanged('emailAddress'));
    },
    expect: () => <ServicesState>[ServicesState(emailAddress: 'emailAddress')],
  );

  blocTest<ServicesBloc, ServicesState>(
    'emit updated state trimmed property when ServicesRemarksChanged event is added ',
    build: () => servicesBloc,
    act: (bloc) {
      bloc.add(ServicesRemarksChanged('remarks'));
    },
    expect: () => <ServicesState>[ServicesState(remarks: 'remarks')],
  );

  blocTest<ServicesBloc, ServicesState>(
    'emits [Loading, Success] when ServicesSubmitted event is added.',
    build: () => servicesBloc,
    act: (bloc) {
      when(
        () => mockIServicesRepository.requestAService(
          any(),
        ),
      ).thenAnswer(
        (_) async => Right('docRefId'),
      );

      bloc.add(ServicesSubmitted('Baptism'));
    },

    expect: () => const <ServicesState>[
      ServicesState(status: ServicesStatus.loading),
      ServicesState(status: ServicesStatus.successful, docRefId: 'docRefId'),
    ],
  );

  blocTest<ServicesBloc, ServicesState>(
    'emits [Loading, Failure] when ServicesSubmitted event is added.',
    build: () => servicesBloc,
    act: (bloc) {
      when(
        () => mockIServicesRepository.requestAService(
          any(),
        ),
      ).thenAnswer(
        (_) async => Left(CustomFailure(message: 'error')),
      );

      bloc.add(ServicesSubmitted('Baptism'));
    },
    expect: () => const <ServicesState>[
      ServicesState(status: ServicesStatus.loading),
      ServicesState(status: ServicesStatus.failed, errorMessage: 'error'),
    ],
  );
}
