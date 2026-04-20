import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:saz_portfolio/home_page.dart';
import 'package:saz_portfolio/theme_controller.dart';

import 'core/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final themeController = ThemeController();
  await themeController.loadTheme();
  runApp(
    ChangeNotifierProvider.value(
      value: ThemeController(),
      child: const MyPortfolio(),
    ),
  );
}

class MyPortfolio extends StatelessWidget {
  const MyPortfolio({super.key});

  @override
  Widget build(BuildContext context) {
    final themeController = Provider.of<ThemeController>(context);
    return MaterialApp(
      title: 'Syed Abraar Zeeshan | Flutter Developer',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: themeController.themeMode,
      home: const HomePage(),
    );
  }
}
