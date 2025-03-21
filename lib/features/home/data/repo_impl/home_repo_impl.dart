import 'package:grocery_app/core/common/api_result.dart';
import 'package:grocery_app/features/home/data/data_sources/home_data_source_repo.dart';
import 'package:grocery_app/features/home/domain/entities/home_entities.dart';
import 'package:injectable/injectable.dart';

import '../../domain/repo/home_repo.dart';

@Injectable(as: HomeRepo)
class HomeRepoImpl implements HomeRepo {
  HomeDataSourceRepo homeDataSourceRepo;

  HomeRepoImpl(this.homeDataSourceRepo);

  @override
  Future<Result<HomeEntity?>> getHomeData(int idZone) {
    return homeDataSourceRepo.getHomeData(idZone);
  }
}
