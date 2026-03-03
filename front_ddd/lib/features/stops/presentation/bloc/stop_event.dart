part of 'stop_bloc.dart';

abstract class StopEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoadStops extends StopEvent {}
