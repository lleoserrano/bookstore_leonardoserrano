import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../application/notifier/default_listener_notifier.dart';
import '../../components/loader/loader_app.dart';
import '../../models/book/book_model.dart';
import '../../models/book/sale_info/sale_info_model.dart';
import 'book_detail_controller.dart';
import 'widgets/information_widget.dart';

class BookDetailPage extends StatefulWidget {
  final BookDetailController _bookDetailController;
  const BookDetailPage(
      {Key? key, required BookDetailController bookDetailController})
      : _bookDetailController = bookDetailController,
        super(key: key);

  @override
  State<BookDetailPage> createState() => _BookDetailPageState();
}

class _BookDetailPageState extends State<BookDetailPage> {
  final scrollAuthor = ScrollController();
  final scrollPage = ScrollController();
  final scrollDescription = ScrollController();
  @override
  void initState() {
    super.initState();

    DefaultListenerNotifier(changeNotifier: widget._bookDetailController)
        .listener(
            context: context,
            successCallback: (_, listenerInstance) {
              listenerInstance.dispose();
            },
            errorCallback: (_, listenerInstance) {
              if (mounted) {
                Navigator.of(context).pop();
              }
            });
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await widget._bookDetailController.receviedBook(
          ModalRoute.of(context)!.settings.arguments as BookModel?);
    });
  }

  @override
  void dispose() {
    scrollAuthor.dispose();
    scrollDescription.dispose();
    scrollPage.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        appBar: AppBar(
          title: context.select<BookDetailController, Widget>(
            (controller) =>
                Text(controller.getBookModel?.volumeInfo.title ?? '...'),
          ),
          actions: [
            context.select<BookDetailController, Widget>(
              (controller) => InkWell(
                onTap: () async {
                  await controller.updateIsFavorite();
                },
                child: AnimatedContainer(
                  margin: const EdgeInsets.symmetric(horizontal: 16),
                  duration: const Duration(seconds: 1),
                  child: Icon(
                    controller.getIsFavorite
                        ? Icons.favorite
                        : Icons.favorite_border,
                  ),
                ),
              ),
            ),
          ],
        ),
        body: context.select<BookDetailController, Widget>(
          (controller) => controller.isSuccess
              ? Scrollbar(
                  controller: scrollPage,
                  child: ListView(
                    controller: scrollPage,
                    children: [
                      Center(
                        child: Material(
                          elevation: 4,
                          child: SizedBox(
                            height: MediaQuery.of(context).size.height * .35,
                            width: MediaQuery.of(context).size.width,
                            child: Hero(
                              flightShuttleBuilder: (flightContext,
                                      animation,
                                      flightDirection,
                                      fromHeroContext,
                                      toHeroContext) =>
                                  const LoaderApp(),
                              tag: controller.getBookModel!.id,
                              transitionOnUserGestures: true,
                              child: controller.getBookModel!.volumeInfo
                                          .imageLinks ==
                                      null
                                  ? const Center(child: Icon(Icons.error))
                                  : Image.network(
                                      controller.getBookModel!.volumeInfo
                                          .imageLinks!.thumbnail,
                                      fit: BoxFit.contain,
                                      loadingBuilder:
                                          (context, child, loadingProgress) {
                                        if (loadingProgress == null) {
                                          return child;
                                        }
                                        return const LoaderApp();
                                      },
                                    ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            InformationWidget(
                              title: 'Title',
                              content:
                                  controller.getBookModel!.volumeInfo.title,
                            ),
                            InformationWidget(
                              title: 'Author',
                              contentInWidget: Column(
                                mainAxisSize: MainAxisSize.min,
                                children:
                                    controller.getBookModel!.volumeInfo.authors
                                        .map(
                                          (authorName) => Text(
                                            ' - $authorName',
                                            style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18,
                                            ),
                                          ),
                                        )
                                        .toList(),
                              ),
                            ),
                            const Divider(),
                            InformationWidget(
                              title: 'Description',
                              content: controller
                                      .getBookModel!.volumeInfo.description ??
                                  '',
                            ),
                            controller.getBookModel!.saleInfo
                                    .checkIsAvailableToBuy()
                                ? InformationWidget(
                                    title: 'Link to buy',
                                    contentInWidget: Text.rich(
                                      TextSpan(
                                        recognizer: TapGestureRecognizer()
                                          ..onTap = () async => await controller
                                              .launchLinkToBuy(),
                                        text: controller
                                            .getBookModel!.saleInfo.buyLink,
                                        style: const TextStyle(
                                          decoration: TextDecoration.underline,
                                        ),
                                      ),
                                    ),
                                  )
                                : const SizedBox(),
                            const SizedBox(
                              height: 16,
                            ),
                            Center(
                              child: SizedBox(
                                width: MediaQuery.of(context).size.width * .8,
                                child: ElevatedButton(
                                  onPressed: controller.getBookModel!.saleInfo
                                          .checkIsAvailableToBuy()
                                      ? () async {
                                          await controller.launchLinkToBuy();
                                        }
                                      : null,
                                  child: controller.getBookModel!.saleInfo
                                          .checkIsAvailableToBuy()
                                      ? Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            controller.getBookModel!.saleInfo
                                                    .checkIsAvailableToBuy()
                                                ? Text(
                                                    controller
                                                        .getBookModel!.saleInfo
                                                        .getValueForSale(),
                                                  )
                                                : const SizedBox.shrink()
                                          ],
                                        )
                                      : const Text('Unavailable'),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                )
              : const LoaderApp(),
        ),
      ),
    );
  }
}
