import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:async';
import '../bloc/bus_bloc.dart';
import '../widgets/bus_arrival_card.dart';
import '../../../../core/constants/app_theme.dart';
import '../../../../core/utils/notification_service.dart';
import '../../../../injection_container.dart';

class BusArrivalPage extends StatefulWidget {
  final int stopId;
  final String stopName;

  const BusArrivalPage({
    super.key,
    required this.stopId,
    required this.stopName,
  });

  @override
  State<BusArrivalPage> createState() => _BusArrivalPageState();
}

class _BusArrivalPageState extends State<BusArrivalPage> {
  Timer? _refreshTimer;
  final NotificationService _notificationService = NotificationService();

  @override
  void initState() {
    super.initState();
    _notificationService.initialize();
    _refreshTimer = Timer.periodic(const Duration(seconds: 30), (_) {
      context.read<BusBloc>().add(LoadBusesByStop(stopId: widget.stopId));
    });
  }

  @override
  void dispose() {
    _refreshTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<BusBloc>()..add(LoadBusesByStop(stopId: widget.stopId)),
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.stopName),
        ),
        body: BlocBuilder<BusBloc, BusState>(
          builder: (context, state) {
            if (state is BusLoading) {
              return Center(
                child: CircularProgressIndicator(color: AppTheme.green),
              );
            } else if (state is BusLoaded) {
              if (state.buses.isEmpty) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.bus_alert, size: 80, color: AppTheme.green),
                      const SizedBox(height: 16),
                      Text(
                        'Aucun bus disponible',
                        style: TextStyle(fontSize: 18, color: AppTheme.green),
                      ),
                    ],
                  ),
                );
              }
              return ListView.builder(
                padding: const EdgeInsets.all(16),
                itemCount: state.buses.length,
                itemBuilder: (context, index) {
                  return BusArrivalCard(
                    bus: state.buses[index],
                    onNotify: (busNumber, minutes) {
                      _notificationService.showBusArrivalNotification(
                        busNumber,
                        minutes,
                      );
                    },
                  );
                },
              );
            } else if (state is BusError) {
              return Center(child: Text('Erreur: ${state.message}'));
            }
            return const SizedBox();
          },
        ),
      ),
    );
  }
}
