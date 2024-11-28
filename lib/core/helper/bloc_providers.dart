import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:laza_app/features/auth/domain/usecases/verify_usecase.dart';

import '../../features/auth/data/repos/auth_repo_implement.dart';
import '../../features/auth/domain/usecases/forgetpass_usecase.dart';
import '../../features/auth/domain/usecases/login_usecase.dart';
import '../../features/auth/domain/usecases/register_usecase.dart';
import '../../features/auth/domain/usecases/updatepass_usecase.dart';
import '../../features/auth/presentation/manager/ForgetPassCubit/forgetPass_cubit.dart';
import '../../features/auth/presentation/manager/LoginCubit/login_cubit.dart';
import '../../features/auth/presentation/manager/RegisterCubit/register_cubit.dart';
import '../../features/auth/presentation/manager/UpdatePassCubit/updatePass_cubit.dart';
import '../../features/auth/presentation/manager/VerifyCodeCubit/verifycode_cubit.dart';
import '../../features/cart/data/repos/cart_repo_implement.dart';
import '../../features/cart/domain/usecases/add_cart_usecase.dart';
import '../../features/cart/domain/usecases/delete_all_cart_usecase.dart';
import '../../features/cart/domain/usecases/delete_cart_usecase.dart';
import '../../features/cart/domain/usecases/fetch_cart_usecase.dart';
import '../../features/cart/presentation/manager/CartCubit/cart_cubit.dart';
import '../../features/checkout/data/repos/checkout_repo_implement.dart';
import '../../features/checkout/domain/usecases/add_address_usecase.dart';
import '../../features/checkout/domain/usecases/add_payment_usecase.dart';
import '../../features/checkout/domain/usecases/delete_order_usecase.dart';
import '../../features/checkout/domain/usecases/get_orders_usecase.dart';
import '../../features/checkout/domain/usecases/get_payment_usecase.dart';
import '../../features/checkout/domain/usecases/order_confirm_usecase.dart';
import '../../features/checkout/presentation/manager/AddressCubit/address_cubit.dart';
import '../../features/checkout/presentation/manager/OrderCubit/order_cubit.dart';
import '../../features/checkout/presentation/manager/PaymentCubit/payment_cubit.dart';
import '../../features/home/data/repos/search_repo_implement.dart';
import '../../features/home/domain/usecases/search_usecase.dart';
import '../../features/home/presentation/manager/WishlistCubit/wishlist_cubit.dart';
import '../../features/home/presentation/manager/searchCubit/search_cubit.dart';
import '../../features/product/data/repos/product_repo_implement.dart';
import '../../features/product/domain/usecases/add_wishlist_usecase.dart';
import '../../features/product/domain/usecases/delete_wishlist_usecase.dart';
import '../../features/product/domain/usecases/fetch_products_usecase.dart';
import '../../features/product/domain/usecases/fetch_wishlist_usecase.dart';
import '../../features/product/presentation/manager/ProductsCubit/products_cubit.dart';
import 'service_locator.dart';

final blocProviders = <BlocProvider>[
  BlocProvider<LoginCubit>(
    create: (context) =>
        LoginCubit(LoginUseCase(authRepo: getIt.get<AuthRepoImplement>())),
  ),
  BlocProvider<RegisterCubit>(
    create: (context) => RegisterCubit(
        RegisterUseCase(authRepo: getIt.get<AuthRepoImplement>())),
  ),
  BlocProvider<ForgetPassCubit>(
    create: (context) => ForgetPassCubit(
        ForgetPassUseCase(authRepo: getIt.get<AuthRepoImplement>())),
  ),
  BlocProvider<VerifycodeCubit>(
    create: (context) => VerifycodeCubit(
        VerifyUseCase(authRepo: getIt.get<AuthRepoImplement>())),
  ),
  BlocProvider<UpdatepassCubit>(
    create: (context) => UpdatepassCubit(
        UpdatepassUsecase(authRepo: getIt.get<AuthRepoImplement>())),
  ),
  BlocProvider<ProductsCubit>(
      create: (context) => ProductsCubit(
          FetchProductsUseCase(productRepo: getIt.get<ProductRepoImplement>()))
        ..fetchProducts(categoryId: "")),
  BlocProvider<SearchCubit>(
    create: (context) => SearchCubit(
        SearchUsecase(searchRepo: getIt.get<SearchRepoImplement>())),
  ),
  BlocProvider<CartCubit>(
      create: (context) => CartCubit(
          FetchCartUsecase(cartRepo: getIt.get<CartRepoImplement>()),
          AddCartUsecase(cartRepo: getIt.get<CartRepoImplement>()),
          DeleteCartUsecase(
            cartRepo: getIt.get<CartRepoImplement>(),
          ),
          DeleteAllCartUsecase(
            cartRepo: getIt.get<CartRepoImplement>(),
          ))
        ..fetchCart()),
  BlocProvider<OrderCubit>(
      create: (context) => OrderCubit(
          OrderConfirmUsecase(checkoutRepo: getIt.get<CheckoutRepoImplement>()),
          FetchOrderUsecase(checkoutRepo: getIt.get<CheckoutRepoImplement>()),
          DeleteOrderUsecase(checkoutRepo: getIt.get<CheckoutRepoImplement>())
          )
        ..fetchOrders()),
  BlocProvider<AddressCubit>(
      create: (context) => AddressCubit(
          AddAddressUsecase(checkoutRepo: getIt.get<CheckoutRepoImplement>()))),
  BlocProvider<PaymentCubit>(
      create: (context) => PaymentCubit(
          AddPaymentUsecase(checkoutRepo: getIt.get<CheckoutRepoImplement>()),
          GetPaymentUseCase(checkoutRepo: getIt.get<CheckoutRepoImplement>()),
          OrderConfirmUsecase(
              checkoutRepo: getIt.get<CheckoutRepoImplement>()))),
  BlocProvider<WishlistCubit>(
      create: (context) => WishlistCubit(
            FetchWishlistUseCase(productRepo: getIt<ProductRepoImplement>()),
            AddWishlistUseCase(productRepo: getIt<ProductRepoImplement>()),
            DeleteWishlistUseCase(productRepo: getIt<ProductRepoImplement>()),
          )..fetchWishlist()),
];
