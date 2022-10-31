import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:week2_state_manager/models/status.dart';
import 'package:week2_state_manager/ui/cubit/cubit/auth_cubit.dart';
import 'widgets/app_button.dart';
import 'widgets/app_text_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final etEmailController = TextEditingController();
  final etPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Week 2 - State Manager'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 30),
            child: const Text(
              "Login Screen",
              style: TextStyle(fontSize: 18),
            ),
          ),
          AppTextField(
            title: 'Email',
            controller: etEmailController,
          ),
          AppTextField(
            title: 'Password',
            controller: etPasswordController,
          ),
          BlocConsumer<AuthCubit, AuthState>(
            listener: (context, state) {
              if (state is UserAuthState && state.status == Status.success) {
                context.go('/menu');
              } else if (state is UserAuthState &&
                  state.status == Status.error) {
                ScaffoldMessenger.of(context)
                    .showSnackBar(SnackBar(content: Text(state.message!)));
              }
            },
            builder: (context, state) {
              return AppButton(
                isLoading:
                    state is UserAuthState && state.status == Status.loading,
                caption: 'Login',
                onClick: () => context.read<AuthCubit>().login(
                    etEmailController.text.trim().toString(),
                    etPasswordController.text.trim().toString()),
              );
            },
          )
        ],
      ),
    );
  }
}
