import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:nomad_travel/constants/app_theme.dart';
import 'package:nomad_travel/pages/file_manager_page/common.dart';
import 'package:nomad_travel/pages/main_page/main_page.dart';
import 'package:nomad_travel/providers/theme_provider.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:intl/date_symbol_data_local.dart';

InAppLocalhostServer localhostServer = InAppLocalhostServer();



Future main() async {
  WidgetsFlutterBinding.ensureInitialized();

  /// load localhost for display map web view
  await localhostServer.start();

  /// hi tester

  /// get directory for file manager
  Future<void> getSDCardDirAndroid() async {
    //  Common().rootPath = /storage/emulated/0 android
    Common().rootPath = (await getExternalStorageDirectory()).path;
  }
  Future<void> getSDCardDirIos() async {
    //  Common().rootPath = ios
    Common().rootPath = (await getApplicationDocumentsDirectory()).path;
    debugPrint(Common().rootPath);
  }

  // Permission check
  Future<void> getPermission() async {
    if (Platform.isAndroid) {
      PermissionStatus permission = await PermissionHandler()
          .checkPermissionStatus(PermissionGroup.storage);
      if (permission != PermissionStatus.granted) {
        await PermissionHandler().requestPermissions([PermissionGroup.storage]);
      }
      await getSDCardDirAndroid();
    } else if (Platform.isIOS) {
      await getSDCardDirIos();
    }
  }

  Future.wait([initializeDateFormatting("en_US", null), getPermission()])
      .then((result) {
    runApp(
      ChangeNotifierProvider(
        create: (_) => ThemeProvider(ThemeMode.light),
        child: MyApp(),
      ),
    );
  });
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
