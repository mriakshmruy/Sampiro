import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sampiro/features/testimonial/data/models/parish_testimonial_model.dart';
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
    on<TestimonialFetched>(_onTestimonialFetched);
    on<TestimonialLoadMore>(_onTestimonialLoadMore);
  }

  final ITestimonialRepository _testimonialRepository;

  final resultPerPage = 3;

  Future<void> _onTestimonialFetched(
    TestimonialFetched event,
    Emitter<TestimonialState> emit,
  ) async {
    emit(
      state.copyWith(statusForFetchingTestimonial: TestimonialStatus.loading, errorTestimonialFetchingMessage: null),
    );

    final fetchTestimonial = await _testimonialRepository.fetchTestimonial(resultPerPage);

    fetchTestimonial.fold(
      (left) {
        emit(
          state.copyWith(
            statusForFetchingTestimonial: TestimonialStatus.failed,
            errorTestimonialFetchingMessage: left.message,
          ),
        );
      },
      (testimonialList) {
        emit(
          state.copyWith(
            statusForFetchingTestimonial: TestimonialStatus.successful,
            errorTestimonialFetchingMessage: null,
            testimonialList: testimonialList,
          ),
        );
      },
    );
  }

  Future<void> _onTestimonialLoadMore(
    TestimonialLoadMore event,
    Emitter<TestimonialState> emit,
  ) async {
    if (state.statusForPaginationTestimonial == TestimonialStatus.loading || !state.hasNextPage) return;

    emit(state.copyWith(statusForPaginationTestimonial: TestimonialStatus.loading));

    final result = await _testimonialRepository.fetchMoreTestimonials(resultPerPage);
    result.fold(
      (_) {
        emit(
          state.copyWith(
            statusForPaginationTestimonial: TestimonialStatus.failed,
          ),
        );
      },
      (testimonialList) {
        emit(
          state.copyWith(
            testimonialList: [...state.testimonialList, ...testimonialList],
            statusForPaginationTestimonial: TestimonialStatus.successful,
            hasNextPage: testimonialList.length == resultPerPage,
          ),
        );
      },
    );
  }

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
    emit(state.copyWith(name: event.name.trim()));
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

    final result = await _testimonialRepository.submitTestimonials(
      ParishTestimonialModel(
        name: state.name,
        testimonials: state.testimonial,
        createdAt: FieldValue.serverTimestamp(),
      ),
    );
    result.fold(
      (left) {
        emit(
          state.copyWith(
            statusForAddingTestimonial: TestimonialStatus.failed,
            errorTestimonialAddingMessage: left.message,
          ),
        );
      },
      (_) {
        emit(
          state.copyWith(
            statusForAddingTestimonial: TestimonialStatus.successful,
            errorTestimonialAddingMessage: null,
          ),
        );
      },
    );
  }
}
