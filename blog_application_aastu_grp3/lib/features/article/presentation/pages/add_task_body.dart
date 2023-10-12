import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import '../../domain/entities/article.dart';
import '../bloc/add_article_bloc.dart';
import '../widgets/custom_tag_button.dart';
import '../widgets/custom_text_area.dart';
import '../widgets/custom_text_field.dart';

class AddTaskBody extends StatefulWidget {
  const AddTaskBody({super.key});

  @override
  State<AddTaskBody> createState() => _AddTaskBodyState();
}

class _AddTaskBodyState extends State<AddTaskBody> {
  final TextEditingController _taskTitleController = TextEditingController();

  final TextEditingController _taskSubTitleController = TextEditingController();

  final TextEditingController _taskTagController = TextEditingController();

  final TextEditingController _taskContentController = TextEditingController();

  final List<String> categories = [];
  final _formKey = GlobalKey<FormState>();

  File? _image;
  _getFromGallery() async {
    var imagePicker = ImagePicker();
    XFile? image = await imagePicker.pickImage(
        source: ImageSource.gallery,
        imageQuality: 50,
        preferredCameraDevice: CameraDevice.front);
    setState(() {
      _image = File(image!.path);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        body: BlocConsumer<AddArticleBloc, AddArticleState>(
          listener: (context, state) {
            if (state is AddArticleFailed) {
              ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("Failed To Upload Article !")));
            } else if (state is ArticleLoaded) {
              ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("Article Succesfully Posted!")));

              Navigator.pop(context);
            }
          },
          builder: (context, state) {
            if (state is AddArticleInitial ||
                state is AddArticleFailed ||
                state is ArticleLoadedTags ||
                state is ArticleTagsLoading ||
                state is ArticleLoaded) {
              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 70, 0, 0),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(40, 0, 0, 0),
                          child: Container(
                            width: 36,
                            height: 36,
                            decoration: BoxDecoration(
                                color: const Color(0xFFEAEBF0),
                                borderRadius: BorderRadius.circular(10)),
                            child: IconButton(
                              icon: const Icon(
                                Icons.arrow_back_ios_new,
                                color: Color(0xFF878585),
                                size: 17,
                              ),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            ),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.fromLTRB(40, 0, 0, 0),
                          child: Text(
                            "New Article",
                            style: TextStyle(
                              color: Color(0xFF0D253C),
                              fontFamily: "Poppins",
                              fontWeight: FontWeight.w500,
                              fontSize: 24,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 40, vertical: 35),
                      child: SingleChildScrollView(
                        child: Form(
                          key: _formKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomTextField(
                                placeholder: 'Add title',
                                controller: _taskTitleController,
                                formKey: _formKey,
                              ),
                              CustomTextField(
                                placeholder: 'Add subtitle',
                                controller: _taskSubTitleController,
                                formKey: _formKey,
                              ),
                              CustomTagButton(
                                  textTagController: _taskTagController,
                                  categories: categories,
                                  formKey: _formKey),
                              const SizedBox(
                                height: 50,
                              ),
                              if (_image == null)
                                Stack(
                                  children: [
                                    ClipRRect(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10)),
                                      child: Container(
                                        child: _image != null
                                            ? Image.file(_image!)
                                            : Image.asset(
                                                'assets/images/pick_image.jpg'),
                                      ),
                                    ),
                                    Positioned(
                                      top: 240,
                                      left: 100,
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor:
                                              const Color(0xFF376AED),
                                          foregroundColor: Colors.white,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(21),
                                          ),
                                        ),
                                        onPressed: () {
                                          _getFromGallery();
                                        },
                                        child: Text(
                                          'Select image',
                                          style: TextStyle(
                                            fontFamily: 'Poppins',
                                            fontWeight: FontWeight.w500,
                                            fontSize: 15,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              if (_image != null)
                                Stack(
                                  children: [
                                    ClipRRect(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10)),
                                      child: Container(
                                        height: 200,
                                        child: _image != null
                                            ? Image.file(_image!)
                                            : Image.asset(
                                                fit: BoxFit.contain,
                                                'assets/images/pick_image.jpg'),
                                      ),
                                    ),
                                    Positioned(
                                      top: 110,
                                      left: 90,
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor:
                                              const Color(0xFF376AED),
                                          foregroundColor: Colors.white,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(21),
                                          ),
                                        ),
                                        onPressed: () {
                                          _getFromGallery();
                                        },
                                        child: Text(
                                          'change image',
                                          style: TextStyle(
                                            fontFamily: 'Poppins',
                                            fontWeight: FontWeight.w500,
                                            fontSize: 15,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              SizedBox(
                                height: 20,
                              ),
                              CustomTextArea(
                                placeholder: 'Article Content',
                                controller: _taskContentController,
                                formKey: _formKey,
                              ),
                              const SizedBox(height: 80),
                              Center(
                                child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: const Color(0xFF376AED),
                                      foregroundColor: Colors.white,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(21),
                                      ),
                                    ),
                                    child: const Text(
                                      'Publish',
                                      style: TextStyle(
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w500,
                                        fontSize: 15,
                                      ),
                                    ),
                                    onPressed: () async {
                                      if (_formKey.currentState!.validate()) {
                                        BlocProvider.of<AddArticleBloc>(context)
                                            .add(AddArticlesEvent(
                                                article: addArticle()));
                                      }
                                    }),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              );
            } else if (state is ArticleLoading) {
              return Center(
                  child: Column(
                children: [
                  Spacer(),
                  CircularProgressIndicator(),
                  Text("Posting..."),
                  Spacer()
                ],
              ));
            } else {
              return Center(
                child: Text("Unkown Error"),
              );
            }
          },
        ),
      ),
    );
  }

  Article addArticle() {
    print(_image);
    String title = _taskTitleController.text;
    String subtitle = _taskSubTitleController.text;
    List<String> tags = categories;
    String content = _taskContentController.text;
    Article article = Article(
        id: "1",
        title: title,
        subtitle: subtitle,
        tags: tags,
        content: content,
        estimatedReadTime: "2",
        photoUrl: _image);

    _taskContentController.clear();
    _taskSubTitleController.clear();
    _taskTitleController.clear();
    _taskTagController.clear();

    return article;
  }
}
