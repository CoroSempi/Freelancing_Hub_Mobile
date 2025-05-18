part of 'profile_cubit.dart';

abstract class ProfileState extends Equatable {
  const ProfileState();

  @override
  List<Object?> get props => [];
}

class ProfileInitial extends ProfileState {}

class ProfileLoading extends ProfileState {}

class ProfileLoaded extends ProfileState {
  final String avatarUrl;

  const ProfileLoaded(this.avatarUrl);

  @override
  List<Object?> get props => [avatarUrl];
}

class ProfileAvatarUpdated extends ProfileState {
  final String avatarUrl;

  const ProfileAvatarUpdated(this.avatarUrl);

  @override
  List<Object?> get props => [avatarUrl];
}

class ProfileError extends ProfileState {
  final String message;

  const ProfileError(this.message);

  @override
  List<Object?> get props => [message];
}
