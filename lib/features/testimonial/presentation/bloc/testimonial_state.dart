part of 'testimonial_bloc.dart';

enum TestimonialStatus { none, loading, successful, failed }

@freezed
abstract class TestimonialState with _$TestimonialState {
  const factory TestimonialState({
    // for adding
    @Default(TestimonialStatus.none) TestimonialStatus statusForAddingTestimonial,
    @Default('') String testimonial,
    @Default('') String name,
    // for fetching
    @Default(TestimonialStatus.none) TestimonialStatus statusForFetchingTestimonial,
    @Default([]) List<ParishTestimonialModel> testimonialList,
    String? errorTestimonialAddingMessage,
    String? errorTestimonialFetchingMessage,
    // for pagination
    @Default(true) bool hasNextPage,
    @Default(TestimonialStatus.none) TestimonialStatus statusForPaginationTestimonial,
  }) = _TestimonialState;
  const TestimonialState._();

  bool get isTestimonialValid => testimonial.length > 5;
  bool get isNameValid => name.isNotEmpty;
  bool get isSendTestimonialValid => isTestimonialValid;
}
