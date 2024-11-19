import 'package:hive/hive.dart';
import './models/crypto_chat_message.dart';

class ChatRepository {
  final Box<ChatMessage> _box;

  ChatRepository(this._box);

  Future<void> addMessage(ChatMessage message) async {
    await _box.add(message);
  }

  List<ChatMessage> getMessages() {
    return _box.values.toList();
  }

  Future<void> deleteMessage(int index) async {
    await _box.deleteAt(index);
  }
}
