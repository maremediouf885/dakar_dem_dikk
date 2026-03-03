import '../../../../core/network/api_client.dart';
import '../../../../core/constants/api_constants.dart';
import '../models/stop_model.dart';

class StopRemoteDataSource {
  final ApiClient apiClient;

  StopRemoteDataSource({required this.apiClient});

  Future<List<StopModel>> getAllStops() async {
    final response = await apiClient.get(ApiConstants.stops);
    final List<dynamic> data = response.data['data'];
    return data.map((json) => StopModel.fromJson(json)).toList();
  }
}
