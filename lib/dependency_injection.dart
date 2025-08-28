import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:sampiro/dependency_injection.config.dart';

final GetIt getIt = GetIt.instance;

@InjectableInit()
Future<void> configureDependencies() async => getIt.init();

/// Third party dependencies
@module
abstract class RegisterAppModule {
  @lazySingleton
  FirebaseFirestore get firebaseFirestore => FirebaseFirestore.instance;

// TODO(Norman): To explain this
  @lazySingleton
  @preResolve
  Future<PackageInfo> get packageInfo => PackageInfo.fromPlatform();
}
