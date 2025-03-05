import 'package:grocery_app/core/common/api_result.dart';
import 'package:grocery_app/features/categories/domain/entities/categories_zone_entity.dart';
import 'package:grocery_app/features/categories/domain/repo/category_zone_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class CategoriesZoneUseCase {
  CategoriesZoneRepo categoriesZoneRepo;

  CategoriesZoneUseCase(this.categoriesZoneRepo);

  Future<Result<CategoriesZoneEntity?>> getCategoriesZone(int idZone) {
    return categoriesZoneRepo.getCategories(idZone);
  }
}
