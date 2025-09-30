import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:jiffy/jiffy.dart';

part 'parish_testimonial_model.freezed.dart';
part 'parish_testimonial_model.g.dart';

@freezed
abstract class ParishTestimonialModel with _$ParishTestimonialModel {
  const factory ParishTestimonialModel({
    required dynamic createdAt,
    required String name,
    required String testimonials,
    String? firebaseDocumentId,
    @Default(true) bool isPublic,
    @Default('') String updatedBy,
  }) = _ParishTestimonialModel;

  const ParishTestimonialModel._();

  factory ParishTestimonialModel.fromJson(Map<String, dynamic> json) => _$ParishTestimonialModelFromJson(json);

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
