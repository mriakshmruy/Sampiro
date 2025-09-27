part of 'testimonial_bloc.dart';

@freezed
abstract class TestimonialEvent with _$TestimonialEvent {
  const factory TestimonialEvent.testimonialTyped(String testimonial) = TestimonialTyped;
  const factory TestimonialEvent.testimonialNameTyped(String name) = TestimonialNameTyped;
  const factory TestimonialEvent.testimonialSubmitted() = TestimonialSubmitted;
}
