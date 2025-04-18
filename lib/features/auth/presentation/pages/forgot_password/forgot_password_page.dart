import 'package:flutter/material.dart';
import 'package:truck_management_app/service_locator.dart';
import '../../../../../core/constants/app_sizes.dart';
import '../../../../../core/util/validators/auth_validators.dart';
import '../../../../../common/widgets/dismiss_keyboard_wrapper.dart';
import '../../../../../features/auth/domain/entities/forgot_password_req_params.dart';
import '../../../../../features/auth/domain/usecases/forgot_password.dart';
import 'reset_password_page.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();

  void _handleSubmit() {
    if (_formKey.currentState?.validate() ?? false) {

      getIt<ForgotPasswordUsecase>().call(
        ForgotPasswordReqParams(email: _emailController.text),
      );
      // For now, just navigate to new password page
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ResetPasswordPage(email: _emailController.text),
        ),
      );
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return DismissKeyboardWrapper(
      child: Scaffold(
        appBar: AppBar(),
        body: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(AppSizes.paddingL),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(height: AppSizes.spacingXL),
                  Text(
                    'Reset Password',
                    style: theme.textTheme.headlineLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: AppSizes.spacingS),
                  Text(
                    'Enter your email address to receive a password reset link',
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
                      hintText: 'Enter your email address',
                    ),
                  ),
                  const SizedBox(height: AppSizes.spacingXL),
                  ElevatedButton(
                    onPressed: _handleSubmit,
                    child: const Text('Send Reset Link'),
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
