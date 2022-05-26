import 'package:flutter/material.dart';

class InformationWidget extends StatelessWidget {
  InformationWidget({
    Key? key,
    required this.title,
    this.content = '',
    this.contentInWidget,
  }) : super(key: key);
  final scrollController = ScrollController();
  final String title;
  final String content;
  final Widget? contentInWidget;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 5),
          child: Text(
            title,
            style: const TextStyle(
              decoration: TextDecoration.underline,
              fontSize: 16,
            ),
          ),
        ),
        Container(
          constraints: BoxConstraints(
            maxHeight: MediaQuery.of(context).size.height * .2,
          ),
          child: Scrollbar(
            controller: scrollController,
            thumbVisibility: true,
            child: SingleChildScrollView(
              controller: scrollController,
              child: contentInWidget ??
                  Text(
                    content,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
            ),
          ),
        ),
        const Divider(),
      ],
    );
  }
}
