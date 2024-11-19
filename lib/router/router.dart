import 'package:flutter/material.dart';
import '../features/crypto_coin/crypto_coin.dart';
import '../features/crypto_list/view/crypto_list_screen.dart';
import '../repositories/models/crypto_coin.dart';

final router = {
  '/': (context) => const CryptoListScreen(title: 'Coin Screener'),
  '/coin': (context) {
    final coin = ModalRoute.of(context)?.settings.arguments as CryptoCoin;
    return CryptoCoinScreen(coin: coin);
  },
};
