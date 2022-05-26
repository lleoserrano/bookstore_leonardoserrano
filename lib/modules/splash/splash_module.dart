import '../../application/routes/app_routes.dart';
import 'splash_page.dart';
import 'package:provider/provider.dart';

import '../../application/app_module/app_module_config.dart';

class SplashModule extends AppModuleConfig {
  SplashModule()
      : super(
          bindings: [],
          routers: {
            AppRoutes.splash: (context) => SplashPage(
                  authProvider: context.read(),
                ),
          },
        );
}
