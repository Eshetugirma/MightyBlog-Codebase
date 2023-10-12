import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class MyBlogCard extends StatelessWidget {
  const MyBlogCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.grey,
        ),
        height: 200,
        child: Row(children: [
          Container(
            width: 150,
            // decoration: BoxDecoration(color: Colors.blue, borderRadius: Border),
            child: Image.network("url"),
          ),
          const SizedBox(width: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                  width: 180,
                  child: Text(
                      "hello this is me  hello this is me jjjjjjjjjjj hello this is me jjjjjjjjjjj")),
              const SizedBox(
                  width: 180, child: Text("hello this is me jjjjjjjjjjj")),
              SizedBox(
                height: 30,
                width: 180,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 5,
                    itemBuilder: ((context, index) {
                      return const Chip(label: Text("chip"));
                    })),
              ),
              const SizedBox(
                width: 180,
                child: Row(
                  children: [
                    SizedBox(
                      width: 180,
                      child: Text("by Mati"),
                    ),
                    Spacer(),
                  ],
                ),
              ),
              const SizedBox(
                width: 180,
                child: Row(
                  children: [
                    Spacer(),
                    SizedBox(
                      width: 100,
                      child: Text("aug 12 2022"),
                    ),
                  ],
                ),
              )
            ],
          ),
        ]),
      ),
    );
  }
}
