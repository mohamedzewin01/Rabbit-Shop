import 'package:grocery_app/core/common/api_result.dart';
import 'package:grocery_app/features/home/domain/entities/home_entities.dart';
import 'package:grocery_app/features/home/domain/repo/home_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class HomeUseCase {
  HomeRepo homeRepo;

  HomeUseCase(this.homeRepo);

  Future<Result<HomeEntity?>> getHomeData(int idZone) {
    return homeRepo.getHomeData(idZone);
  }
}
