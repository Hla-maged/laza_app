import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../checkout/presentation/views/order_view.dart';
import '../../../product/presentation/manager/ProductsCubit/products_cubit.dart';
import 'cart_view.dart';
import 'home_view.dart';
import 'wishlist_view.dart';

class BottomNavigationView extends StatefulWidget {
  const BottomNavigationView(
      {super.key,
      required this.toggleTheme,
      required this.user,
      required this.email});
  final VoidCallback toggleTheme;
  final String user, email;

  @override
  State<BottomNavigationView> createState() => _BottomNavigationViewState();
}

class _BottomNavigationViewState extends State<BottomNavigationView> {
  int selectedIndex = 0;
  PageController pageController = PageController();

  void onTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
    pageController.jumpToPage(index);
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    BlocProvider.of<ProductsCubit>(context).fetchProducts(categoryId: "");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
        body: PageView(
          controller: pageController,
          onPageChanged: (index) {
            setState(() {
              selectedIndex = index;
            });
          },
          physics: const NeverScrollableScrollPhysics(),
          children: [
            HomeView(
                toggleTheme: widget.toggleTheme,
                user: widget.user,
                email: widget.email),
            const WishListView(),
            const CartView(),
            const OrderView(),
            
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: selectedIndex,
          onTap: onTapped,
          selectedItemColor: Colors.grey,
          unselectedItemColor: Colors.grey,
          items: [
            BottomNavigationBarItem(
                icon: selectedIndex == 0
                    ? const Text('Home')
                    : const Icon(Icons.home_outlined),
                label: ''),
            BottomNavigationBarItem(
                icon: selectedIndex == 1
                    ? const Text('Wishlist')
                    : const Icon(Icons.favorite_border),
                label: ''),
                BottomNavigationBarItem(
                icon: selectedIndex == 2
                    ? const Text('Cart')
                    : const Icon(Icons.shopping_bag_outlined),
                label: ''),
            BottomNavigationBarItem(
                icon: selectedIndex == 3
                    ? const Text('Orders')
                    : const Icon(Icons.wallet_outlined),
                label: ''),
            
          ],
        ));
  }
}
