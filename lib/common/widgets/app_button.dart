import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:truck_management_app/common/bloc/button/button_state.dart';
import 'package:truck_management_app/common/bloc/button/button_state_cubit.dart';
import 'package:truck_management_app/core/constants/app_colors.dart';
import 'package:truck_management_app/core/constants/app_sizes.dart';

class AppButton extends StatelessWidget {
  final VoidCallback onTap;
  final String text;
  final Color? backgroundColor;
  final Color? textColor;
  final double? width;
  final double? height;
  final double? borderRadius;
  final TextStyle? textStyle;

  const AppButton({
    super.key,
    required this.onTap,
    required this.text,
    this.backgroundColor,
    this.textColor,
    this.width,
    this.height,
    this.borderRadius,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: BlocBuilder<ButtonStateCubit, ButtonState>(
        builder: (context, state) {
          if (state is ButtonLoadingState) {
            return _isLoading(context);
          } else {
            return _initial(context);
          }
        },
      ),
    );
  }

  Widget _initial(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        foregroundColor: textColor,
        shape:
            borderRadius != null
                ? RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(borderRadius!),
                )
                : null,
      ),
      child: Text(text, style: textStyle),
    );
  }

  Widget _isLoading(BuildContext context) {
    return ElevatedButton(
      onPressed: null,
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        foregroundColor: textColor,
        padding: EdgeInsets.all(AppSizes.paddingSL),
        shape:
            borderRadius != null
                ? RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(borderRadius!),
                )
                : null,
      ),
      child: const CircularProgressIndicator(color: AppColors.primaryBlue),
    );
  }
}
