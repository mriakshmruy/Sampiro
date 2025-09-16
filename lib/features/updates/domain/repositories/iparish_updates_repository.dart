import 'package:fpdart/fpdart.dart';
import 'package:sampiro/core/failures/failures.dart';
import 'package:sampiro/features/updates/data/models/parish_update_model.dart';

/// Interface for updates repository
abstract class IParishUpdatesRepository {
  Future<Either<Failure, List<ParishUpdateModel>>> fetchParishUpdates(int resultPerPage);
  Future<Either<Failure, List<ParishUpdateModel>>> fetchMoreParishUpdates(int resultPerPage);
}
