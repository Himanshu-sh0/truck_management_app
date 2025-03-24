// import 'package:flutter/material.dart';
// import '../../../../../core/constants/app_colors.dart';
// import '../../../../../core/constants/app_sizes.dart';
// import '../../../../../core/util/validators/auth_validators.dart';
// import '../../../../../core/widgets/dismiss_keyboard_wrapper.dart';

// class NewPasswordPage extends StatefulWidget {
//   final String email;

//   const NewPasswordPage({super.key, required this.email});

//   @override
//   State<NewPasswordPage> createState() => _NewPasswordPageState();
// }

// class _NewPasswordPageState extends State<NewPasswordPage> {
//   final _formKey = GlobalKey<FormState>();
//   final _passwordController = TextEditingController();
//   final _confirmPasswordController = TextEditingController();
//   bool _obscurePassword = true;
//   bool _obscureConfirmPassword = true;

//   String? _validateConfirmPassword(String? value) {
//     if (value != _passwordController.text) {
//       return 'Passwords do not match';
//     }
//     return null;
//   }

//   void _handleSubmit() {
//     if (_formKey.currentState?.validate() ?? false) {
//       // TODO: Implement password change logic
//       print('Password changed successfully');
//       // Navigate back to login page after success
//       Navigator.of(context).pushNamedAndRemoveUntil('/login', (route) => false);
//     }
//   }

//   @override
//   void dispose() {
//     _passwordController.dispose();
//     _confirmPasswordController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final theme = Theme.of(context);

//     return Scaffold(
//       appBar: AppBar(),
//       body: SafeArea(
//         child: DismissKeyboardWrapper(
//           child: SingleChildScrollView(
//             padding: const EdgeInsets.all(AppSizes.paddingL),
//             child: Form(
//               key: _formKey,
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.stretch,
//                 children: [
//                   const SizedBox(height: AppSizes.spacingXL),
//                   Text(
//                     'New Password',
//                     style: theme.textTheme.headlineLarge?.copyWith(
//                       fontWeight: FontWeight.bold,
//                     ),
//                     textAlign: TextAlign.center,
//                   ),
//                   const SizedBox(height: AppSizes.spacingS),
//                   Text(
//                     'Your new password must be different\nfrom previously used passwords',
//                     style: theme.textTheme.bodyMedium,
//                     textAlign: TextAlign.center,
//                   ),
//                   const SizedBox(height: AppSizes.spacingXXL),
//                   TextFormField(
//                     controller: _passwordController,
//                     validator: AuthValidators.validatePassword,
//                     obscureText: _obscurePassword,
//                     decoration: InputDecoration(
//                       labelText: 'Password',
//                       suffixIcon: IconButton(
//                         icon: Icon(
//                           _obscurePassword
//                               ? Icons.visibility_off
//                               : Icons.visibility,
//                           color: AppColors.secondaryGray,
//                         ),
//                         onPressed: () {
//                           setState(() {
//                             _obscurePassword = !_obscurePassword;
//                           });
//                         },
//                       ),
//                     ),
//                   ),
//                   const SizedBox(height: AppSizes.spacingM),
//                   TextFormField(
//                     controller: _confirmPasswordController,
//                     validator: _validateConfirmPassword,
//                     obscureText: _obscureConfirmPassword,
//                     decoration: InputDecoration(
//                       labelText: 'Confirm Password',
//                       suffixIcon: IconButton(
//                         icon: Icon(
//                           _obscureConfirmPassword
//                               ? Icons.visibility_off
//                               : Icons.visibility,
//                           color: AppColors.secondaryGray,
//                         ),
//                         onPressed: () {
//                           setState(() {
//                             _obscureConfirmPassword = !_obscureConfirmPassword;
//                           });
//                         },
//                       ),
//                     ),
//                   ),
//                   const SizedBox(height: AppSizes.spacingXL),
//                   ElevatedButton(
//                     onPressed: _handleSubmit,
//                     child: const Text('Create New Password'),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
