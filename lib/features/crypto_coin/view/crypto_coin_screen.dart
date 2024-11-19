import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:voice_chat/features/crypto_coin/bloc/crypto_coin_details_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:voice_chat/repositories/repositories.dart';

class CryptoCoinScreen extends StatefulWidget {
  const CryptoCoinScreen({super.key, required this.coin});

  final CryptoCoin coin;

  @override
  State<CryptoCoinScreen> createState() => _CryptoCoinScreenState();
}

class _CryptoCoinScreenState extends State<CryptoCoinScreen> {
  final _cryptoCoinDetailsBloc =
      CryptoCoinDetailsBloc(GetIt.I<AbstractCoinsRepository>());

  @override
  void initState() {
    super.initState();
    _cryptoCoinDetailsBloc
        .add(LoadCoinDetails(currencyCode: widget.coin.name, completer: null));
  }

  @override
  void dispose() {
    _cryptoCoinDetailsBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(title: Text(widget.coin.name)),
      body: BlocProvider(
        create: (_) => _cryptoCoinDetailsBloc,
        child: BlocBuilder<CryptoCoinDetailsBloc, CryptoCoinDetailsState>(
          bloc: _cryptoCoinDetailsBloc,
          builder: (context, state) {
            if (state is CryptoCoinDetailsLoaded) {
              final details = state.coin.details;
              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment:
                      MainAxisAlignment.start, // Блоки идут сверху
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.network(details.fullImageUrl,
                        height: 160, width: 160),
                    const SizedBox(height: 24),
                    _buildInfoCard([
                      _buildRow(null, details.priceInUsd, center: true),
                    ]),
                    const SizedBox(height: 16),
                    _buildInfoCard([
                      _buildRow('High 24 Hour:', details.high24Day),
                      _buildRow('Low 24 Hour:', details.low24Day),
                      _buildRow('Capitalization', details.capitalization)
                    ]),
                  ],
                ),
              );
            } else if (state is CryptoCoinDetailsLoading) {
              return const Center(
                  child: CircularProgressIndicator(
                color: Colors.blueAccent,
              ));
            } else if (state is CryptoCoinDetailsError) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Something went wrong',
                      style: theme.textTheme.labelSmall?.copyWith(fontSize: 20),
                    ),
                    Text('Please try again later',
                        style:
                            theme.textTheme.labelSmall?.copyWith(fontSize: 16)),
                    const SizedBox(height: 30),
                    TextButton(
                        onPressed: () {
                          _cryptoCoinDetailsBloc.add(LoadCoinDetails(
                              completer: null, currencyCode: widget.coin.name));
                        },
                        child: const Text('Try again')),
                  ],
                ),
              );
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }

  Widget _buildRow(String? label, String value, {bool center = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: center
          ? Center(
              child: Container(
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  value,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            )
          : Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if (label != null)
                  Text(
                    label,
                    style: const TextStyle(color: Colors.white),
                  ),
                Text(
                  value,
                  style: const TextStyle(color: Colors.white),
                ),
              ],
            ),
    );
  }

  Widget _buildInfoCard(List<Widget> children) {
    return Card(
      color: Colors.black,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(children: children),
      ),
    );
  }
}
