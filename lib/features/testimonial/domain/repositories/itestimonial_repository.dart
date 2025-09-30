import 'package:fpdart/fpdart.dart';
import 'package:sampiro/core/failures/failures.dart';
import 'package:sampiro/features/testimonial/data/models/parish_testimonial_model.dart';

abstract class ITestimonialRepository {
  Future<Either<Failure, Unit>> submitTestimonials(ParishTestimonialModel testimonial);
  Future<Either<Failure, List<ParishTestimonialModel>>> fetchTestimonial(int resultPerPage);
}
