import 'package:flutter/material.dart';
import 'package:nomad_travel/constants/app_theme.dart';
import 'package:nomad_travel/pages/walk_through_page/walk_through_page.dart';
import 'package:nomad_travel/providers/menu_index_notifier.dart';
import 'package:nomad_travel/providers/theme_provider.dart';
import 'package:provider/provider.dart';

void main() =>
  runApp(
    ChangeNotifierProvider(
      create: (_) => ThemeProvider(ThemeMode.system),
      child: MyApp(),
    ),
  );


class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => MenuIndexNotifier()),
      ],
      child: MaterialApp(
        title: 'Nomad Travel',
        debugShowCheckedModeBanner: false,
        theme: AppTheme().lightTheme,
        darkTheme: AppTheme().darkTheme,
        themeMode: themeProvider.getThemeMode(),
        home: WalkThroughPage(),
      ),
    );
  }
}
