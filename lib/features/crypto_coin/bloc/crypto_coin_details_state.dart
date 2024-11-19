part of 'crypto_coin_details_bloc.dart';

abstract class CryptoCoinDetailsState extends Equatable {}

class CryptoCoinDetailsInitial extends CryptoCoinDetailsState {
  @override
  List<Object?> get props => [];
}

class CryptoCoinDetailsLoading extends CryptoCoinDetailsState {
  @override
  List<Object?> get props => [];
}

class CryptoCoinDetailsLoaded extends CryptoCoinDetailsState {
  CryptoCoinDetailsLoaded({required this.coin});

  final CryptoCoin coin;

  @override
  List<Object?> get props => [coin];
}

class CryptoCoinDetailsError extends CryptoCoinDetailsState {
  CryptoCoinDetailsError({required this.exeption});

  final Object? exeption;

  @override
  List<Object?> get props => [exeption];
}
