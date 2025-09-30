part of 'testimonial_bloc.dart';

@freezed
abstract class TestimonialEvent with _$TestimonialEvent {
  // for adding testimonial
  const factory TestimonialEvent.testimonialTyped(String testimonial) = TestimonialTyped;
  const factory TestimonialEvent.testimonialNameTyped(String name) = TestimonialNameTyped;
  const factory TestimonialEvent.testimonialSubmitted() = TestimonialSubmitted;

  // for fetching
  const factory TestimonialEvent.testimonialsFetched() = TestimonialFetched;
}
