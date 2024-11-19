part of 'crypto_coin_details_bloc.dart';

abstract class CryptoCoinDetailsEvent extends Equatable {
  const CryptoCoinDetailsEvent();

  @override
  List<Object> get props => [];
}

class LoadCoinDetails extends CryptoCoinDetailsEvent {
  const LoadCoinDetails({required this.currencyCode, required completer});
  final String currencyCode;

  @override
  List<Object> get props => super.props..add(currencyCode);
}
