import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:sampiro/core/failures/failures.dart';
import 'package:sampiro/core/firebase_options/firebase_collection.dart';
import 'package:sampiro/features/video/data/models/parish_video_model.dart';
import 'package:sampiro/features/video/domain/repositories/iparish_video_repository.dart';

@LazySingleton(as: IParishVideoRepository)
class VideoRepository implements IParishVideoRepository {
  VideoRepository({required FirebaseFirestore firebaseFirestore}) : _firebaseFirestore = firebaseFirestore;
  final FirebaseFirestore _firebaseFirestore;

  QueryDocumentSnapshot? _lastDocumentSnapshot;

  @override
  Future<Either<Failure, List<ParishVideo>>> fetchVideo(int resultPerPage) async {
    try {
      final querySnapshots = await _firebaseFirestore
          .collection(FirebaseCollection.parishVideos)
          .where('isPublic', isEqualTo: true)
          .orderBy('createdAt', descending: true)
          .limit(resultPerPage)
          .get();

      if (querySnapshots.docs.isNotEmpty) {
        _lastDocumentSnapshot = querySnapshots.docs[querySnapshots.docs.length - 1];
      }

      final parishUpdateList = querySnapshots.docs.map((doc) {
        // Cast doc.data() to Map<String, dynamic> and add doc.id to the map
        return ParishVideo.fromJson({
          ...doc.data(),
        }).copyWith(firebaseDocumentId: doc.id);
      }).toList();
      return Right(parishUpdateList);
    } catch (e) {
      return Left(CustomFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<ParishVideo>>> fetchMoreVideo(int resultPerPage) async {
    try {
      Query query = _firebaseFirestore
          .collection(FirebaseCollection.parishVideos)
          .where('isPublic', isEqualTo: true)
          .orderBy('createdAt', descending: true);

      if (_lastDocumentSnapshot != null) {
        query = query.startAfter([_lastDocumentSnapshot!['createdAt']]);
      }
      query = query.limit(resultPerPage);

      final querySnapshots = await query.get();

      if (querySnapshots.docs.isNotEmpty) {
        _lastDocumentSnapshot = querySnapshots.docs[querySnapshots.docs.length - 1];
      }

      final parishUpdateList = querySnapshots.docs.map((doc) {
        // Cast doc.data() to Map<String, dynamic> and add doc.id to the map
        return ParishVideo.fromJson({
          ...doc.data()! as Map<String, dynamic>,
        }).copyWith(firebaseDocumentId: doc.id);
      }).toList();
      return Right(parishUpdateList);
    } catch (e) {
      return Left(CustomFailure(message: e.toString()));
    }
  }
}
