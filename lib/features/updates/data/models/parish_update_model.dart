import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intl/intl.dart';

part 'parish_update_model.freezed.dart';
part 'parish_update_model.g.dart';

@freezed
abstract class ParishUpdateModel with _$ParishUpdateModel {
  const factory ParishUpdateModel({
    required dynamic createdAt,
    required dynamic postingDate,
    @JsonKey(includeFromJson: false, includeToJson: false) String? firebaseDocumentId,
    @Default([]) List<String> imageList,
    @Default('') String content,
    @Default('') String createdBy,
    @Default(false) bool isPublic,
    @Default('') String title,
    @Default('') String updatedBy,
  }) = _ParishUpdateModel;

  const ParishUpdateModel._();

  factory ParishUpdateModel.fromJson(Map<String, dynamic> json) => _$ParishUpdateModelFromJson(json);

  String get formattedCreatedAt {
    try {
      final timeStamp = createdAt as Timestamp;

      final dateTime = timeStamp.toDate();

      final formattedDate = DateFormat('MMM. dd, yyyy, hh:mm a').format(dateTime);

      return formattedDate;
    } catch (_) {
      return '';
    }
  }
}
