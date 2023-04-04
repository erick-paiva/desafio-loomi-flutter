import 'package:get_it/get_it.dart';
import 'package:loomi_flutter_boilerplate/src/domain/repositories/i_cart_repository.dart';
import 'package:loomi_flutter_boilerplate/src/domain/repositories/i_login_repository.dart';
import 'package:loomi_flutter_boilerplate/src/domain/repositories/i_pagination_example_repository%20copy.dart';
import 'package:loomi_flutter_boilerplate/src/domain/repositories/i_paint_repository.dart';
import 'package:loomi_flutter_boilerplate/src/domain/repositories/i_profile_repository.dart';
import 'package:loomi_flutter_boilerplate/src/domain/repositories/i_signup_repository.dart';
import 'package:loomi_flutter_boilerplate/src/domain/usecases/get_login_uc.dart';
import 'package:loomi_flutter_boilerplate/src/domain/usecases/get_paginated_example_uc.dart';
import 'package:loomi_flutter_boilerplate/src/domain/usecases/get_paint_uc.dart';
import 'package:loomi_flutter_boilerplate/src/domain/usecases/get_profile_uc.dart';
import 'package:loomi_flutter_boilerplate/src/domain/usecases/post_cart_uc.dart';
import 'package:loomi_flutter_boilerplate/src/domain/usecases/post_signup_uc.dart';
import 'package:loomi_flutter_boilerplate/src/domain/usecases/search_paint_uc.dart';
import 'package:loomi_flutter_boilerplate/src/external/datasources/cart_datasource.dart';
import 'package:loomi_flutter_boilerplate/src/external/datasources/login_datasource.dart';
import 'package:loomi_flutter_boilerplate/src/external/datasources/pagination_example_datasource.dart';
import 'package:loomi_flutter_boilerplate/src/external/datasources/paint_datasource.dart';
import 'package:loomi_flutter_boilerplate/src/external/datasources/profile_datasource.dart';
import 'package:loomi_flutter_boilerplate/src/external/datasources/signup_datasource.dart';
import 'package:loomi_flutter_boilerplate/src/presentation/stores/custom_loader_store.dart';
import 'package:loomi_flutter_boilerplate/src/presentation/usecases/i_get_login_uc.dart';
import 'package:loomi_flutter_boilerplate/src/presentation/usecases/i_get_paginated_example_uc.dart';
import 'package:loomi_flutter_boilerplate/src/presentation/usecases/i_get_paint_uc.dart';
import 'package:loomi_flutter_boilerplate/src/presentation/usecases/i_get_profile_uc.dart';
import 'package:loomi_flutter_boilerplate/src/presentation/usecases/i_post_cart_uc.dart';
import 'package:loomi_flutter_boilerplate/src/presentation/usecases/i_post_signup_uc.dart';
import 'package:loomi_flutter_boilerplate/src/presentation/usecases/i_search_paint_uc.dart';

import '../../domain/repositories/i_example_repository.dart';
import '../../domain/usecases/get_example_uc.dart';
import '../../external/datasources/example_datasource.dart';
import '../../presentation/stores/example_store.dart';
import '../../presentation/usecases/i_get_example_uc.dart';
import '../dio_config.dart';

void setupGetIt() {
  //Stores
  GetIt.I.registerSingleton<ExampleStore>(ExampleStore());
  GetIt.I.registerSingleton<CustomLoaderStore>(CustomLoaderStore());
  //Datasources
  GetIt.I.registerSingleton<IExampleRepository>(
    ExampleDatasource(DioConfig().dio),
  );
  GetIt.I.registerSingleton<IPaginationExampleRepository>(
    PaginationExampleDatasource(DioConfig().dio),
  );
  GetIt.I.registerSingleton<ILoginRepository>(
    LoginDatasource(DioConfig().dio),
  );
  GetIt.I.registerSingleton<ISignupRepository>(
    SignupDatasource(DioConfig().dio),
  );
  GetIt.I.registerSingleton<IPaintRepository>(
    PaintDatasource(DioConfig().dio),
  );
  GetIt.I.registerSingleton<IProfileRepository>(
    ProfileDatasource(DioConfig().dio),
  );
  GetIt.I.registerSingleton<ICartRepository>(
    CartDatasource(DioConfig().dio),
  );

  //Usecases
  GetIt.I.registerSingleton<IGetExampleUseCase>(GetExampleUseCase());
  GetIt.I.registerSingleton<IGetPaginationExampleUC>(GetPaginationExampleUC());

  GetIt.I.registerSingleton<IGetLoginUseCase>(GetLoginUC());
  GetIt.I.registerSingleton<IPostSignupUseCase>(PostSignupUC());

  GetIt.I.registerSingleton<IGetPaintUseCase>(GetPaintUC());
  GetIt.I.registerSingleton<ISearchPaintUseCase>(SearchPaintUC());

  GetIt.I.registerSingleton<IPostCartUseCase>(PostCartUC());

  GetIt.I.registerSingleton<IGetProfileUseCase>(GetProfileUC());
}
