// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:yt_shorts/pages/loading_card.dart';
import 'package:yt_shorts/pages/short_page.dart';

class ShortCard extends StatefulWidget {
  final String photo;
  final String pageNum;
  final int id;
  const ShortCard({
    required this.photo,
    required this.pageNum,
    required this.id,
  });

  @override
  State<ShortCard> createState() => _ShortCardState();
}

class _ShortCardState extends State<ShortCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        right: 5,
      ),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ShortPage(
                widget.id,
                widget.pageNum,
              ),
            ),
          );
          // Navigator.pushNamed(context,ShortPage.id);
        },
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8.0),
          child: Image.network(
            widget.photo,
            height: 150.0,
            width: 100.0,
            fit: BoxFit.fill,
            loadingBuilder: (context, child, loadingProgress) {
              if (loadingProgress == null) return child;
              return LoadingCard();
            },
          ),
        ),
      ),
    );
  }
}
