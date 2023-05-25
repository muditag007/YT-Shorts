// ignore_for_file: avoid_types_as_parameter_names

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yt_shorts/models/shorts.dart';
import 'package:yt_shorts/services/services.dart';

final shortsDataProvider = FutureProvider.family<ShortsList,String>((ref,num) async {
  return ref.watch(shortsProvider).getInfo(num);
});

