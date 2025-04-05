import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:truck_management_app/common/bloc/button/button_state.dart';
import 'package:truck_management_app/common/bloc/button/button_state_cubit.dart';
import 'package:truck_management_app/common/widgets/app_button.dart';
import 'package:truck_management_app/common/widgets/dismiss_keyboard_wrapper.dart';
import 'package:truck_management_app/service_locator.dart';
import 'package:truck_management_app/features/auth/data/models/signup_req_params.dart';
import 'package:truck_management_app/features/auth/domain/usecases/signup.dart';
import 'package:truck_management_app/features/auth/presentation/bloc/auth_state_cubit.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_sizes.dart';
import '../../../../core/util/validators/auth_validators.dart';
import 'signin.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final _formKey = GlobalKey<FormState>();
  bool _obscurePassword = true;
  bool _agreedToTerms = false;

  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  void _handleSubmit(BuildContext context) {
    if (_formKey.currentState?.validate() ?? false) {
      if (!_agreedToTerms) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Please accept the terms and conditions'),
            backgroundColor: Colors.red,
          ),
        );
        return;
      }
      // Implement Signup logic
      context.read<ButtonStateCubit>().execute(
        params: SignupReqParams(
          // name: _nameController.text.toLowerCase(),
          email: _emailController.text.toLowerCase(),
          password: _passwordController.text,
          passwordConfirmation: _passwordController.text,
        ),
        usecase: getIt<SignupUsecase>(),
      );
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
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
          } else if (state is ButtonFailureState) {
            var snackBar = SnackBar(content: Text(state.errorMessage));
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
                        'Create Account',
                        style: theme.textTheme.headlineLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: AppSizes.spacingS),
                      Text(
                        'Enter your details below to create your account',
                        style: theme.textTheme.bodyMedium,
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: AppSizes.spacingXXL),
                      TextFormField(
                        controller: _nameController,
                        validator: AuthValidators.validateName,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        decoration: InputDecoration(
                          labelText: 'Name',
                          hintText: 'Your Name',
                        ),
                      ),
                      const SizedBox(height: AppSizes.spacingM),
                      TextFormField(
                        controller: _emailController,
                        validator: AuthValidators.validateEmail,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          labelText: 'Email',
                          hintText: 'Example@gmail.com',
                          filled: true,
                        ),
                      ),
                      const SizedBox(height: AppSizes.spacingM),
                      TextFormField(
                        controller: _passwordController,
                        validator: AuthValidators.validatePassword,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        obscureText: _obscurePassword,
                        decoration: InputDecoration(
                          labelText: 'Password',
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
                      ),

                      const SizedBox(height: AppSizes.spacingM),
                      Row(
                        children: [
                          Checkbox(
                            value: _agreedToTerms,
                            onChanged: (value) {
                              setState(() {
                                _agreedToTerms = value ?? false;
                              });
                            },
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                AppSizes.radiusS,
                              ),
                            ),
                          ),
                          Expanded(
                            child: RichText(
                              text: TextSpan(
                                style: theme.textTheme.bodyMedium,
                                children: [
                                  const TextSpan(
                                    text: 'I have read and agreed to the ',
                                  ),
                                  TextSpan(
                                    text: 'User agreement',
                                    style: TextStyle(
                                      color: theme.colorScheme.primary,
                                    ),
                                  ),
                                  const TextSpan(text: ' and '),
                                  TextSpan(
                                    text: 'privacy Policy',
                                    style: TextStyle(
                                      color: theme.colorScheme.primary,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: AppSizes.spacingL),
                      Builder(
                        builder: (context) {
                          return AppButton(
                            onTap: () {
                              _handleSubmit(context);
                            },
                            text: "Create Account",
                            textStyle: TextStyle(fontSize: AppSizes.fontSizeM),
                          );
                        },
                      ),
                      const SizedBox(height: AppSizes.spacingL),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Already have an account?',
                            style: theme.textTheme.bodyMedium,
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const SigninPage(),
                                ),
                              );
                            },
                            child: Text(
                              'Sign In',
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
