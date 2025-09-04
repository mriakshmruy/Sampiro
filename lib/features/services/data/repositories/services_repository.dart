import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:sampiro/core/failures/failures.dart';
import 'package:sampiro/core/firebase_options/firebase_collection.dart';
import 'package:sampiro/features/services/data/models/parish_offered_service.dart';
import 'package:sampiro/features/services/domain/repositories/iservices_repository.dart';

@LazySingleton(as: IServicesRepository)
class ServicesRepository implements IServicesRepository {
  ServicesRepository({required FirebaseFirestore firebaseFirestore}) : _firebaseFirestore = firebaseFirestore;

  final FirebaseFirestore _firebaseFirestore;

  @override
  Future<Either<Failure, String>> requestAService(ParishOfferedService service) async {
    try {
      final docRef = await _firebaseFirestore.collection(FirebaseCollection.parishServices).add(service.toJson());
      return Right(docRef.id);
    } catch (e) {
      return Left(CustomFailure(message: e.toString()));
    }
  }
}
