class AuthValidators {
  static String? validateName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Name is required';
    }
    if (value.length < 2) {
      return 'Name must be at least 2 characters';
    }
    return null;
  }

  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email is required';
    }
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegex.hasMatch(value)) {
      return 'Please enter a valid email';
    }
    return null;
  }

  static String? validatePassword(String? value, {bool isLogin = false}) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    }

    // For login, we only check if password is not empty
    if (isLogin) return null;

    // For registration, we check password strength
    if (!value.contains(RegExp(r'[a-z]'))) {
      return 'Password must contain at least one lowercase letter';
    } else if (!value.contains(RegExp(r'[A-Z]'))) {
      return 'Password must contain at least one uppercase letter';
    } else if (!value.contains(RegExp(r'[0-9]'))) {
      return 'Password must contain at least one number';
    } else if (!value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
      return 'Password must contain at least one special character';
    } else if (value.length < 8) {
      return 'Password must be at least 8 characters';
    }

    return null;
  }
}
