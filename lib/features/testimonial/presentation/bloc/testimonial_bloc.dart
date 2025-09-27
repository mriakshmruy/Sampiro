import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sampiro/features/testimonial/domain/repositories/itestimonial_repository.dart';

part 'testimonial_bloc.freezed.dart';
part 'testimonial_event.dart';
part 'testimonial_state.dart';

class TestimonialBloc extends Bloc<TestimonialEvent, TestimonialState> {
  TestimonialBloc({required ITestimonialRepository testimonialRepository})
    : _testimonialRepository = testimonialRepository,
      super(const TestimonialState()) {
    on<TestimonialTyped>(_onTestimonialTyped);
    on<TestimonialNameTyped>(_onTestimonialNameTyped);
    on<TestimonialSubmitted>(_onTestimonialSubmitted);
  }

  final ITestimonialRepository _testimonialRepository;

  void _onTestimonialTyped(
    TestimonialTyped event,
    Emitter<TestimonialState> emit,
  ) {
    emit(state.copyWith(testimonial: event.testimonial.trim()));
  }

  void _onTestimonialNameTyped(
    TestimonialNameTyped event,
    Emitter<TestimonialState> emit,
  ) {
    emit(state.copyWith(testimonial: event.name.trim()));
  }

  Future<void> _onTestimonialSubmitted(
    TestimonialSubmitted event,
    Emitter<TestimonialState> emit,
  ) async {
    emit(state.copyWith(statusForAddingTestimonial: TestimonialStatus.loading, errorTestimonialAddingMessage: null));

    final String name;

    if (state.isNameValid) {
      if (state.name.startsWith('-')) {
        name = state.name.substring(1);
      } else {
        name = state.name;
      }
    } else {
      name = 'Anonymous';
    }

    // final result = await _testimonialRepository.submitTestimonials();
  }
}
