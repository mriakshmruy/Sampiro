import 'package:fpdart/fpdart.dart';
import 'package:sampiro/core/failures/failures.dart';

/// Interface for updates repository
abstract class IParishUpdatesRepository {
  // TODO: To change the Right into List<ParishUpdate>
  Future<Either<Failure, Unit>> fetchParishUpdates(int resultPerPage);
  Future<Either<Failure, Unit>> fetchMoreParishUpdates(int resultPerPage);
}
