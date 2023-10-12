import 'package:flutter/material.dart';

class PostCard extends StatelessWidget {
  final String img;
  final String topic;
  final String title;
  final String likes;
  final String time;
  final bool saved;
  const PostCard(
      {super.key,
      required this.img,
      required this.topic,
      required this.title,
      required this.likes,
      required this.time,
      this.saved = false});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Container(
        height: MediaQuery.of(context).size.width * (1 / 2) * 0.72,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(13),
          color: Colors.white,
          // boxShadow: [],
        ),
        child: Row(
          children: [
            Container(
              width: MediaQuery.of(context).size.width * (1 / 4) * 0.98,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(13),
                  image: DecorationImage(
                      fit: BoxFit.cover, image: NetworkImage(img))),
            ),
            Container(
              width: MediaQuery.of(context).size.width * (2 / 3) * 0.83,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(topic,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w200,
                          fontStyle: FontStyle.italic,
                        )),
                    Text(title,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        softWrap: false,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        )),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.thumb_up_alt_outlined, size: 20),
                            SizedBox(
                              width: MediaQuery.of(context).size.height *
                                  (1 / 180),
                            ),
                            Text(likes,
                                style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w300,
                                )),
                          ],
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.access_time_outlined,
                              size: 20,
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.height *
                                  (1 / 180),
                            ),
                            Text(time,
                                style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w300,
                                )),
                          ],
                        ),
                        Icon(Icons.bookmark,
                            size: 20,
                            color: saved
                                ? const Color.fromARGB(255, 241, 240, 237)
                                : Colors.transparent)
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
