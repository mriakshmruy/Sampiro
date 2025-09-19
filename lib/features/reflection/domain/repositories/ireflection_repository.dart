import 'package:fpdart/fpdart.dart';
import 'package:sampiro/core/failures/failures.dart';
import 'package:sampiro/features/reflection/data/model/parish_reflection_model.dart';

/// Interface for reflection repository
abstract class IReflectionRepository {
  Future<Either<Failure, ParishReflectionModel>> fetchCurrentReflection(DateTime dateTime);
}
