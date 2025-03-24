part of 'theme_config.dart';

class LightTheme {
  static final ThemeData theme = ThemeData(
    brightness: Brightness.light,
    primaryColor: AppColors.primaryBlue,
    colorScheme: ColorScheme.light(
      primary: AppColors.primaryBlue,
      secondary: AppColors.secondaryGray,
      surface: AppColors.backgroundLight,
      onPrimary: AppColors.textPrimaryDark,
      onSurface: AppColors.textPrimaryLight,
    ),
    fontFamily: 'SignikaNegative',
    textTheme: TextTheme(
      headlineLarge: TextStyle(
        color: AppColors.textPrimaryLight,
        fontSize: AppSizes.fontSizeXXXL,
        fontWeight: FontWeight.bold,
      ),
      headlineMedium: TextStyle(
        color: AppColors.textPrimaryLight,
        fontSize: AppSizes.fontSizeXXL,
        fontWeight: FontWeight.bold,
      ),
      headlineSmall: TextStyle(
        color: AppColors.textPrimaryLight,
        fontSize: AppSizes.fontSizeXL,
        fontWeight: FontWeight.bold,
      ),
      titleLarge: TextStyle(
        color: AppColors.textPrimaryLight,
        fontSize: AppSizes.fontSizeL,
        fontWeight: FontWeight.w600,
      ),
      titleMedium: TextStyle(
        color: AppColors.textPrimaryLight,
        fontSize: AppSizes.fontSizeM,
        fontWeight: FontWeight.w600,
      ),
      titleSmall: TextStyle(
        color: AppColors.textPrimaryLight,
        fontSize: AppSizes.fontSizeS,
        fontWeight: FontWeight.w600,
      ),
      bodyLarge: TextStyle(
        color: AppColors.textPrimaryLight,
        fontSize: AppSizes.fontSizeM,
      ),
      bodyMedium: TextStyle(
        color: AppColors.textSecondaryLight,
        fontSize: AppSizes.fontSizeS,
      ),
      bodySmall: TextStyle(
        color: AppColors.textSecondaryLight,
        fontSize: AppSizes.fontSizeXS,
      ),
      labelLarge: TextStyle(
        color: AppColors.textPrimaryLight,
        fontSize: AppSizes.fontSizeS,
        fontWeight: FontWeight.w500,
      ),
      labelMedium: TextStyle(
        color: AppColors.textSecondaryLight,
        fontSize: AppSizes.fontSizeXS,
        fontWeight: FontWeight.w500,
      ),
      labelSmall: TextStyle(
        color: AppColors.textSecondaryLight,
        fontSize: AppSizes.fontSizeXS,
        fontWeight: FontWeight.w500,
      ),
    ),
    cardColor: AppColors.backgroundLight,
    dividerColor: AppColors.grayColor,
    canvasColor: AppColors.surfaceLight,
    inputDecorationTheme: InputDecorationTheme(
      hintStyle: TextStyle(color: AppColors.textSecondaryDark),
      // filled: true,
      // fillColor: AppColors.grayColor,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppSizes.inputFieldRadius),
        borderSide: BorderSide.none,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppSizes.inputFieldRadius),
        borderSide: BorderSide(color: AppColors.grayColor, width: 1.5),
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
      errorMaxLines: 2,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
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
