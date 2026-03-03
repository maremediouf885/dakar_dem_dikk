import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/bus_bloc.dart';
import '../widgets/bus_list_item.dart';
import '../../../../injection_container.dart';

class BusesPage extends StatelessWidget {
  final int stopId;
  final String stopName;

  const BusesPage({super.key, required this.stopId, required this.stopName});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<BusBloc>()..add(LoadBusesByStop(stopId: stopId)),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Bus à $stopName'),
          backgroundColor: Colors.blue,
        ),
        body: BlocBuilder<BusBloc, BusState>(
          builder: (context, state) {
            if (state is BusLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is BusLoaded) {
              if (state.buses.isEmpty) {
                return const Center(child: Text('Aucun bus disponible'));
              }
              return ListView.builder(
                itemCount: state.buses.length,
                itemBuilder: (context, index) {
                  return BusListItem(bus: state.buses[index]);
                },
              );
            } else if (state is BusError) {
              return Center(child: Text('Erreur: ${state.message}'));
            }
            return const Center(child: Text('Aucun bus'));
          },
        ),
      ),
    );
  }
}
