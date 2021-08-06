import 'package:airplane/models/destination_model.dart';
import 'package:airplane/models/transaction_model.dart';
import 'package:airplane/views/pages/sign_in_page.dart';
import 'package:flutter/material.dart';

import 'package:airplane/views/pages/success_checkout_page.dart';
import 'package:airplane/views/pages/checkout_page.dart';
import 'package:airplane/views/pages/choose_seat_page.dart';
import 'package:airplane/views/pages/detail_page.dart';
import 'package:airplane/views/pages/bonus_page.dart';
import 'package:airplane/views/pages/get_started_page.dart';
import 'package:airplane/views/pages/main_page.dart';
import 'package:airplane/views/pages/sign_up_page.dart';
import 'package:airplane/views/pages/splash_page.dart';

class AppRouter {
  static Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (context) => SplashPage());
      case '/get-started':
        return MaterialPageRoute(builder: (context) => GetStartedPage());
      case '/sign-up':
        return MaterialPageRoute(builder: (context) => SignUpPage());
      case '/sign-in':
        return MaterialPageRoute(builder: (context) => SignInPage());
      case '/bonus':
        return MaterialPageRoute(builder: (context) => BonusPage());
      case '/main':
        return MaterialPageRoute(builder: (context) => MainPage());
      case '/detail':
        return MaterialPageRoute(builder: (context) => DetailPage(
          settings.arguments as DestinationModel
        ));
      case '/choose-seat':
        return MaterialPageRoute(builder: (context) => ChooseSeatPage(
          settings.arguments as DestinationModel
        ));
      case '/checkout':
        return MaterialPageRoute(builder: (context) => CheckoutPage(
          settings.arguments as TransactionModel
        ));
      case '/success-checkout':
        return MaterialPageRoute(builder: (context) => SuccessCheckoutPage());
      default:
        return MaterialPageRoute(builder: (context) => GetStartedPage());
    }
  }
}
