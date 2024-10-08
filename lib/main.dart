import 'package:ebot/ui/main/splash_screen.dart';
import 'package:ebot/utils/get_it_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:ebot/bloc/main_bloc/main_bloc.dart';
import 'package:ebot/ui/main/onboarding_screen.dart';
import 'package:ebot/bloc/splash_bloc/splash_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  setupLocator();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<SplashBloc>(
          create: (context) => SplashBloc()
            ..add(const AppStarted()), // Initiate the App Start state
        ),
        BlocProvider<MainBloc>(
          create: (BuildContext context) => MainBloc(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      // Use builder only if you need to use library outside ScreenUtilInit context
      builder: (_, child) {
        return MaterialApp(
          initialRoute: '/splash',
          routes: {
            '/splash': (context) => const SplashScreen(),
          },
          debugShowCheckedModeBanner: false,
          title: 'eBot',
          theme: ThemeData(
            textTheme: Typography.englishLike2018.apply(fontSizeFactor: 1.sp),
          ),
          home: child,
        );
      },
      child: const OnboardingScreen(),
    );
  }
}
