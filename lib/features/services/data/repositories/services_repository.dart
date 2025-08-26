import 'package:sampiro/features/services/domain/repositories/iservices_repository.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: IServicesRepository)
class ServicesRepository implements IServicesRepository {}
