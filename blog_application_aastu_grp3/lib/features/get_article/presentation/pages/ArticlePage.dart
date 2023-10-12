import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../data/models/article_model.dart';

class ArticlePage extends StatelessWidget {
  final Data data;
  const ArticlePage({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
//     String text =
//         """ That marked a turnaround from last year, when the social network reported a decline in users for the first time. The drop wiped billions from the firm's market value. Since executives disclosed the fall in February, the firm's share price has nearly halved. But shares jumped 19% in after-hours trade on Wednesday.
//         That marked a turnaround from last year, when the social network reported a decline in users for the first time. The drop wiped billions from the firm's market value. Since executives disclosed the fall in February, the firm's share price has nearly halved. But shares jumped 19% in after-hours trade on Wednesday.
//         That marked a turnaround from last year, when the social network reported a decline in users for the first time. The drop wiped billions from the firm's market value. Since executives disclosed the fall in February, the firm's share price has nearly halved. But shares jumped 19% in after-hours trade on Wednesday.
// """;
    double deviceWidth = MediaQuery.sizeOf(context).width;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              icon: const Icon(
                Icons.arrow_back_ios_new_rounded,
                size: 32,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.more_horiz,
                  size: 32,
                ))
          ],
        ),
      ),
      body: _articleBody(data, deviceWidth),
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GestureDetector(
          onTap: () {},
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(15),
            ),
            child: const SizedBox(
              width: 70,
              height: 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    '2.5k',
                    style: TextStyle(color: Colors.white),
                  ),
                  Icon(
                    Icons.thumb_up_alt,
                    color: Colors.white,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
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

Widget _articleBody(Data data, double deviceWidth) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          children: [
            SizedBox(
                height: 80,
                child: Text(
                  "${data.title ?? "No Title"}",
                  style: const TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.w600,
                    color: Color(0xff0d253c),
                  ),
                )),
            ListTile(
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: SizedBox(
                  height: 50,
                  width: 50,
                  child: Image.network(
                      data.user?.image ??
                          "https://ps.w.org/user-avatar-reloaded/assets/icon-256x256.png?rev=2540745",
                      fit: BoxFit.cover),
                ),
              ),
              title: Text(data.user?.fullName ?? ""),
              subtitle: Text(formatDate(data.createdAt ?? ""),
                  style: const TextStyle(
                      color: Colors.grey, fontWeight: FontWeight.w600)),
              trailing: IconButton(
                icon: const Icon(Icons.bookmark_border_outlined),
                onPressed: () {},
              ),
            ),
            const SizedBox(height: 5)
          ],
        ),
      ),
      Expanded(
        child: ListView(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(15), topRight: Radius.circular(15)),
              child: SizedBox(
                height: 219,
                width: deviceWidth,
                child: Image.network("${data.image}", fit: BoxFit.contain),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Text(
                data.content ?? " No content",
                style: const TextStyle(fontSize: 16),
              ),
            )
          ],
        ),
      ),
    ],
  );
}
