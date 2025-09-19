import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intl/intl.dart';

part 'parish_reflection_model.freezed.dart';
part 'parish_reflection_model.g.dart';

@freezed
abstract class ParishReflectionModel with _$ParishReflectionModel {
  const factory ParishReflectionModel({
    required dynamic createdAt,

    @JsonKey(includeFromJson: false, includeToJson: false) String? firebaseDocumentId,
    @Default('') String reflection,
    @Default('') String createdBy,

    @Default('') String author,
    @Default('') String updatedBy,
  }) = _ParishReflectionModel;

  const ParishReflectionModel._();

  factory ParishReflectionModel.fromJson(Map<String, dynamic> json) => _$ParishReflectionModelFromJson(json);

  static const empty = ParishReflectionModel(
    createdAt: '',
  );

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
