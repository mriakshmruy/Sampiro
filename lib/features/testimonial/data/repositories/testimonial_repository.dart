import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:sampiro/core/failures/failures.dart';
import 'package:sampiro/core/firebase_options/firebase_collection.dart';
import 'package:sampiro/features/testimonial/data/models/parish_testimonial_model.dart';
import 'package:sampiro/features/testimonial/domain/repositories/itestimonial_repository.dart';

@LazySingleton(as: ITestimonialRepository)
class TestimonialRepository implements ITestimonialRepository {
  TestimonialRepository({required FirebaseFirestore firebaseFirestore}) : _firebaseFirestore = firebaseFirestore;
  final FirebaseFirestore _firebaseFirestore;

  QueryDocumentSnapshot? _lastDocumentSnapshot;

  @override
  Future<Either<Failure, Unit>> submitTestimonials(ParishTestimonialModel testimonial) async {
    try {
      await _firebaseFirestore.collection(FirebaseCollection.testimonials).add(testimonial.toJson());
      return const Right(unit);
    } catch (e) {
      return Left(CustomFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<ParishTestimonialModel>>> fetchTestimonial(int resultPerPage) async {
    try {
      final querySnapshots = await _firebaseFirestore
          .collection(FirebaseCollection.testimonials)
          .where('isPublic', isEqualTo: true)
          .orderBy('createdAt', descending: true)
          .limit(resultPerPage)
          .get();

      if (querySnapshots.docs.isNotEmpty) {
        _lastDocumentSnapshot = querySnapshots.docs[querySnapshots.docs.length - 1];
      }

      final testimonialList = querySnapshots.docs.map((doc) => ParishTestimonialModel.fromJson(doc.data())).toList();

      return Right(testimonialList);
    } catch (e) {
      return Left(CustomFailure(message: e.toString()));
    }
  }
}
