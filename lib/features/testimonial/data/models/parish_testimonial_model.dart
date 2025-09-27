import 'package:freezed_annotation/freezed_annotation.dart';

part 'parish_testimonial_model.freezed.dart';
part 'parish_testimonial_model.g.dart';

@freezed
abstract class ParishTestimonialModel with _$ParishTestimonialModel {
  const factory ParishTestimonialModel({
    required String name,
    required String testimonials,
    String? firebaseDocumentId,
    @Default(false) bool isPublic,
    @Default('') String updatedBy,
  }) = _ParishTestimonialModel;

  const ParishTestimonialModel._();

  factory ParishTestimonialModel.fromJson(Map<String, dynamic> json) => _$ParishTestimonialModelFromJson(json);
}
