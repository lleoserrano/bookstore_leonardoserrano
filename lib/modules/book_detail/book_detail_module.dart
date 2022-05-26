import 'package:provider/provider.dart';

import '../../application/app_module/app_module_config.dart';
import '../../application/routes/app_routes.dart';
import 'book_detail_controller.dart';
import 'book_detail_page.dart';

class BookDetailModule extends AppModuleConfig {
  BookDetailModule()
      : super(
          bindings: [
            ChangeNotifierProvider(
              create: (context) => BookDetailController(
                databaseService: context.read(),
              ),
            ),
          ],
          routers: {
            AppRoutes.bookDetail: (context) => BookDetailPage(
                  bookDetailController: context.read(),
                ),
          },
        );
}
