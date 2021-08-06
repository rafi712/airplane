import 'package:airplane/cubit/auth_cubit.dart';
import 'package:airplane/cubit/page_cubit.dart';
import 'package:airplane/shared/theme.dart';
import 'package:airplane/views/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is AuthInitial) {
            context.read<PageCubit>().setPage(0);
            Navigator.pushNamedAndRemoveUntil(
              context, '/sign-in', (route) => false
            );
          } else if (state is AuthFailed) {
            ScaffoldMessenger.of(context)
            ..removeCurrentSnackBar()
            ..showSnackBar(
              SnackBar(
                backgroundColor: redColor,
                duration: Duration(seconds: 2),
                content: Text(state.errorMessage)
              )
            );  
          }
        },
        builder: (context, state) {
          if (state is AuthLoading) {
            return CircularProgressIndicator();
          }
          return CustomButton(
            text: 'Sign Out',
            width: 220,
            onPressed: () {
              context.read<AuthCubit>().signOut();
            }
          );
        },
      ),
    );
  }
}