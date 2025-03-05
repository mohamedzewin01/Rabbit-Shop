import 'package:grocery_app/core/common/api_result.dart';
import 'package:grocery_app/features/categories/domain/entities/categories_zone_entity.dart';

abstract class CategoriesZoneRepo {
  Future<Result<CategoriesZoneEntity?>> getCategories(int idZone);
}
