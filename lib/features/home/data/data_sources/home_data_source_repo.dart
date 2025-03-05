import 'package:grocery_app/core/common/api_result.dart';
import 'package:grocery_app/features/home/domain/entities/home_entities.dart';

abstract class HomeDataSourceRepo {
  Future<Result<HomeEntity?>> getHomeData(int idZone);
}
