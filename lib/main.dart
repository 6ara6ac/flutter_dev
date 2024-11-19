import 'dart:async';
import 'package:firebase_core/firebase_core.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:voice_chat/repositories/models/crypto_chat_message.dart';
import 'firebase_options.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:talker_bloc_logger/talker_bloc_logger.dart';
import 'package:talker_dio_logger/talker_dio_logger_interceptor.dart';
import 'package:talker_dio_logger/talker_dio_logger_settings.dart';
import 'package:talker_flutter/talker_flutter.dart';
import 'package:voice_chat/crypto_coins_list_app.dart';
import 'repositories/repositories.dart';

const cryptoCoinsBoxName = 'crypto_coins_box';

void main() {
  runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();

    final talker = TalkerFlutter.init();
    GetIt.I.registerSingleton(talker);
    GetIt.I<Talker>().debug('talker started...');

    await Hive.initFlutter();
    Hive.registerAdapter(CryptoCoinAdapter());
    Hive.registerAdapter(CryptoCoinDetailsAdapter());
    Hive.registerAdapter(ChatMessageAdapter());

    final cryptoCoinsBox = await Hive.openBox<CryptoCoin>(cryptoCoinsBoxName);

    // final app = await Firebase.initializeApp(
    //   options: DefaultFirebaseOptions.currentPlatform,
    // );

    // talker.info(app.options.projectId);

    final dio = Dio();
    dio.interceptors.add(
      TalkerDioLogger(
        talker: talker,
        settings: const TalkerDioLoggerSettings(printResponseData: false),
      ),
    );

    Bloc.observer = TalkerBlocObserver(
      talker: talker,
      settings: const TalkerBlocLoggerSettings(
        printEventFullData: false,
        printStateFullData: false,
      ),
    );

    GetIt.I.registerLazySingleton<AbstractCoinsRepository>(
      () => CryptoCoinsRepository(
        dio: dio,
        cryptoCoinsBox: cryptoCoinsBox,
      ),
    );

    FlutterError.onError =
        (details) => GetIt.I<Talker>().handle(details.exception, details.stack);

    runApp(const VoiceChatApp());
  }, (error, stack) {
    GetIt.I<Talker>().handle(error, stack);
  });
}
