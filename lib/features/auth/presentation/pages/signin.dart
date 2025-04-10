import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:truck_management_app/common/bloc/button/button_state.dart';
import 'package:truck_management_app/common/bloc/button/button_state_cubit.dart';
import 'package:truck_management_app/common/widgets/app_button.dart';
import 'package:truck_management_app/core/error/failures.dart';
import 'package:truck_management_app/features/auth/domain/entities/signin_req_params.dart';
import 'package:truck_management_app/features/auth/domain/usecases/signin.dart';
import 'package:truck_management_app/features/auth/presentation/bloc/auth_state_cubit.dart';
import 'package:truck_management_app/service_locator.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_sizes.dart';
import '../../../../core/util/validators/auth_validators.dart';
import '../../../../common/widgets/dismiss_keyboard_wrapper.dart';
import './signup.dart';
import './forgot_password/forgot_password_page.dart';

class SigninPage extends StatefulWidget {
  const SigninPage({super.key});

  @override
  State<SigninPage> createState() => _SigninPageState();
}

class _SigninPageState extends State<SigninPage> {
  final _formKey = GlobalKey<FormState>();
  bool _obscurePassword = true;

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  void _handleSubmit(BuildContext context) {
    if (_formKey.currentState?.validate() ?? false) {
      // Implement login logic
      context.read<ButtonStateCubit>().execute(
        params: SigninReqParams(
          email: _emailController.text.toLowerCase(),
          password: _passwordController.text,
        ),
        usecase: getIt<SigninUsecase>(),
      );
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return BlocProvider(
      create: (context) => ButtonStateCubit(),
      child: BlocListener<ButtonStateCubit, ButtonState>(
        listener: (context, state) {
          if (state is ButtonSuccessState) {
            context.read<AuthStateCubit>().signInSuccess();
          } else if (state is ButtonFailureState &&
              state.error is GeneralFailure) {
            var snackBar = SnackBar(content: Text(state.error.message));
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          }
        },
        child: Scaffold(
          resizeToAvoidBottomInset: true,
          body: SafeArea(
            child: DismissKeyboardWrapper(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(AppSizes.paddingL),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const SizedBox(height: AppSizes.spacingXXL),
                      Text(
                        'Welcome Back',
                        style: theme.textTheme.headlineLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: AppSizes.spacingS),
                      Text(
                        'Sign in to your account to continue',
                        style: theme.textTheme.bodyMedium,
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: AppSizes.spacingXXL),
                      TextFormField(
                        controller: _emailController,
                        validator: AuthValidators.validateEmail,
                        keyboardType: TextInputType.emailAddress,
                        decoration: const InputDecoration(
                          labelText: 'Email',
                          hintText: 'Example@gmail.com',
                        ),
                      ),
                      const SizedBox(height: AppSizes.spacingM),
                      BlocBuilder<ButtonStateCubit, ButtonState>(
                        builder: (context, state) {
                          return TextFormField(
                            controller: _passwordController,
                            validator:
                                (value) => AuthValidators.validatePassword(
                                  value,
                                  isLogin: true,
                                ),
                            obscureText: _obscurePassword,
                            decoration: InputDecoration(
                              labelText: 'Password',
                              errorText:
                                  state is ButtonFailureState &&
                                          state.error is AuthFailure
                                      ? state.error.message
                                      : null,
                              suffixIcon: IconButton(
                                icon: Icon(
                                  _obscurePassword
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                  color: AppColors.secondaryGray,
                                ),
                                onPressed: () {
                                  setState(() {
                                    _obscurePassword = !_obscurePassword;
                                  });
                                },
                              ),
                            ),
                          );
                        },
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder:
                                    (context) => const ForgotPasswordPage(),
                              ),
                            );
                          },
                          child: Text(
                            'Forgot Password?',
                            style: theme.textTheme.bodyMedium?.copyWith(
                              color: theme.colorScheme.primary,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: AppSizes.spacingL),
                      Builder(
                        builder: (context) {
                          return AppButton(
                            text: 'Sign In',
                            textStyle: TextStyle(fontSize: AppSizes.fontSizeM),
                            onTap: () {
                              _handleSubmit(context);
                            },
                          );
                        },
                      ),
                      const SizedBox(height: AppSizes.spacingL),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Don\'t have an account?',
                            style: theme.textTheme.bodyMedium,
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const SignupPage(),
                                ),
                              );
                            },
                            child: Text(
                              'Sign Up',
                              style: theme.textTheme.titleMedium?.copyWith(
                                color: theme.colorScheme.primary,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
