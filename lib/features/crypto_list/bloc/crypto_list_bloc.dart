import 'dart:async';

// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:get_it/get_it.dart';
import 'package:talker_flutter/talker_flutter.dart';
import 'package:voice_chat/repositories/abstract_coins_repository.dart';
import 'package:voice_chat/repositories/models/crypto_coin.dart';

part 'crypto_list_event.dart';
part 'crypto_list_state.dart';

class CryptoListBloc extends Bloc<CryptoListEvent, CryptoListState> {
  final AbstractCoinsRepository coinsRepository;
  CryptoListBloc(this.coinsRepository) : super(CryptoListInitial()) {
    on<LoadCryptoList>((event, emit) async {
      // ignore: unused_local_variable
      try {
        if (state is CryptoListLoaded) {
          emit(CryptoListLoading());
        }
        final coinsList = await coinsRepository.getCoinsList();
        emit(CryptoListLoaded(coinsList: coinsList));
      } catch (e, st) {
        emit(CryptoListFailure(exeption: e));
        GetIt.I<Talker>().handle(e, st);
      } finally {
        event.completer?.complete();
      }
    });
  }
}
