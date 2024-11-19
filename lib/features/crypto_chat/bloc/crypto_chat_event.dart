part of 'crypto_chat_bloc.dart';

abstract class ChatEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoadMessages extends ChatEvent {}

class SendMessage extends ChatEvent {
  final ChatMessage message;

  SendMessage(this.message);

  @override
  List<Object?> get props => [message];
}
