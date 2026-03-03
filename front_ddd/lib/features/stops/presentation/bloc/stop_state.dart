part of 'stop_bloc.dart';

abstract class StopState extends Equatable {
  @override
  List<Object?> get props => [];
}

class StopInitial extends StopState {}

class StopLoading extends StopState {}

class StopLoaded extends StopState {
  final List<Stop> stops;

  StopLoaded({required this.stops});

  @override
  List<Object?> get props => [stops];
}

class StopError extends StopState {
  final String message;

  StopError({required this.message});

  @override
  List<Object?> get props => [message];
}
