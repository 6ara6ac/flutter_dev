// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';

import 'package:equatable/equatable.dart';
import 'package:get_it/get_it.dart';
import 'package:talker_flutter/talker_flutter.dart';
import 'package:voice_chat/repositories/abstract_coins_repository.dart';
import 'package:voice_chat/repositories/models/crypto_coin.dart';
part 'crypto_coin_details_event.dart';
part 'crypto_coin_details_state.dart';

class CryptoCoinDetailsBloc
    extends Bloc<CryptoCoinDetailsEvent, CryptoCoinDetailsState> {
  final AbstractCoinsRepository coinsRepository;
  CryptoCoinDetailsBloc(this.coinsRepository)
      : super(CryptoCoinDetailsInitial()) {
    on<LoadCoinDetails>((event, emit) async {
      try {
        if (state is CryptoCoinDetailsLoaded) {
          emit(CryptoCoinDetailsLoading());
        }
        final coinDetails =
            await coinsRepository.getCoinDetails(event.currencyCode);
        emit(CryptoCoinDetailsLoaded(coin: coinDetails));
      } catch (e, st) {
        GetIt.I<Talker>().handle(e, st);
      }
    });
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    super.onError(error, stackTrace);
    GetIt.I<Talker>().handle(error, stackTrace);
  }
}
