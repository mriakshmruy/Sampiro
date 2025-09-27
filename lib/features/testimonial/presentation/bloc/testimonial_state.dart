part of 'testimonial_bloc.dart';

enum TestimonialStatus { none, loading, successful, failed }

@freezed
abstract class TestimonialState with _$TestimonialState {
  const factory TestimonialState({
    @Default(TestimonialStatus.none) TestimonialStatus statusForAddingTestimonial,
    @Default('') String testimonial,
    @Default('') String name,
    String? errorTestimonialAddingMessage,
  }) = _TestimonialState;
  const TestimonialState._();

  bool get isTestimonialValid => testimonial.length > 5;
  bool get isNameValid => name.isNotEmpty;
  bool get isSendTestimonialValid => isTestimonialValid;
}
