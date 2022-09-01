import 'package:flutter/material.dart';
import 'package:yukminum_app/ui/pages/material.dart';
import 'package:yukminum_app/ui/pages/user/transactions/checkouts/checkout.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => const SplashScreen(),
        //* -auth-
        '/sign-in': (context) => const SignIn(),
        '/sign-up': (context) => const SignUp(),

        //* -main page-
        '/user-pages': (context) => const UserPages(),

        //* -outlet-
        '/outlet-pages': (context) => const Outlet(),

        //* -transaction pages-
        '/add-to-cart-page': (context) => const AddToCart(),
        '/checkout-page': (context) => const Checkout(),
      },
    );
  }
}
