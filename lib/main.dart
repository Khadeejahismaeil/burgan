import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'screens.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: _router,
      title: 'Burgan Bank',
      theme: ThemeData(
        primaryColor: const Color.fromARGB(255, 10, 95, 164),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color.fromARGB(255, 10, 95, 164),
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
          iconTheme: IconThemeData(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

final GoRouter _router = GoRouter(
  initialLocation: '/list',
  routes: [
    GoRoute(
      path: '/list',
      builder: (context, state) => const ListScreen(),
    ),
    GoRoute(
      path: '/branchDetail',
      builder: (context, state) {
        final branch = state.extra as Branch;
        return BranchDetailPage(branch: branch);
      },
    ),
  ],
);
