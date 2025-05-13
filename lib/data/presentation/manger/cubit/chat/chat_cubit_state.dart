part of 'chat_cubit_cubit.dart';

@immutable
sealed class ChatCubitState {}

final class ChatCubitInitial extends ChatCubitState {}

final class ChatLoading extends ChatCubitState {}

final class ChatLoaded extends ChatCubitState {
  final List<MessageModel> messages;

  ChatLoaded(this.messages);
}

final class ChatError extends ChatCubitState {
  final String error;

  ChatError(this.error);
}
