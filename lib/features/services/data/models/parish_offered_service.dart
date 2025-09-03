import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intl/intl.dart';

part 'parish_offered_service.freezed.dart';
part 'parish_offered_service.g.dart';

@freezed
abstract class ParishOfferedService with _$ParishOfferedService {
  const factory ParishOfferedService({
    required dynamic createdAt,
    required String selectedParishService,
    @JsonKey(includeFromJson: false, includeToJson: false) String? firebaseDocumentId,
    @Default('') String remarks,
    @Default('') String dateOfBirth,
    @Default('') String placeOfBirth,
    @Default('') String dateOfConfirmation,
    @Default('') String dateOfFirstCommunion,
    @Default('') String nameOfGroom,
    @Default('') String maidenNameOfBride,
    @Default('') String dateOfMarriage,
    @Default('') String presentAddress,
    @Default('') String name,
    @Default('') String nameOfFather,
    @Default('') String nameOfMother,
    @Default('') String purpose,
    @Default('') String contactNumber,
    @Default('') String dateOfBaptism,
    @Default('') String emailAddress,
    @Default('') String whatToBless,
    @Default('') String barangay,
    @Default('') String dateOfBlessing,
    @Default('') String time,
    @Default('') String religion,
    @Default('') String reason,
    @Default('') String nameOfSickPerson,
    @Default('') String age,
    @Default('') String sickness,
    @Default('') String nameOfRequestingPerson,
    @Default('') String relationshipWithTheSick,
    @Default('') String dateOfAnointing,
    @Default('') String counselingType,
    @Default('') String dateOfCounselling,
    @Default('pending') String status,
    @Default('') String updatedBy,
    // Remarks of the user for unsure/estimates dates for baptismal / birthday and etc.
    @Default('') String senderDatesRemarks,
  }) = _ParishOfferedService;

  const ParishOfferedService._();

  factory ParishOfferedService.fromJson(Map<String, dynamic> json) => _$ParishOfferedServiceFromJson(json);

  String get formattedCreatedAt {
    try {
      final timeStamp = createdAt as Timestamp;

      // Convert Firebase Timestamp to DateTime
      final dateTime = timeStamp.toDate();

      // Format DateTime using intl package
      final formattedDate = DateFormat('MMM. dd, yyyy, hh:mm a').format(dateTime);

      return formattedDate;
    } catch (_) {
      return '';
    }
  }
}
