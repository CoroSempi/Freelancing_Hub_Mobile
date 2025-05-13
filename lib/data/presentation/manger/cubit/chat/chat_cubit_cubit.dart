import 'package:bloc/bloc.dart';
import 'package:iti_freelancing_hub/core/utils/remote/Dio-Helper.dart';
import 'package:iti_freelancing_hub/data/models/chat_model.dart';
import 'package:meta/meta.dart';

part 'chat_cubit_state.dart';

class ChatCubitCubit extends Cubit<ChatCubitState> {
  ChatCubitCubit() : super(ChatCubitInitial());

  List<MessageModel> _messages = [];

  List<MessageModel> get messages => _messages;

  Future<void> fetchChat() async {
    emit(ChatLoading());
    try {
      final response = await DioHelper.getChat();
      final chatList = response.data['ChatRoom'] as List;

      _messages = chatList.map((e) => MessageModel.fromJson(e)).toList();

      emit(ChatLoaded(_messages));
    } catch (e) {
      emit(ChatError(e.toString()));
    }
  }

  Future<void> sendMessage(String content) async {
    try {
      final messageData = {'content': content};

      await DioHelper.sendMessage(messageData);

      // Reload chat after sending
      await fetchChat();
    } catch (e) {
      emit(ChatError(e.toString()));
    }
  }
}
