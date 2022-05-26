import '../../application/routes/app_routes.dart';
import 'package:provider/provider.dart';

import '../../application/app_module/app_module_config.dart';
import 'home_controller.dart';
import 'home_page.dart';

class HomeModule extends AppModuleConfig {
  HomeModule()
      : super(
          bindings: [
            ChangeNotifierProvider(
              create: (context) => HomeController(
                catalogService: context.read(),
              ),
            ),
          ],
          routers: {
            AppRoutes.home: (context) => HomePage(
                  homeController: context.read(),
                ),
          },
        );
}
