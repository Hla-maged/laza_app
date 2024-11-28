import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:laza_app/features/auth/data/repos/auth_repo_implement.dart';
import 'package:laza_app/features/home/data/datasources/search_remote_data_source.dart';
import '../../features/auth/domain/usecases/forgetpass_usecase.dart';
import '../../features/auth/domain/usecases/login_usecase.dart';
import '../../features/auth/domain/usecases/register_usecase.dart';
import '../../features/auth/domain/usecases/updatepass_usecase.dart';
import '../../features/auth/domain/usecases/verify_usecase.dart';
import '../../features/auth/presentation/manager/ForgetPassCubit/forgetPass_cubit.dart';
import '../../features/auth/presentation/manager/LoginCubit/login_cubit.dart';
import '../../features/auth/presentation/manager/RegisterCubit/register_cubit.dart';
import '../../features/auth/presentation/manager/UpdatePassCubit/updatePass_cubit.dart';
import '../../features/auth/presentation/manager/VerifyCodeCubit/verifycode_cubit.dart';
import '../../features/cart/data/datasources/cart_remote_data_source.dart';
import '../../features/cart/data/repos/cart_repo_implement.dart';
import '../../features/checkout/data/datasources/checkout_remote_data_source.dart';
import '../../features/checkout/data/repos/checkout_repo_implement.dart';
import '../../features/product/data/datasources/product_remote_data_source.dart';
import '../../features/product/data/repos/product_repo_implement.dart';
import '../../features/home/data/repos/search_repo_implement.dart';
import 'api_service.dart';

final getIt = GetIt.instance;

void setUp() {
  getIt.registerSingleton<ApiService>(ApiService(Dio(BaseOptions())));
  getIt.registerSingleton<AuthRepoImplement>(
      AuthRepoImplement(apiService: getIt.get<ApiService>()));

  getIt.registerSingleton<LoginUseCase>(
      LoginUseCase(authRepo: getIt.get<AuthRepoImplement>()));
  getIt
      .registerFactory<LoginCubit>(() => LoginCubit(getIt.get<LoginUseCase>()));

  getIt.registerSingleton<RegisterUseCase>(
      RegisterUseCase(authRepo: getIt.get<AuthRepoImplement>()));
  getIt.registerFactory<RegisterCubit>(
      () => RegisterCubit(getIt.get<RegisterUseCase>()));

  getIt.registerSingleton<ForgetPassUseCase>(
      ForgetPassUseCase(authRepo: getIt.get<AuthRepoImplement>()));
  getIt.registerFactory<ForgetPassCubit>(
      () => ForgetPassCubit(getIt.get<ForgetPassUseCase>()));

  getIt.registerSingleton<VerifyUseCase>(
      VerifyUseCase(authRepo: getIt.get<AuthRepoImplement>()));
  getIt.registerFactory<VerifycodeCubit>(
      () => VerifycodeCubit(getIt.get<VerifyUseCase>()));

  getIt.registerSingleton<UpdatepassUsecase>(
      UpdatepassUsecase(authRepo: getIt.get<AuthRepoImplement>()));
  getIt.registerFactory<UpdatepassCubit>(
      () => UpdatepassCubit(getIt.get<UpdatepassUsecase>()));

  getIt.registerSingleton<ProductRepoImplement>(ProductRepoImplement(
    productRemoteDataSource:
        ProductsRemoteDataSourceImplement(getIt.get<ApiService>()),
  ));
  getIt.registerSingleton<SearchRepoImplement>(SearchRepoImplement(
    searchRemoteDataSource:
        SearchRemoteDataSourceImplement(getIt.get<ApiService>()),
  ));

  getIt.registerSingleton<CartRepoImplement>(CartRepoImplement(
      cartRemoteDataSource:
          CartRemoteDataSourceImplement(getIt.get<ApiService>())));

  getIt.registerSingleton<CheckoutRepoImplement>(CheckoutRepoImplement(
      checkoutRemoteDataSource:
          CheckoutRemoteDataSourceImplement(getIt.get<ApiService>())));
}
