part of 'chats_cubit.dart';

@immutable
sealed class ChatsState {}

final class ChatsStateLoading extends ChatsState {}

final class ChatsStateLoaded extends ChatsState {}

final class ChatsStateEmpty extends ChatsState {}