import 'package:injectable/injectable.dart';
import 'package:sampiro/features/dashboard/domain/repositories/idashboard_repository.dart';

@LazySingleton(as: IDashboardRepository)
class DashboardRepository implements IDashboardRepository {}
