import 'package:blog_application_aastu_grp3/features/get_article/presentation/pages/ArticlePage.dart';
import 'package:flutter/material.dart';
import '../../data/model/profile_model.dart';
import 'post_card.dart';

// ignore: must_be_immutable
class UserPost extends StatelessWidget {
  final ProfileModel profileModel;
  UserPost({super.key, required this.profileModel});

  @override
  Widget build(BuildContext context) {
    List<Articles> posts = <Articles>[];
    posts = profileModel.articles ?? [];

    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(22), topRight: Radius.circular(22))),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 30),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("My Posts",
                    style:
                        TextStyle(fontSize: 21, fontWeight: FontWeight.w500)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(
                      Icons.grid_view_outlined,
                      size: 30,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.height * (1 / 50),
                    ),
                    Icon(
                      Icons.menu_outlined,
                      size: 30,
                    )
                  ],
                )
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * (1 / 50),
            ),
            Container(
              height: 300,
              child: ListView.builder(
                  itemCount: posts.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        // Navigator.push(context ,MaterialPageRoute(builder: (ctx)=>ArticlePage(data: posts[index])))
                        print('clicked');
                      },
                      child: PostCard(
                          img: posts[index].image ?? "",
                          topic: posts[index].title ?? "",
                          title: posts[index].subTitle ?? "",
                          likes: "2.1K",
                          time: posts[index].estimatedReadTime ?? ""),
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}
