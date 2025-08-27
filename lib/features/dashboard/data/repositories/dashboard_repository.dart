import 'package:sampiro/features/dashboard/domain/repositories/idashboard_repository.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: IDashboardRepository)
class DashboardRepository implements IDashboardRepository {}
