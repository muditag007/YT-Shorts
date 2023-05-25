// ignore_for_file: sized_box_for_whitespace, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class ShortTile extends StatefulWidget {
  static String id = 'temp';
  const ShortTile(
      {super.key,
      required this.mediaUrl,
      required this.imageUrl,
      required this.profileImage,
      required this.username,
      required this.comment,
      required this.likes,
      required this.desc});

  final String mediaUrl;
  final String imageUrl;
  final String profileImage;
  final String username;
  final String comment;
  final String likes;
  final String desc;

  @override
  State<ShortTile> createState() => _ShortTileState();
}

class _ShortTileState extends State<ShortTile> {
  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture;

  @override
  void initState() {
    _controller = VideoPlayerController.network(
      widget.mediaUrl,
    );
    _initializeVideoPlayerFuture = _controller.initialize();
    _controller.play();

    _controller.setLooping(true);

    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          InkWell(
            onTap: () {
              setState(() {
                if (_controller.value.isPlaying) {
                  _controller.pause();
                } else {
                  _controller.play();
                }
              });
            },
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: FutureBuilder(
                future: _initializeVideoPlayerFuture,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    return AspectRatio(
                      aspectRatio: _controller.value.aspectRatio,
                      child: VideoPlayer(_controller),
                    );
                  } else {
                    return Container(
                      color: Colors.black,
                      child: Center(
                          child: CircularProgressIndicator(
                        color: Colors.white,
                      )),
                    );
                    // return Image.network(widget.imageUrl,fit: BoxFit.cover,);
                    // return
                  }
                },
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).viewPadding.top + 10,
              left: 15,
              right: 15,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(Icons.arrow_back),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      "PocketUp",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Icon(Icons.search),
                    SizedBox(
                      width: 15,
                    ),
                    Icon(Icons.camera_alt_outlined),
                    SizedBox(
                      width: 15,
                    ),
                    Icon(Icons.menu),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: 670,
              left: 20,
            ),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(70.0),
                  child: Image.network(
                    widget.profileImage,
                    height: 35,
                    width: 35,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  widget.username,
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 20,
              top: 710,
              right: 70,
            ),
            child: Text(
              widget.desc,
              softWrap: true,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          Positioned(
            right: 20,
            top: 380,
            child: Column(
              children: [
                Icon(
                  Icons.thumb_up,
                  size: 30,
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  widget.likes,
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Icon(
                  Icons.thumb_down,
                  size: 30,
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  "Dislike",
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Icon(
                  Icons.message,
                  size: 30,
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  widget.comment,
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Icon(
                  Icons.share_rounded,
                  size: 30,
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  "Share",
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Icon(
                  Icons.ios_share_outlined,
                  size: 30,
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  "Remix",
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
