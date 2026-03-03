import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '../../domain/entities/stop.dart';
import '../../domain/usecases/get_all_stops.dart';

part 'stop_event.dart';
part 'stop_state.dart';

class StopBloc extends Bloc<StopEvent, StopState> {
  final GetAllStops getAllStops;

  StopBloc({required this.getAllStops}) : super(StopInitial()) {
    on<LoadStops>(_onLoadStops);
  }

  Future<void> _onLoadStops(LoadStops event, Emitter<StopState> emit) async {
    emit(StopLoading());
    try {
      final stops = await getAllStops();
      emit(StopLoaded(stops: stops));
    } catch (e) {
      emit(StopError(message: e.toString()));
    }
  }
}
