import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/stop_bloc.dart';
import '../widgets/nearby_stop_card.dart';
import '../../../../core/constants/app_theme.dart';
import '../../../../core/utils/location_service.dart';
import '../../../../injection_container.dart';

class NearbyStopsPage extends StatelessWidget {
  final double userLatitude;
  final double userLongitude;

  const NearbyStopsPage({
    super.key,
    required this.userLatitude,
    required this.userLongitude,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<StopBloc>()..add(LoadStops()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Arrêts proches'),
        ),
        body: BlocBuilder<StopBloc, StopState>(
          builder: (context, state) {
            if (state is StopLoading) {
              return Center(
                child: CircularProgressIndicator(color: AppTheme.green),
              );
            } else if (state is StopLoaded) {
              final locationService = LocationService();
              final stopsWithDistance = state.stops.map((stop) {
                final distance = locationService.calculateDistance(
                  userLatitude,
                  userLongitude,
                  stop.latitude,
                  stop.longitude,
                );
                return stop.copyWith(distance: distance);
              }).toList()
                ..sort((a, b) => a.distance!.compareTo(b.distance!));

              final nearbyStops = stopsWithDistance.take(5).toList();

              return ListView.builder(
                padding: const EdgeInsets.all(16),
                itemCount: nearbyStops.length,
                itemBuilder: (context, index) {
                  return NearbyStopCard(stop: nearbyStops[index]);
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
