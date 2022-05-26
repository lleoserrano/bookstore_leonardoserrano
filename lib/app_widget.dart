import 'application/database/sqlite_adm_connection.dart';
import 'modules/book_detail/book_detail_module.dart';
import 'modules/home/home_module.dart';
import 'modules/splash/splash_module.dart';
import 'package:flutter/material.dart';

import 'application/routes/app_routes.dart';

class AppWidget extends StatefulWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  State<AppWidget> createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> {
  final sqliteAdmConnection = SqliteAdmConnection();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(sqliteAdmConnection);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(sqliteAdmConnection);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Book Store - Leonardo Serrano',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      routes: {
        ...SplashModule().routers,
        ...HomeModule().routers,
        ...BookDetailModule().routers,
      },
      initialRoute: AppRoutes.splash,
    );
  }
}
