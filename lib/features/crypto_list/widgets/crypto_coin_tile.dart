import 'package:flutter/material.dart';
import 'package:voice_chat/repositories/models/crypto_coin.dart';

class CryptoCoinTile extends StatelessWidget {
  const CryptoCoinTile({
    super.key,
    required this.coin,
  });

  final CryptoCoin coin;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final coinDetails = coin.details;

    final isNegative = coinDetails.changePerDay.startsWith('-');
    return ListTile(
      leading: Image.network(coinDetails.fullImageUrl),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            coin.name,
            style: theme.textTheme.bodyMedium,
          ),
          Text(
            '${coinDetails.changePerDay}%',
            style: TextStyle(
              fontSize: 16,
              color: isNegative ? Colors.red : Colors.green,
            ),
          ),
        ],
      ),
      subtitle: Text(coinDetails.priceInUsd, style: theme.textTheme.labelSmall),
      trailing: const Icon(Icons.arrow_forward_ios),
      onTap: () {
        Navigator.of(context).pushNamed('/coin', arguments: coin);
      },
    );
  }
}
