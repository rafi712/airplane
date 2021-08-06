import 'package:airplane/cubit/page_cubit.dart';
import 'package:airplane/cubit/transaction_cubit.dart';
import 'package:airplane/views/widgets/custom_button.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:airplane/shared/theme.dart';

class SuccessCheckoutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 300,
              height: 150,
              margin: EdgeInsets.only(bottom: 80),
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('assets/image_success.png'),
                ),
              ),
            ),
            Text(
              'Well Booked 😍',
              style: blackTextStyle.copyWith(
                fontSize: 32,
                fontWeight: semibold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Are you ready to explore new\nworld of experiences?',
              textAlign: TextAlign.center,
              style: greyTextStyle.copyWith(
                fontSize: 16,
                fontWeight: light,
              ),
            ),
            CustomButton(
              text: 'My Booking',
              onPressed: () {
                context.read<TransactionCubit>().fetchTransactions();
                context.read<PageCubit>().setPage(1);
                Navigator.pushNamedAndRemoveUntil(
                  context, '/main', (route) => false
                );
              },
              margin: EdgeInsets.only(top: 50),
              width: 220,
            ),
          ],
        ),
      ),
    );
  }
}
