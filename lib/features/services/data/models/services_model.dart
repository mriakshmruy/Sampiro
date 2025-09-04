import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sampiro/core/resources/assets.gen.dart';

part 'services_model.freezed.dart';
part 'services_model.g.dart';

@freezed
abstract class ServicesTileModel with _$ServicesTileModel {
  const factory ServicesTileModel({
    required String imagePath,
    required String title,
  }) = _ServicesTileModel;

  const ServicesTileModel._();

  factory ServicesTileModel.fromJson(Map<String, dynamic> json) => _$ServicesTileModelFromJson(json);

  static List<ServicesTileModel> serviceList = [
    ServicesTileModel(imagePath: Assets.images.baptism.path, title: 'Baptismal Certificate'),
    ServicesTileModel(imagePath: Assets.images.confirmation.path, title: 'Confirmation Certificate'),
    ServicesTileModel(imagePath: Assets.images.holyCommunion.path, title: 'First Communion Certificate'),
    ServicesTileModel(imagePath: Assets.images.marriage.path, title: 'Marriage Certificate'),
    ServicesTileModel(imagePath: Assets.images.noRecordOfBaptism.path, title: 'No Record of Baptism'),
    ServicesTileModel(imagePath: Assets.images.baptismOutsideOfTheParish.path, title: 'Permission to be Baptized'),
    ServicesTileModel(imagePath: Assets.images.blessing.path, title: 'Schedule a Blessing'),
    ServicesTileModel(imagePath: Assets.images.anointingOfTheSick.path, title: 'Anointing of the Sick'),
    ServicesTileModel(imagePath: Assets.images.counseling.path, title: 'Counseling'),
    ServicesTileModel(imagePath: Assets.images.church.path, title: 'Donation'),
  ];
}
