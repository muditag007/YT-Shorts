// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, unused_local_variable, unrelated_type_equality_checks, avoid_print, unnecessary_brace_in_string_interps
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yt_shorts/models/shorts.dart';
import 'package:yt_shorts/pages/loading_card.dart';
import 'package:yt_shorts/pages/short_card.dart';
import 'package:yt_shorts/provider/shorts_provider.dart';

class PagePreview extends ConsumerWidget {
  static String id = 'pagepreview';
  const PagePreview(this.pageNum, {super.key});
  final String pageNum;

  @override
  Widget build(BuildContext context, ref) {
    final counter = ref.watch(shortsDataProvider(pageNum));

    return counter.when(
      data: (counter) {
        return Container(
          height: 200,
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  '  Page ${int.parse(pageNum)+1}',
                  style: TextStyle(
                    fontSize: 22,
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 150,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 8,
                  ),
                  child: ListView.builder(
                    physics: BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount: counter.data!.posts!.length,
                    itemBuilder: (context, index) {
                      List<Posts>? upcom = counter.data!.posts;
                      // for (int i = 0; i < upcom!.length; i++) {
                      //   print(upcom[i].titleText!.text);
                      // }
                      return ShortCard(
                        photo: upcom![index].submission!.thumbnail.toString(),
                        pageNum: pageNum,
                        id: index.toInt(),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        );
      },
      error: (err, s) => Text(
        err.toString(),
        style: TextStyle(
          color: Colors.white,
        ),
      ),
      loading: () => Container(
        height: 200,
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                '  Page 1',
                style: TextStyle(
                  fontSize: 22,
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 150,
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 8,
                ),
                child: ListView.builder(
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return LoadingCard();
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
