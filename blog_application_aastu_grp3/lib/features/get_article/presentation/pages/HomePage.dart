import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:blog_application_aastu_grp3/features/article/presentation/pages/add_task_body.dart';
import 'package:blog_application_aastu_grp3/features/get_article/presentation/bloc/bloc/get_article_bloc.dart';
import 'package:blog_application_aastu_grp3/features/get_article/presentation/pages/ArticlePage.dart';
import 'package:blog_application_aastu_grp3/features/get_article/presentation/widgets/blog_card.dart';
import 'package:blog_application_aastu_grp3/features/profile/presentation/bloc/user_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../../profile/presentation/pages/profile_page.dart';
import '../../data/models/article_model.dart';
import '../widgets/homepage_shimmer.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  static int currentCat = 0;
  @override
  Widget build(BuildContext context) {
    List tagsTitle = [
      "",
      "art",
      "design",
      "sports",
      "others",
      "politics",
      "culture",
      "production",
      "oech"
    ];

    List tagsTitleShow = [
      "All",
      "Art",
      "Design",
      "Sports",
      "Others",
      "Politics",
      "Culture",
      "Production",
      "Oech"
    ];

    void navigate(blogdata) {
      Navigator.push(context, MaterialPageRoute(builder: (ctx) {
        return ArticlePage(data: blogdata);
      }));
    }

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.sort,
                size: 34,
              ),
            ),
            const Spacer(),
            DefaultTextStyle(
              style: const TextStyle(
                fontSize: 30.0,
              ),
              child: AnimatedTextKit(
                animatedTexts: [
                  WavyAnimatedText('Welcome Back!',
                      textStyle: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.w400)),
                ],
                isRepeatingAnimation: true,
              ),
            ),
            // const Text(
            //   'Welcome Back!',
            //   style: TextStyle(fontWeight: FontWeight.w600),
            // ),
            const Spacer(),
            GestureDetector(
              onTap: () {
                context.read<UserBloc>().add(GetUser());
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return ProfilePage();
                }));
              },
              child: BlocBuilder<UserBloc, UserState>(
                builder: (context, state) {
                  if (state is UserLoaded) {
                    return CircleAvatar(
                      radius: 25,
                      backgroundImage:
                          NetworkImage(state.profileModel.image ?? ""),
                    );
                  } else {
                    return CircleAvatar(
                      radius: 25,
                      backgroundImage: NetworkImage(
                          "https://ps.w.org/user-avatar-reloaded/assets/icon-256x256.png?rev=2540745"),
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            const SizedBox(height: 20),
            Container(
              width: 500,
              height: 70,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: const [
                  BoxShadow(
                      color: Color(0xffb9b6b6),
                      blurStyle: BlurStyle.outer,
                      blurRadius: 5)
                ],
              ),
              child: Row(children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 7),
                    child: TextField(
                      onChanged: (values) {
                        BlocProvider.of<GetArticleBloc>(context).add(
                            GetSearchedArticleEvent(
                                searchParam: values, filterParam: ""));
                      },
                      decoration: const InputDecoration(
                        hintText: "Search and article . . .",
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 70,
                  width: 70,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: const Center(
                      child: Icon(
                    Icons.search,
                    color: Colors.white,
                    size: 30,
                  )),
                )
              ]),
            ),
            const SizedBox(height: 15),
            Center(
              child: SizedBox(
                height: 35,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: tagsTitle.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                          onTap: () {
                            setState(() {
                              currentCat = index;
                            });

                            BlocProvider.of<GetArticleBloc>(context).add(
                                GetSearchedArticleEvent(
                                    searchParam: "",
                                    filterParam: tagsTitle[index]));
                          },
                          child: customButton(
                              tagsTitleShow[index], index == currentCat));
                    }),
              ),
            ),
            const SizedBox(height: 20),
            BlocBuilder<GetArticleBloc, GetArticleState>(
              builder: (context, state) {
                if (state is OnArticleLoaded) {
                  // return _body(tabsTitle, state.data, navigate);
                  return Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: state.data.length,
                        itemBuilder: (context, index) {
                          return blogTitle(state.data[index], navigate);
                        },
                      ),
                    ),
                  );
                } else {
                  return Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: 5,
                        itemBuilder: (context, index) {
                          return BlogTileSkeleton();
                        },
                      ),
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return AddTaskBody();
          }));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

Widget customButton(String text, bool active) {
  return Container(
    width: 80,
    margin: const EdgeInsets.symmetric(horizontal: 5),
    decoration: BoxDecoration(
      color: active ? Colors.blue : Colors.white,
      border: Border.all(color: Colors.blue, width: 2),
      borderRadius: BorderRadius.circular(20),
    ),
    child: Center(
      child: Text(
        text,
        style: TextStyle(color: active ? Colors.white : Colors.blue),
      ),
    ),
  );
}

String formatDate(String date) {
  try {
    DateTime inputDate = DateTime.parse(date);
    String formatedDate = DateFormat('MMM-dd-yyyy').format(inputDate);
    return formatedDate;
  } catch (e) {
    return "";
  }
}

Widget blogTitle(Data data, navigate) {
  return GestureDetector(
    onTap: () {
      navigate(data);
    },
    child: Container(
      height: 200,
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // image will go here
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: SizedBox(
                height: 100,
                width: 100,
                child: Image.network(data.image!),
              ),
            ),

            // Title of the blog tile
            const SizedBox(width: 10),
            SizedBox(
              height: 150,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 100,
                    // Blog Title
                    child: Text(
                        data.title!.length < 11
                            ? data.title!.toUpperCase()
                            : data.title!.substring(1, 10) +
                                "...".toUpperCase(),
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w600)),
                  ),
                  SizedBox(
                    width: 100,
                    height: 30,
                    child: Text(data.subTitle!.length < 7
                        ? data.subTitle!.toUpperCase()
                        : data.subTitle!.substring(1, 7) + "...".toUpperCase()),
                  ),
                  const SizedBox(height: 6),
                  SizedBox(
                    height: 30,
                    width: 180,
                    child: Expanded(
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          itemCount: data.tags!.length,
                          itemBuilder: (ctx, index) {
                            return Container(
                              width: 80,
                              margin: EdgeInsets.symmetric(horizontal: 5),
                              decoration: BoxDecoration(
                                color: Colors.blue,
                                border:
                                    Border.all(color: Colors.blue, width: 2),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Center(
                                  child: Text(
                                data.tags![index] ?? " ",
                                style: const TextStyle(color: Colors.white),
                              )),
                            );
                          }),
                    ),
                  ),
                  // const SizedBox(height: 20),
                  Text(
                    "by ${data.user!.fullName ?? ""}",
                    style: const TextStyle(fontSize: 14),
                  ),
                ],
              ),
            )
          ],
        ),
        Row(
          children: [
            const Spacer(),
            SizedBox(height: 20, child: Text(formatDate(data.createdAt ?? "")))
          ],
        )
      ]),
    ),
  );
}
