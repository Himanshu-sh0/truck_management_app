import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:truck_management_app/features/auth/presentation/bloc/auth_state.dart';
import 'package:truck_management_app/features/auth/presentation/bloc/auth_state_cubit.dart';
import 'package:truck_management_app/features/auth/presentation/pages/home_page.dart';
import 'package:truck_management_app/features/auth/presentation/pages/signin.dart';
import 'package:truck_management_app/service_locator.dart';
import 'core/theme/app_theme/theme_config.dart';

void main() {
  setupServiceLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AuthStateCubit()..appStarted()),
      ],
      child: MaterialApp(
        title: 'Truck Management',
        debugShowCheckedModeBanner: false,
        theme: ThemeConfig.lightTheme,
        darkTheme: ThemeConfig.darkTheme,
        themeMode: ThemeMode.system, 
        home: BlocBuilder<AuthStateCubit, AuthState>(
          builder: (context, state) {
            if (state is AuthenticatedState) {
              return const HomePage();
            } else if (state is UnauthenticatedState) {
              return SigninPage();
            }
            return Container();
          },
        ),
      ),
    );
  }
}
