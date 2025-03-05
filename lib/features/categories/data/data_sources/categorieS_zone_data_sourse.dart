import 'package:grocery_app/core/api/api_extentions.dart';
import 'package:grocery_app/core/api/api_manager/api_manager.dart';
import 'package:grocery_app/core/common/api_result.dart';
import 'package:grocery_app/features/categories/domain/entities/categories_zone_entity.dart';
import 'package:injectable/injectable.dart';

@injectable
class CategoriesZoneDataSource {
  ApiService apiService;

  CategoriesZoneDataSource(this.apiService);

  Future<Result<CategoriesZoneEntity?>> getCategoriesZone(int idZone) {
    return executeApi(
      () async {
        var response = await apiService.getCategories(idZone);

        return response.toCategoriesZoneEntity();
      },
    );
  }
}
