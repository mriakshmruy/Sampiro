import 'package:fpdart/fpdart.dart';
import 'package:sampiro/core/failures/failures.dart';
import 'package:sampiro/features/video/data/models/parish_video_model.dart';

/// Interface for video repository
abstract class IParishVideoRepository {
  Future<Either<Failure, List<ParishVideo>>> fetchVideo(int resultPerPage);
  Future<Either<Failure, List<ParishVideo>>> fetchMoreVideo(int resultPerPage);
}
