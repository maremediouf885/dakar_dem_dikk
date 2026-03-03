import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/stop_bloc.dart';
import '../widgets/stop_list_item.dart';
import '../../../../injection_container.dart';

class StopsPage extends StatelessWidget {
  const StopsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<StopBloc>()..add(LoadStops()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Arrêts de Bus'),
          backgroundColor: Colors.blue,
        ),
        body: BlocBuilder<StopBloc, StopState>(
          builder: (context, state) {
            if (state is StopLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is StopLoaded) {
              return ListView.builder(
                itemCount: state.stops.length,
                itemBuilder: (context, index) {
                  return StopListItem(stop: state.stops[index]);
                },
              );
            } else if (state is StopError) {
              return Center(child: Text('Erreur: ${state.message}'));
            }
            return const Center(child: Text('Aucun arrêt'));
          },
        ),
      ),
    );
  }
}
