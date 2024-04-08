import 'package:flutter/material.dart';
import 'package:hello_world_app/domain/entities/video_post.dart';
import 'package:hello_world_app/domain/repositories/video_posts_repository.dart';
import 'package:hello_world_app/infrastructure/models/local_video_model.dart';
import 'package:hello_world_app/presentation/widgets/shared/data/local_video_posts.dart';

class DiscoverProvider extends ChangeNotifier {
  final VideoPostRepository videosRepositoy;

  bool initialLoading = true;
  List<VideoPost> videos = [];

  DiscoverProvider({required this.videosRepositoy});

  Future<void> loadNextPage() async {
    // await Future.delayed( const Duration(seconds: 2) );

    //final List<VideoPost> newVideos = videoPosts
    //    .map((video) => LocalVideoModel.fromJson(video).toVideoPostEntity())
    //    .toList();
    final newVideos = await videosRepositoy.getTrendingVideosByPage(1);

    videos.addAll(newVideos);
    initialLoading = false;
    notifyListeners();
  }
}
