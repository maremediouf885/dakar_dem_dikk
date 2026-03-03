import '../../../../core/network/api_client.dart';
import '../../../../core/constants/api_constants.dart';
import '../models/bus_model.dart';
import '../models/bus_location_model.dart';

class BusRemoteDataSource {
  final ApiClient apiClient;

  BusRemoteDataSource({required this.apiClient});

  Future<List<BusModel>> getBusesByStop(int stopId) async {
    final response = await apiClient.get(ApiConstants.stopBuses(stopId));
    final List<dynamic> data = response.data['data'];
    return data.map((json) => BusModel.fromJson(json)).toList();
  }

  Future<BusModel> getBusDetails(int busId) async {
    final response = await apiClient.get(ApiConstants.busDetails(busId));
    return BusModel.fromJson(response.data['data']);
  }

  Future<BusLocationModel> getBusLocation(int busId) async {
    final response = await apiClient.get(ApiConstants.busLocation(busId));
    return BusLocationModel.fromJson(response.data['data']);
  }
}
