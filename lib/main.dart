// flutter run lib/main.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_one/common/common.dart';
import 'package:project_one/features/auth/view/signup_view.dart';
import 'package:project_one/features/home/view/home_view.dart';

import 'package:project_one/features/auth/controller/auth_controller.dart';

import 'package:project_one/theme/theme.dart';

void main() {
  runApp(const ProviderScope(
    child: MyApp(),
  ));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      title: 'Rayhan OIW rayhan sharif',
      theme: AppTheme.theme,
      home: ref.watch(currentUserAccountProvider).when(
            data: (user) {
              if (user != null) {
                return const HomeView();
              } else {
                return const SignUpView();
              }
            },
            error: (error, st) {
              ErrorPage(error: error.toString());
            },
            loading: () => const LoadingPage(),
          ),
    );
  }
}
