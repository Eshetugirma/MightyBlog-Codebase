import 'package:flutter/material.dart';

class StatusCard extends StatelessWidget {
  const StatusCard({super.key});

  @override
  Widget build(BuildContext context) {
    var post = "52";
    var follower = "250";
    var following = "4.5k";
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 70),
      child: Container(
        height: MediaQuery.of(context).size.width * (1 / 5),
        padding: EdgeInsets.only(right: 10),
        decoration: BoxDecoration(
            // boxShadow: [],
            color: Colors.blue,
            borderRadius: BorderRadius.circular(14)),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(14)),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                  child: Column(
                    children: [
                      Text(post,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                          )),
                      Text("Post",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w300,
                          ))
                    ],
                  ),
                ),
              ),
              Container(
                  child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(follower,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                        )),
                    Text("Following",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w300,
                        ))
                  ],
                ),
              )),
              Container(
                  child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 15),
                child: Column(
                  children: [
                    Text(following,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                        )),
                    Text("Followers",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w300,
                        ))
                  ],
                ),
              ))
            ],
          ),
        ),
      ),
    );
  }
}
