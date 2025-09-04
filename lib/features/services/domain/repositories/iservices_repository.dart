import 'package:fpdart/fpdart.dart';
import 'package:sampiro/core/failures/failures.dart';
import 'package:sampiro/features/services/data/models/parish_offered_service.dart';

/// Interface for services repository
abstract class IServicesRepository {
  Future<Either<Failure, String>> requestAService(ParishOfferedService service);
}
