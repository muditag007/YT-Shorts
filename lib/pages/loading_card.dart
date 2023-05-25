// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

class LoadingCard extends StatelessWidget {
  const LoadingCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        right: 5,
      ),
      child: Shimmer(
        direction: ShimmerDirection.fromLTRB(),
        color: Colors.white,
        child: Container(
          height: 150,
          width: 100,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
    );
  }
}