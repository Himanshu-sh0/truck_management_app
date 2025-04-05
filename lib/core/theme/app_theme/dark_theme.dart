part of 'theme_config.dart';

class DarkTheme {
  static final ThemeData theme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: AppColors.primaryBlue,
    colorScheme: ColorScheme.dark(
      primary: AppColors.primaryBlue,
      secondary: AppColors.secondaryGray,
      surface: AppColors.backgroundDark,
      onPrimary: AppColors.textPrimaryDark,
      onSurface: AppColors.textPrimaryDark,
    ),
    fontFamily: 'SignikaNegative',
    textTheme: TextTheme(
      headlineLarge: TextStyle(
        color: AppColors.textPrimaryDark,
        fontSize: AppSizes.fontSizeXXXL,
        fontWeight: FontWeight.bold,
      ),
      headlineMedium: TextStyle(
        color: AppColors.textPrimaryDark,
        fontSize: AppSizes.fontSizeXXL,
        fontWeight: FontWeight.bold,
      ),
      headlineSmall: TextStyle(
        color: AppColors.textPrimaryDark,
        fontSize: AppSizes.fontSizeXL,
        fontWeight: FontWeight.bold,
      ),
      titleLarge: TextStyle(
        color: AppColors.textPrimaryDark,
        fontSize: AppSizes.fontSizeL,
        fontWeight: FontWeight.w600,
      ),
      titleMedium: TextStyle(
        color: AppColors.textPrimaryDark,
        fontSize: AppSizes.fontSizeM,
        fontWeight: FontWeight.w600,
      ),
      titleSmall: TextStyle(
        color: AppColors.textPrimaryDark,
        fontSize: AppSizes.fontSizeS,
        fontWeight: FontWeight.w600,
      ),
      bodyLarge: TextStyle(
        color: AppColors.textPrimaryDark,
        fontSize: AppSizes.fontSizeM,
      ),
      bodyMedium: TextStyle(
        color: AppColors.textSecondaryDark,
        fontSize: AppSizes.fontSizeS,
      ),
      bodySmall: TextStyle(
        color: AppColors.textSecondaryDark,
        fontSize: AppSizes.fontSizeXS,
      ),
      labelLarge: TextStyle(
        color: AppColors.textPrimaryDark,
        fontSize: AppSizes.fontSizeS,
        fontWeight: FontWeight.w500,
      ),
      labelMedium: TextStyle(
        color: AppColors.textSecondaryDark,
        fontSize: AppSizes.fontSizeXS,
        fontWeight: FontWeight.w500,
      ),
      labelSmall: TextStyle(
        color: AppColors.textSecondaryDark,
        fontSize: AppSizes.fontSizeXS,
        fontWeight: FontWeight.w500,
      ),
    ),
    cardColor: AppColors.surfaceDark,
    dividerColor: AppColors.secondaryGray,
    canvasColor: AppColors.backgroundDark,
    inputDecorationTheme: InputDecorationTheme(
      hintStyle: TextStyle(color: AppColors.textSecondaryLight),
      // filled: true,
      // fillColor: AppColors.surfaceDark,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppSizes.inputFieldRadius),
        borderSide: BorderSide.none,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppSizes.inputFieldRadius),
        borderSide: BorderSide(color: AppColors.secondaryGray, width: 1.5),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppSizes.inputFieldRadius),
        borderSide: BorderSide(color: AppColors.primaryBlue, width: 1.5),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppSizes.inputFieldRadius),
        borderSide: BorderSide(color: Colors.red, width: 1.5),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppSizes.inputFieldRadius),
        borderSide: BorderSide(color: Colors.red, width: 1.5),
      ),
      contentPadding: const EdgeInsets.symmetric(
        horizontal: AppSizes.paddingM,
        vertical: AppSizes.paddingM,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primaryBlue,
        foregroundColor: AppColors.textPrimaryLight,
        padding: const EdgeInsets.symmetric(
          horizontal: AppSizes.paddingL,
          vertical: AppSizes.paddingM,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSizes.buttonRadius),
        ),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSizes.paddingS,
          vertical: AppSizes.paddingS,
        ),
      ),
    ),
    checkboxTheme: CheckboxThemeData(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSizes.radiusS),
      ),
    ),
  );
}
