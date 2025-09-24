import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:jiffy/jiffy.dart';

part 'parish_video_model.freezed.dart';
part 'parish_video_model.g.dart';

@freezed
abstract class ParishVideo with _$ParishVideo {
  const factory ParishVideo({
    required dynamic createdAt,

    @JsonKey(includeFromJson: false, includeToJson: false) String? firebaseDocumentId, //ok
    @Default('') String videoLink,
    @Default('') String videoThumbnailLink,
    @Default('') String description,
    @Default('') String createdBy,
    @Default(false) bool isPublic,
    @Default('') String title,
    @Default('') String updatedBy,
  }) = _ParishVideo;

  const ParishVideo._();

  factory ParishVideo.fromJson(Map<String, dynamic> json) => _$ParishVideoFromJson(json);

  String get elapsedTime {
    try {
      final timeStamp = createdAt as Timestamp;
      final dateTime = DateTime.fromMillisecondsSinceEpoch(timeStamp.millisecondsSinceEpoch);
      return Jiffy.parse(dateTime.toLocal().toString()).fromNow();
    } catch (e) {
      return '';
    }
  }
}
