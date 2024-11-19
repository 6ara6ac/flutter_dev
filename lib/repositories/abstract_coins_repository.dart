import 'package:voice_chat/repositories/repositories.dart';

abstract class AbstractCoinsRepository {
  Future<List<CryptoCoin>> getCoinsList();
  Future<CryptoCoin> getCoinDetails(String currencyCode);
}
