import 'package:blog_application_aastu_grp3/features/article/presentation/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/add_article_bloc.dart';

class CustomTagButton extends StatefulWidget {
  const CustomTagButton(
      {super.key,
      required this.textTagController,
      required this.categories,
      required this.formKey});
  final TextEditingController textTagController;
  final List<String> categories;
  final formKey;

  @override
  State<CustomTagButton> createState() => _CustomTagButtonState();
}

class _CustomTagButtonState extends State<CustomTagButton> {
  bool isAreaVisible = false;

  //Mock data to test the Tag button
  // static List<String> categories = [];

  void toogleAreaVisibility() {
    setState(() {
      isAreaVisible = !isAreaVisible;
    });
  }

  void addTag(String value) {
    widget.textTagController.text = value;
    widget.categories.add(value);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddArticleBloc, AddArticleState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 1,
                  child: CustomTextField(
                    placeholder: 'Add tags',
                    controller: widget.textTagController,
                    formKey: widget.formKey,
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                Expanded(
                  flex: 0,
                  child: IconButton(
                      onPressed: () {
                        // bloc.add(GetTagsEvent());
                        context.read<AddArticleBloc>().add(GetTagsEvent());
                        toogleAreaVisibility();
                      },
                      icon: const Icon(
                        Icons.add_circle_outline_sharp,
                        color: Color(0xFF376AED),
                        size: 40,
                      )),
                )
              ],
            ),
            const SizedBox(height: 4),
            const Text(
              'add as many tags as you want',
              style: TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w300,
                  fontSize: 11,
                  color: Color(0xFF979EA5)),
            ),
            if (isAreaVisible && state is ArticleLoadedTags)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Wrap(
                  direction: Axis.horizontal,
                  spacing: 10,
                  runSpacing: 4,
                  children: state.tags.map((category) {
                    return Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
                          child: Chip(
                            label: Text(category),
                            labelStyle: const TextStyle(
                              color: Colors.blue,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500,
                              fontSize: 12,
                            ),
                            side: const BorderSide(
                              width: 2,
                              color: Colors.blue,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(75),
                            ),
                            deleteIcon: const Icon(
                              Icons.check,
                              color: Colors.blue,
                            ),
                            onDeleted: () {
                              addTag(category);
                              state.tags.remove(category);
                              setState(() {});
                            },
                          ),
                        ),
                      ],
                    );
                  }).toList(),
                ),
              ),
          ],
        );
      },
    );
  }
}
