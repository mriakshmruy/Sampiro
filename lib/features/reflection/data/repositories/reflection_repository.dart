import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:sampiro/core/failures/failures.dart';
import 'package:sampiro/core/firebase_options/firebase_collection.dart';
import 'package:sampiro/features/reflection/data/model/parish_reflection_model.dart';
import 'package:sampiro/features/reflection/domain/repositories/ireflection_repository.dart';

@LazySingleton(as: IReflectionRepository)
class ReflectionRepository implements IReflectionRepository {
  ReflectionRepository({required FirebaseFirestore firebaseFirestore}) : _firebaseFirestore = firebaseFirestore;

  final FirebaseFirestore _firebaseFirestore;

  @override
  Future<Either<Failure, ParishReflectionModel>> fetchCurrentReflection(DateTime dateTime) async {
    try {
      final startOfDay = DateTime(dateTime.year, dateTime.month, dateTime.day);

      // Set the end of the day (just before midnight)
      final endOfDay = DateTime(dateTime.year, dateTime.month, dateTime.day, 23, 59, 59, 999);

      // Convert to Timestamp for Firestore
      final startOfDayTimestamp = Timestamp.fromDate(startOfDay);
      final endOfDayTimestamp = Timestamp.fromDate(endOfDay);

      final querySnapshot = await _firebaseFirestore
          .collection(FirebaseCollection.parishReflections)
          .where('date', isGreaterThanOrEqualTo: startOfDayTimestamp)
          .where('date', isLessThanOrEqualTo: endOfDayTimestamp)
          .get();

      final requestList = querySnapshot.docs.map((doc) {
        return ParishReflectionModel.fromJson({
          ...doc.data(),
        }).copyWith(firebaseDocumentId: doc.id);
      }).toList();

      return requestList.isEmpty ? const Right(ParishReflectionModel.empty) : Right(requestList.first);
    } catch (e) {
      return const Left(KashFailure(message: 'Error occurred'));
    }
  }
}
