import 'package:airplane/cubit/auth_cubit.dart';
import 'package:airplane/cubit/destination_cubit.dart';
import 'package:airplane/cubit/transaction_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:airplane/shared/theme.dart';
import 'package:airplane/views/widgets/custom_button.dart';
import 'package:airplane/views/widgets/custom_text_form_field.dart';

class SignInPage extends StatefulWidget {

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  late final TextEditingController emailController;
  late final TextEditingController nameController;
  late final TextEditingController passwordController;
  late final TextEditingController hobbyController;

  @override
  void initState() {
    nameController = TextEditingController();
    passwordController = TextEditingController();
    hobbyController = TextEditingController();
    emailController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    passwordController.dispose();
    hobbyController.dispose();
    emailController.dispose();
    nameController.dispose();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    Widget title() {
    return Container(
      margin: EdgeInsets.only(top: 30),
      child: Text(
        'Sign in with your\nexisting account',
        style: blackTextStyle.copyWith(
          fontSize: 24,
          fontWeight: semibold,
        ),
      ),
    );
  }

  Widget signUpButton() {
    return GestureDetector(
      onTap: () {
        Navigator.pushReplacementNamed(context, '/sign-up');
      },
      child: Container(
        alignment: Alignment.center,
        margin: EdgeInsets.only(bottom: 73, top: 50),
        child: Text(
          'Don\'t have an account? Sign Up',
          style: greyTextStyle.copyWith(
            fontSize: 16,
            fontWeight: light,
            decoration: TextDecoration.underline,
          ),
        ),
      ),
    );
  }

  Widget inputSection() {
    Widget submitButton() {
      return BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is AuthSuccess) {
            context.read<DestinationCubit>().fetchDestination();
            context.read<TransactionCubit>().fetchTransactions();
            
            Navigator.pushNamedAndRemoveUntil(
              context, '/main', (route) => false
            );
          } else if (state is AuthFailed) {
            ScaffoldMessenger.of(context)
            ..removeCurrentSnackBar()
            ..showSnackBar(
              SnackBar(
                backgroundColor: redColor,
                duration: Duration(seconds: 2),
                content: Text(
                  state.errorMessage,
                  style: whiteTextStyle.copyWith(
                    fontSize: 15
                  ),
                )
              )
            );             // .show
          }
        },
        builder: (context, state) {
          if (state is AuthLoading) {
            return Center(child: CircularProgressIndicator());
          }
          return CustomButton(
              text: 'Get Started',
              margin: EdgeInsets.only(top: 10),
              onPressed: () async {
                context.read<AuthCubit>().signIn(
                  email: emailController.text,
                  password: passwordController.text,
                );
              },
            );
        },
      );
    }

    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(top: 30),
      padding: EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 30,
      ),
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(defaultRadius),
      ),
      child: Column(
        children: [
          CustomTextFormField(
            title: 'Email Address',
            hintText: 'Your email address',
            keyboardType: TextInputType.emailAddress,
            controller: emailController,
          ),
          CustomTextFormField(
            title: 'Password',
            hintText: 'Your password',
            obscureText: true,
            controller: passwordController,
          ),
          submitButton(),
        ],
      ),
    );
  }
    return Scaffold(
      backgroundColor: backgroundColor,
      body: GestureDetector(
        onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
        child: SafeArea(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: defaultMargin),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                title(),
                inputSection(),
                signUpButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
