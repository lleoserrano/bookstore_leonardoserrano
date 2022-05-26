import 'application/auth/auth_provider.dart';
import 'application/rest_client/rest_client.dart';
import 'modules/book_detail/book_detail_module.dart';
import 'repositories/catalog_repository.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'app_widget.dart';
import 'application/database/sqlite_connection_factory.dart';
import 'modules/home/home_module.dart';
import 'repositories/catalog_repository_impl.dart';
import 'repositories/database_repository.dart';
import 'repositories/database_repository_impl.dart';
import 'services/catalog_service.dart';
import 'services/catalog_service_impl.dart';
import 'services/database_service.dart';
import 'services/database_service_impl.dart';

class AppModule extends StatelessWidget {
  const AppModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(
          create: (_) => RestClient(),
          lazy: false,
        ),
        Provider(
          create: (_) => SqliteConnectionFactory(),
          lazy: false,
        ),
        ChangeNotifierProvider<AuthProvider>(
          create: (context) => AuthProvider(),
        ),
        Provider<DatabaseRepository>(
          create: (context) => DatabaseRepositoryImpl(
            sqliteConnectionFactory: context.read(),
            authProvider: context.read(),
          ),
        ),
        Provider<DatabaseService>(
          create: (context) => DatabaseServiceImpl(
            databaseRepository: context.read(),
          ),
        ),
        Provider<CatalogRepository>(
          create: (context) => CatalogRepositoryImpl(
            restClient: context.read(),
          ),
        ),
        Provider<CatalogService>(
          create: (context) => CatalogServiceImpl(
            catalogRepository: context.read(),
          ),
        ),
        ...HomeModule().bindings,
        ...BookDetailModule().bindings,
      ],
      child: const AppWidget(),
    );
  }
}
