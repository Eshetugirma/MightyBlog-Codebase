import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ProfileShimmer extends StatefulWidget {
  const ProfileShimmer({super.key});

  @override
  State<ProfileShimmer> createState() => _ProfileShimmerState();
}

class _ProfileShimmerState extends State<ProfileShimmer> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Padding(
              padding:
                  EdgeInsets.all(MediaQuery.of(context).size.width * (1 / 10)),
              child: Container(
                height: 250,
                child: Padding(
                  padding: EdgeInsets.all(
                      MediaQuery.of(context).size.width * (1 / 18)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              border: Border.all(width: 2, color: Colors.black),
                              borderRadius: BorderRadius.circular(
                                MediaQuery.of(context).size.width * (1 / 14),
                              ),
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(
                                MediaQuery.of(context).size.width * (1 / 60),
                              ),
                              child: Shimmer.fromColors(
                                baseColor: Colors.grey[300]!,
                                highlightColor: Colors.grey[100]!,
                                child: Container(
                                  height: MediaQuery.of(context).size.width *
                                      (1 / 5) *
                                      0.9,
                                  width: MediaQuery.of(context).size.width *
                                      (1 / 5) *
                                      0.9,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(
                                      MediaQuery.of(context).size.width *
                                          (1 / 18),
                                    ),
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 20),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Shimmer.fromColors(
                                baseColor: Colors.grey[300]!,
                                highlightColor: Colors.grey[100]!,
                                child: Container(
                                  height: 18,
                                  width: 150,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(height: 5),
                              Shimmer.fromColors(
                                baseColor: Colors.grey[300]!,
                                highlightColor: Colors.grey[100]!,
                                child: Container(
                                  height: 16,
                                  width: 150,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(height: 5),
                              Shimmer.fromColors(
                                baseColor: Colors.grey[300]!,
                                highlightColor: Colors.grey[100]!,
                                child: Container(
                                  height: 14,
                                  width: 150,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 5),
                      Shimmer.fromColors(
                        baseColor: Colors.grey[300]!,
                        highlightColor: Colors.grey[100]!,
                        child: Container(
                          height: 16,
                          width: 80,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 5),
                      Shimmer.fromColors(
                        baseColor: Colors.grey[300]!,
                        highlightColor: Colors.grey[100]!,
                        child: Container(
                          height: 14,
                          width: 250,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const StatusCard(),
          ],
        ),
        UserPostShimmer()
      ],
    );
  }
}

class StatusCard extends StatelessWidget {
  const StatusCard({Key? key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 70),
      child: Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        child: Container(
          height: MediaQuery.of(context).size.width * (1 / 5),
          padding: EdgeInsets.only(right: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

class UserPostShimmer extends StatelessWidget {
  UserPostShimmer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(22),
          topRight: Radius.circular(22),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 30),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "My Posts",
                  style: TextStyle(fontSize: 21, fontWeight: FontWeight.w500),
                ),
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
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * (1 / 50),
            ),
            Container(
              height: 300,
              child: ListView.builder(
                itemCount: 5, // Number of shimmer items
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return SizedBox(
                    height: 120, // Height of each shimmer item
                    child: Shimmer.fromColors(
                      baseColor: Colors.grey[300]!,
                      highlightColor: Colors.grey[100]!,
                      child: Container(
                        margin: EdgeInsets.symmetric(vertical: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(13),
                          color: Colors.white,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
