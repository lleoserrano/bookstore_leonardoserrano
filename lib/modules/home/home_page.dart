import '../../application/constants/app_constants.dart';
import '../../components/loader/loader_app.dart';
import 'widgets/book_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../../application/mixin/default_scroll_mixin.dart';
import '../../application/notifier/default_listener_notifier.dart';
import 'home_controller.dart';

class HomePage extends StatefulWidget {
  final HomeController _homeController;
  const HomePage({
    Key? key,
    required HomeController homeController,
  })  : _homeController = homeController,
        super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with DefaultScrollMixin {
  @override
  void initState() {
    super.initState();
    //Set loader end list
    setScrollCallEnd = () async {
      if (widget._homeController.hasMoreItems &&
          !widget._homeController.hasError &&
          !widget._homeController.loading) {
        await widget._homeController.getListOfBooks();
      }
    };

    DefaultListenerNotifier(changeNotifier: widget._homeController).listener(
      context: context,
      successCallback: (_, listenerInstance) {
        listenerInstance.dispose();
      },
    );

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await widget._homeController.getListOfBooks(isPullToRefresh: true);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        key: AppConstants.homeScaffoldKey,
        body: Scrollbar(
          controller: scrollController,
          child: CustomScrollView(
            controller: scrollController,
            physics: const BouncingScrollPhysics(),
            slivers: [
              const SliverAppBar(
                pinned: true,
                title: Text('Book Store'),
              ),
              CupertinoSliverRefreshControl(
                onRefresh: () async {
                  HapticFeedback.mediumImpact();
                  await widget._homeController
                      .getListOfBooks(isPullToRefresh: true);
                  return;
                },
                builder: (
                  context,
                  refreshState,
                  pulledExtent,
                  refreshTriggerPullDistance,
                  refreshIndicatorExtent,
                ) =>
                    const LoaderApp(),
              ),
              context.select<HomeController, Widget>(
                (controller) => controller.isSuccess &&
                            controller.allBooks.isNotEmpty ||
                        controller.loading
                    ? SliverGrid(
                        delegate: SliverChildBuilderDelegate(
                          (context, index) => BookCard(
                            book: widget._homeController.allBooks[index],
                          ),
                          childCount: widget._homeController.allBooks.length,
                        ),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount:
                              MediaQuery.of(context).size.width >= 600 ? 3 : 2,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                        ),
                      )
                    : SliverToBoxAdapter(
                        child: Center(
                          child: ElevatedButton(
                            onPressed: () async {
                              await controller.getListOfBooks(
                                  isPullToRefresh: true);
                            },
                            child: const Text('Try again'),
                          ),
                        ),
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
