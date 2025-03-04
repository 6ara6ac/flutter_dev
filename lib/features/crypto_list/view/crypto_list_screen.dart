import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:talker_flutter/talker_flutter.dart';
import 'package:voice_chat/features/crypto_list/bloc/crypto_list_bloc.dart';
import 'package:voice_chat/repositories/repositories.dart';
import '../widgets/widgets.dart';

class CryptoListScreen extends StatefulWidget {
  const CryptoListScreen({super.key, required this.title});

  final String title;

  @override
  State<CryptoListScreen> createState() => _CryptoListScreenState();
}

class _CryptoListScreenState extends State<CryptoListScreen> {
  final _cryptoListBloc = CryptoListBloc(GetIt.I<AbstractCoinsRepository>());

  @override
  void initState() {
    _cryptoListBloc.add(LoadCryptoList(completer: null));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) =>
                          TalkerScreen(talker: GetIt.I<Talker>())));
                },
                icon: const Icon(
                  Icons.document_scanner_outlined,
                ))
          ],
        ),
        body: RefreshIndicator(
            onRefresh: () async {
              final completer = Completer();
              _cryptoListBloc.add(LoadCryptoList(completer: completer));
              return completer.future;
            },
            child: BlocBuilder<CryptoListBloc, CryptoListState>(
              bloc: _cryptoListBloc,
              builder: (context, state) {
                if (state is CryptoListLoaded) {
                  return ListView.separated(
                      padding: const EdgeInsets.only(top: 16),
                      separatorBuilder: (context, index) => const Divider(),
                      itemCount: state.coinsList.length,
                      itemBuilder: (context, i) {
                        final coin = state.coinsList[i];
                        return CryptoCoinTile(coin: coin);
                      });
                }
                if (state is CryptoListFailure) {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Something went wrong',
                          style: theme.textTheme.labelSmall
                              ?.copyWith(fontSize: 20),
                        ),
                        Text('Please try again later',
                            style: theme.textTheme.labelSmall
                                ?.copyWith(fontSize: 16)),
                        const SizedBox(height: 30),
                        TextButton(
                            onPressed: () {
                              _cryptoListBloc
                                  .add(LoadCryptoList(completer: null));
                            },
                            child: const Text('Try again')),
                      ],
                    ),
                  );
                }
                return const Center(child: CircularProgressIndicator());
              },
            ))

        // (_cryptoCoinsList == null)
        //     ? const Center(child: CircularProgressIndicator())
        //     : ListView.separated(
        //         padding: const EdgeInsets.only(top: 16),
        //         separatorBuilder: (context, index) => const Divider(),
        //         itemCount: _cryptoCoinsList!.length,
        //         itemBuilder: (context, i) {
        //           final coin = _cryptoCoinsList![i];
        //           return CryptoCoinTile(coin: coin);
        //         }),
        );
  }
}
