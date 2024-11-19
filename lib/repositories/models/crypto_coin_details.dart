import 'package:equatable/equatable.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:json_annotation/json_annotation.dart';

part 'crypto_coin_details.g.dart';

@HiveType(typeId: 3)
@JsonSerializable()
class CryptoCoinDetails extends Equatable {
  const CryptoCoinDetails({
    required this.capitalization,
    required this.priceInUsd,
    required this.imageUrl,
    required this.toSymbol,
    required this.lastUpdate,
    required this.high24Day,
    required this.low24Day,
    required this.changePerDay,
  });

  @HiveField(0)
  @JsonKey(name: 'TOSYMBOL')
  final String toSymbol;

  @HiveField(1)
  @JsonKey(name: 'PRICE')
  final String priceInUsd;

  @HiveField(2)
  @JsonKey(name: 'IMAGEURL')
  final String imageUrl;

  @HiveField(3)
  @JsonKey(name: 'MKTCAP')
  final String capitalization;

  @HiveField(4)
  @JsonKey(name: 'CHANGEPCTDAY')
  final String changePerDay;

  @HiveField(5)
  @JsonKey(
    name: 'LASTUPDATE',
    // toJson: _dateTimeToJson,
    // fromJson: _dateTimeFromJson,
  )
  final String lastUpdate;

  @HiveField(6)
  @JsonKey(name: 'HIGHDAY')
  final String high24Day;

  @HiveField(7)
  @JsonKey(name: 'LOWDAY')
  final String low24Day;

  String get fullImageUrl => 'https://www.cryptocompare.com$imageUrl';

  factory CryptoCoinDetails.fromJson(Map<String, dynamic> json) =>
      _$CryptoCoinDetailsFromJson(json);

  Map<String, dynamic> toJson() => _$CryptoCoinDetailsToJson(this);

  // static DateTime _dateTimeFromJson(int milliseconds) =>
  //     DateTime.fromMicrosecondsSinceEpoch(milliseconds);

  @override
  List<Object?> get props => [
        priceInUsd,
        high24Day,
        low24Day,
        imageUrl,
        toSymbol,
        capitalization,
        changePerDay,
      ];
}
