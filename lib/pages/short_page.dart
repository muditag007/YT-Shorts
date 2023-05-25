// ignore_for_file: prefer_const_constructors, unused_local_variable, avoid_unnecessary_containers, no_leading_underscores_for_local_identifiers, unused_import, sized_box_for_whitespace, prefer_interpolation_to_compose_strings

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:video_player/video_player.dart';
import 'package:yt_shorts/pages/short_tile.dart';
import 'package:yt_shorts/provider/shorts_provider.dart';
import 'package:yt_shorts/services/services.dart';

class ShortPage extends ConsumerWidget {
  static String id = 'shortpage';
  const ShortPage(this.offset, this.pageNum, {super.key});
  final int offset;
  final String pageNum;

  @override
  Widget build(BuildContext context, ref) {
    PageController _controllerPage = PageController(
      initialPage: offset,
    );
    VideoPlayerController _controller;
    Future<void> _initializeVideoPlayerFuture;

    final counter = ref.watch(shortsDataProvider(pageNum));
    return counter.when(
        data: (counter) {
          List<Widget> short = [];
          for (int i = 0; i < counter.data!.posts!.length; i++) {
            short.add(
              ShortTile(
                imageUrl:
                    counter.data!.posts![i].submission!.thumbnail.toString(),
                mediaUrl:
                    counter.data!.posts![i].submission!.mediaUrl.toString(),
                comment: counter.data!.posts![i].comment!.count.toString(),
                desc:
                    counter.data!.posts![i].submission!.description.toString(),
                likes: counter.data!.posts![i].reaction!.count.toString(),
                profileImage:
                    counter.data!.posts![i].submission!.thumbnail.toString(),
                username:
                    "@" + counter.data!.posts![i].creator!.handle.toString(),
              ),
            );
          }

          return Container(
            child: PageView(
              controller: _controllerPage,
              scrollDirection: Axis.vertical,
              children: short,
            ),
          );
        },
        error: (err, s) => Text(
              err.toString(),
              style: TextStyle(
                color: Colors.white,
              ),
            ),
        loading: () {
          return Center(
              child: CircularProgressIndicator(
            color: Colors.white,
          ));
        });
  }
}
