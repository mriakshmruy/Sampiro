import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:sampiro/core/failures/failures.dart';
import 'package:sampiro/core/firebase_options/firebase_collection.dart';
import 'package:sampiro/features/updates/domain/repositories/iparish_updates_repository.dart';

@LazySingleton(as: IParishUpdatesRepository)
class ParishUpdatesRepository implements IParishUpdatesRepository {
  ParishUpdatesRepository({required FirebaseFirestore firebaseFirestore}) : _firebaseFirestore = firebaseFirestore;
  final FirebaseFirestore _firebaseFirestore;

  QueryDocumentSnapshot? _lastDocumentSnapshot;

  @override
  Future<Either<Failure, Unit>> fetchParishUpdates(int resultPerPage) async {
    try {
      final now = DateTime.now();
      final endOfDay = DateTime(now.year, now.month, now.day, 23, 59, 59, 999);

      // Convert DateTime to Timestamp
      final timeStamp = Timestamp.fromDate(endOfDay);

      final querySnapshots = await _firebaseFirestore
          .collection(FirebaseCollection.parishUpdates)
          .where('isPublic', isEqualTo: true)
          .where('postingDate', isLessThanOrEqualTo: timeStamp) // Ensure this field is a Timestamp
          .orderBy('postingDate', descending: true)
          .limit(resultPerPage)
          .get();

      if (querySnapshots.docs.isNotEmpty) {
        _lastDocumentSnapshot = querySnapshots.docs[querySnapshots.docs.length - 1];
      }

      // TODO: To add back
      // final parishUpdateList = querySnapshots.docs.map((doc) => ParishUpdate.fromJson(doc.data())).toList();

      // return Right(parishUpdateList);
      return const Right(unit);
    } catch (e) {
      return Left(CustomFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, Unit>> fetchMoreParishUpdates(int resultPerPage) async {
    try {
      Query query = _firebaseFirestore
          .collection(FirebaseCollection.parishUpdates)
          .where('isPublic', isEqualTo: true)
          .orderBy('postingDate', descending: true);

      if (_lastDocumentSnapshot != null) {
        query = query.startAfter([_lastDocumentSnapshot!['postingDate']]);
      }
      query = query.limit(resultPerPage);

      final querySnapshots = await query.get();

      if (querySnapshots.docs.isNotEmpty) {
        _lastDocumentSnapshot = querySnapshots.docs[querySnapshots.docs.length - 1];
      }

      // TODO: To add back
      // final parishUpdateList = querySnapshots.docs
      //     .map((doc) => ParishUpdate.fromJson(doc.data()! as Map<String, dynamic>))
      //     .toList();

      // return Right(parishUpdateList);

      return const Right(unit);
    } catch (e) {
      return Left(CustomFailure(message: e.toString()));
    }
  }
}
