import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sampiro/core/resources/assets.gen.dart';

part 'prayers_model.freezed.dart';
part 'prayers_model.g.dart';

@freezed
abstract class PrayerTileModel with _$PrayerTileModel {
  const factory PrayerTileModel({
    required String imagePath,
    required String title,
  }) = _PrayerTileModel;

  const PrayerTileModel._();

  factory PrayerTileModel.fromJson(Map<String, dynamic> json) => _$PrayerTileModelFromJson(json);

  static List<PrayerTileModel> prayerList = [
    PrayerTileModel(
      imagePath: Assets.images.prayerEnglishStMichael.path,
      title: 'PRAYER TO SAINT MICHAEL THE ARCHANGEL',
    ),
    PrayerTileModel(
      imagePath: Assets.images.prayerEnglishDivineMercy.path,
      title: 'NOVENA TO THE MOST SACRED HEART OF JESUS',
    ),
    PrayerTileModel(
      imagePath: Assets.images.prayerImmaculateConcepcion.path,
      title: 'NOVENA TO OUR MOTHER OF PERPETUAL HELP',
    ),
    PrayerTileModel(
      imagePath: Assets.images.prayerSantoNino.path,
      title: 'PANALANGIN SA MAHAL NA SANTO ÑINO DE PASION DE MACATI',
    ),
    PrayerTileModel(
      imagePath: Assets.images.prayerDebotionMamaMary.path,
      title: 'DEBOSYON SA MAHAL NA VIRGEN DE LA ROSA',
    ),
    PrayerTileModel(
      imagePath: Assets.images.prayerStsPeterAndPaul.path,
      title: 'DEBOSYON KINA SAN PEDRO AT SAN PABLO',
    ),
    PrayerTileModel(
      imagePath: Assets.images.prayerSanMiguel.path,
      title: 'PANALANGIN KAY SAN MIGUEL ARKANGHEL',
    ),
    PrayerTileModel(
      imagePath: Assets.images.prayerImmaculateConcepcion.path,
      title: 'DEBOSYON SA MAHAL NA INA NG LAGING SAKLOLO',
    ),
    PrayerTileModel(
      imagePath: Assets.images.prayerBeforeAndAfterService.path,
      title: 'Prayer Before and After Service',
    ),
    PrayerTileModel(
      imagePath: Assets.images.prayerDivineMercy.path,
      title: 'Debosyon sa Kamahal-mahalang Puso ni Hesus',
    ),
  ];
}
