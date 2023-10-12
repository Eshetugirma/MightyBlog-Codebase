import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class BlogTileSkeleton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!, // Specify your desired base color
      highlightColor: Colors.grey[100]!, // Specify your desired highlight color
      child: Container(
        height: 230,
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white, // Set the background color to white
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Shimmering image placeholder
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: SizedBox(
                    height: 100,
                    width: 100,
                    child: Container(
                      color: Colors.white,
                    ),
                  ),
                ),

                // Shimmering title and text placeholders
                const SizedBox(width: 17),
                SizedBox(
                  height: 180,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 100,
                        child: Text(
                          'Placeholder Title',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      Container(
                        width: 100,
                        child: Text('Placeholder Subtitle'),
                      ),
                      Spacer(),
                      Container(
                        height: 30,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          itemCount:
                              5, // Specify the number of tag placeholders
                          itemBuilder: (ctx, index) {
                            return Container(
                              width: 80,
                              margin: EdgeInsets.symmetric(horizontal: 5),
                              decoration: BoxDecoration(
                                color: Colors.grey[300]!,
                                borderRadius: BorderRadius.circular(20),
                              ),
                            );
                          },
                        ),
                      ),
                      const Spacer(),
                      Text(
                        'by Placeholder Author',
                        style: TextStyle(fontSize: 14),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const Spacer(),
            Row(
              children: [
                const Spacer(),
                SizedBox(
                  height: 20,
                  child: Container(
                    color: Colors.grey[300]!, // Specify your desired color
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
