import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'core/helper/bloc_providers.dart';
import 'core/helper/service_locator.dart';
import 'features/Intro/presentation/views/splash_view.dart';
import '../../features/auth/presentation/views/forgot_password_view.dart';
import '../../features/auth/presentation/views/new_password_view.dart';
import '../../features/auth/presentation/views/sign_in_view.dart';
import '../../features/auth/presentation/views/sign_up_view.dart';
import '../../features/auth/presentation/views/verfication_view.dart';
import '../../features/cart/presentation/views/cart_items_view.dart';
import '../../features/checkout/presentation/views/add_new_card_view.dart';
import '../../features/checkout/presentation/views/address_view.dart';
import '../../features/checkout/presentation/views/order_confirmed_view.dart';
import '../../features/checkout/presentation/views/order_view.dart';
import '../../features/checkout/presentation/views/payment_view.dart';
import '../../features/home/presentation/views/adidas_view.dart';
import '../../features/home/presentation/views/bottom_navigation_view.dart';
import '../../features/home/presentation/views/fila_view.dart';
import '../../features/home/presentation/views/nike_view.dart';
import '../../features/home/presentation/views/puma_view.dart';
import '../../features/home/presentation/views/search_view.dart';
import '../../features/home/presentation/views/wishlist_view.dart';
import '../../features/product/presentation/views/add_review_view.dart';
import '../../features/product/presentation/views/product_details_view.dart';
import '../../features/product/presentation/views/review_view.dart';

void main() async {
  setUp();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeMode themeMode = ThemeMode.light;
  void toggleTheme() {
    setState(() {
      themeMode =
          themeMode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MultiBlocProvider(
            providers: blocProviders,
            child: MaterialApp(
              routes: {
                'signUp': (context) => SignUpView(
                      toggleTheme: toggleTheme,
                    ),
                'signIn': (context) => SignInView(
                      toggleTheme: toggleTheme,
                      email: '',
                      user: '',
                    ),
                'parent': (context) => BottomNavigationView(
                      toggleTheme: toggleTheme,
                      email: '',
                      user: '',
                    ),
                'forgotPass': (context) => const ForgotPasswordView(),
                'verify': (context) => const VerficationView(),
                'newPass': (context) => const NewPasswordView(),
                'search': (context) => const SearchView(),
                'productDetails': (context) => const ProductDetailsView(),
                'review': (context) => const ReviewView(),
                'addReview': (context) => const AddReviewView(),
                'adidas': (context) => const AdidasView(),
                'nike': (context) => const NikeView(),
                'puma': (context) => const PumaView(),
                'fila': (context) => const FilaView(),
                'address': (context) => const AddressView(),
                'payment': (context) => const PaymentView(),
                'cart': (context) => const CartItemsView(),
                'checkout': (context) => const OrderConfirmedView(),
                'addNewCard': (context) => const AddNewCardView(),
                'order': (context) => const OrderView(),
                'wishlist': (context) => const WishListView(),
  
              },
              debugShowCheckedModeBanner: false,
              theme: ThemeData.light(),
              darkTheme: ThemeData.dark(),
              themeMode: themeMode,
              home: SplashView(toggleTheme: toggleTheme),
            ),
          );
        });
  }
}
