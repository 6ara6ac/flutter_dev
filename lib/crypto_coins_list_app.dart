import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:talker_flutter/talker_flutter.dart';
import 'package:voice_chat/router/router.dart';
import 'package:voice_chat/theme/theme.dart';

class VoiceChatApp extends StatelessWidget {
  const VoiceChatApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Test project',
      theme: darktTheme,
      routes: router,
      navigatorObservers: [TalkerRouteObserver(GetIt.I<Talker>())],
    );
  }
}
