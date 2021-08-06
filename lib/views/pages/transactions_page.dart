import 'package:airplane/cubit/transaction_cubit.dart';
import 'package:airplane/views/widgets/transaction_card.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:airplane/shared/theme.dart';
import 'package:flutter/material.dart';

class TransactionsPage extends StatefulWidget {
  @override
  _TransactionsPageState createState() => _TransactionsPageState();
}

class _TransactionsPageState extends State<TransactionsPage> {
  @override
  void initState() {
    super.initState();
    // context.read<TransactionCubit>().fetchTransactions();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TransactionCubit, TransactionState>(
      builder: (context, state) {
        if (state is TransactionLoading) {
          return Center(child: CircularProgressIndicator());
        } else if (state is TransactionSuccess) {
          if (state.transactions.isEmpty) return Center(
            child: Text(
              'You don\'t have any transaction.',
              style: blackTextStyle.copyWith(
                fontSize: 18,
              ),
            ),
          );
         
          return Container(
            child: ListView.builder(
              padding: EdgeInsets.all(defaultMargin).copyWith(bottom: 120),
              itemCount: state.transactions.length,
              itemBuilder: (context, index) {
                return TransactionCard(state.transactions[index]);
              },
            ),
          );
        } else if (state is TransactionFailed) {
          return Center(child: Text(state.message));
        }
        return Center(
          child: Text(
            'Transactions Page',
            style: blackTextStyle.copyWith(fontSize: 18),
          ),
        );
      },
    );
  }
}
