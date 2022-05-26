import '../../../application/routes/app_routes.dart';
import '../../../components/loader/loader_app.dart';
import '../../../models/book/book_model.dart';
import 'package:flutter/material.dart';

class BookCard extends StatelessWidget {
  const BookCard({Key? key, required this.book}) : super(key: key);
  final BookModel book;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.pushNamed(
        context,
        AppRoutes.bookDetail,
        arguments: book,
      ),
      child: Material(
        elevation: 4,
        child: Container(
          constraints: BoxConstraints(
            maxHeight: MediaQuery.of(context).size.height * .1,
            maxWidth: MediaQuery.of(context).size.width,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
              10,
            ),
          ),
          margin: const EdgeInsets.all(8),
          child: Column(
            children: [
              const SizedBox(
                height: 5,
              ),
              Material(
                elevation: 4,
                child: SizedBox(
                  child: Hero(
                    tag: book.id,
                    flightShuttleBuilder: (flightContext, animation,
                            flightDirection, fromHeroContext, toHeroContext) =>
                        const LoaderApp(),
                    transitionOnUserGestures: true,
                    child: book.volumeInfo.imageLinks == null
                        ? const Center(child: Icon(Icons.error))
                        : Image.network(
                            fit: BoxFit.contain,
                            book.volumeInfo.imageLinks!.smallThumbnail,
                            errorBuilder: (context, error, stackTrace) =>
                                const Icon(Icons.error),
                            loadingBuilder: (context, child, loadingProgress) {
                              if (loadingProgress == null) return child;
                              return const LoaderApp();
                            },
                            height: MediaQuery.of(context).size.height * .15,
                          ),
                  ),
                ),
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.all(8),
                child: Tooltip(
                  message: book.volumeInfo.title,
                  padding: const EdgeInsets.all(5),
                  child: Text(
                    book.volumeInfo.title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
