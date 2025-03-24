import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_sizes.dart';
import '../../../../core/util/validators/auth_validators.dart';
import '../../../../core/widgets/dismiss_keyboard_wrapper.dart';
import 'register_page.dart';
// import 'forgot_password/forgot_password_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  bool _obscurePassword = true;

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  void _handleSubmit() {
    if (_formKey.currentState?.validate() ?? false) {
      // TODO: Implement login logic
      print('Form is valid, proceeding with login');
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

    return Scaffold(
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
                  TextFormField(
                    controller: _passwordController,
                    validator:
                        (value) => AuthValidators.validatePassword(
                          value,
                          isLogin: true,
                        ),
                    obscureText: _obscurePassword,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      filled: true,
                      fillColor: theme.cardColor,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                          AppSizes.inputFieldRadius,
                        ),
                        borderSide: BorderSide.none,
                      ),
                      errorStyle: TextStyle(color: theme.colorScheme.error),
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
                  // Align(
                  //   alignment: Alignment.centerRight,
                  //   child: TextButton(
                  //     onPressed: () {
                  //       Navigator.push(
                  //         context,
                  //         MaterialPageRoute(
                  //           builder: (context) => const ForgotPasswordPage(),
                  //         ),
                  //       );
                  //     },
                  //     child: Text(
                  //       'Forgot Password?',
                  //       style: theme.textTheme.bodyMedium?.copyWith(
                  //         color: theme.colorScheme.primary,
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  const SizedBox(height: AppSizes.spacingL),
                  ElevatedButton(
                    onPressed: _handleSubmit,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: theme.colorScheme.primary,
                      foregroundColor: theme.colorScheme.onPrimary,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                          AppSizes.buttonRadius,
                        ),
                      ),
                    ),
                    child: Text(
                      'Sign In',
                      style: theme.textTheme.titleMedium?.copyWith(
                        color: theme.colorScheme.onPrimary,
                        fontSize: AppSizes.fontSizeM,
                      ),
                    ),
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
                              builder: (context) => const RegisterPage(),
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
    );
  }
}
