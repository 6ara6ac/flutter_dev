import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:voice_chat/repositories/chat_repository.dart';
import 'package:voice_chat/repositories/models/crypto_chat_message.dart';

part 'crypto_chat_event.dart';
part 'crypto_chat_state.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  final ChatRepository chatRepository;

  ChatBloc(this.chatRepository) : super(ChatInitial()) {
    on<LoadMessages>((event, emit) {
      final messages = chatRepository.getMessages();
      emit(ChatLoaded(messages));
    });

    on<SendMessage>((event, emit) async {
      if (state is ChatLoaded) {
        try {
          await chatRepository.addMessage(event.message);
          final updatedMessages = chatRepository.getMessages();
          emit(ChatLoaded(updatedMessages));
        } catch (e) {
          emit(ChatError(e.toString()));
        }
      }
    });
  }
}
