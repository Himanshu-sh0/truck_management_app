import 'package:flutter/material.dart';
import 'package:truck_management_app/core/widgets/dismiss_keyboard_wrapper.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_sizes.dart';
import '../../../../core/util/validators/auth_validators.dart';
import 'login_page.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  bool _obscurePassword = true;
  bool _agreedToTerms = false;

  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  void _handleSubmit() {
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
      // TODO: Implement registration logic
      print('Form is valid, proceeding with registration');
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
                          borderRadius: BorderRadius.circular(AppSizes.radiusS),
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
                      'Create Account',
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
                        'Already have an account?',
                        style: theme.textTheme.bodyMedium,
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const LoginPage(),
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
    );
  }
}
