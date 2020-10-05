import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:nomad_travel/constants/app_theme.dart';
import 'package:nomad_travel/pages/main_page/main_page.dart';
import 'package:nomad_travel/providers/theme_provider.dart';
import 'package:provider/provider.dart';

InAppLocalhostServer localhostServer = new InAppLocalhostServer();

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await localhostServer.start();
  runApp(
    ChangeNotifierProvider(
      create: (_) => ThemeProvider(ThemeMode.light),
      child: MyApp(),
    ),
  );
}


class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return MaterialApp(
      title: 'Nomad Travel',
      debugShowCheckedModeBanner: false,
      theme: AppTheme().lightTheme,
      darkTheme: AppTheme().darkTheme,
      themeMode: themeProvider.getThemeMode(),
      home: MainPage(),
    );
  }
}
