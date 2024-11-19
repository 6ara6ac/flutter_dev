// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'crypto_coin_details.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CryptoCoinDetailsAdapter extends TypeAdapter<CryptoCoinDetails> {
  @override
  final int typeId = 3;

  @override
  CryptoCoinDetails read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CryptoCoinDetails(
      capitalization: fields[3] as String,
      priceInUsd: fields[1] as String,
      imageUrl: fields[2] as String,
      toSymbol: fields[0] as String,
      lastUpdate: fields[5] as String,
      high24Day: fields[6] as String,
      low24Day: fields[7] as String,
      changePerDay: fields[4] as String,
    );
  }

  @override
  void write(BinaryWriter writer, CryptoCoinDetails obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.toSymbol)
      ..writeByte(1)
      ..write(obj.priceInUsd)
      ..writeByte(2)
      ..write(obj.imageUrl)
      ..writeByte(3)
      ..write(obj.capitalization)
      ..writeByte(4)
      ..write(obj.changePerDay)
      ..writeByte(5)
      ..write(obj.lastUpdate)
      ..writeByte(6)
      ..write(obj.high24Day)
      ..writeByte(7)
      ..write(obj.low24Day);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CryptoCoinDetailsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CryptoCoinDetails _$CryptoCoinDetailsFromJson(Map<String, dynamic> json) =>
    CryptoCoinDetails(
      capitalization: json['MKTCAP'] as String,
      priceInUsd: json['PRICE'] as String,
      imageUrl: json['IMAGEURL'] as String,
      toSymbol: json['TOSYMBOL'] as String,
      lastUpdate: json['LASTUPDATE'] as String,
      high24Day: json['HIGHDAY'] as String,
      low24Day: json['LOWDAY'] as String,
      changePerDay: json['CHANGEPCTDAY'] as String,
    );

Map<String, dynamic> _$CryptoCoinDetailsToJson(CryptoCoinDetails instance) =>
    <String, dynamic>{
      'TOSYMBOL': instance.toSymbol,
      'PRICE': instance.priceInUsd,
      'IMAGEURL': instance.imageUrl,
      'MKTCAP': instance.capitalization,
      'CHANGEPCTDAY': instance.changePerDay,
      'LASTUPDATE': instance.lastUpdate,
      'HIGHDAY': instance.high24Day,
      'LOWDAY': instance.low24Day,
    };
