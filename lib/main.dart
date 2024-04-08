import 'package:flutter/material.dart';
import 'package:hello_world_app/infrastructure/datasources/local_video_datasource_impl.dart';
import 'package:hello_world_app/infrastructure/repositories/video_posts_repository_impl.dart';
import 'package:hello_world_app/presentation/providers/chat_provider.dart';
import 'package:hello_world_app/presentation/providers/discover_provider.dart';
import 'package:hello_world_app/presentation/screens/discover/discover_screen.dart';
import 'package:provider/provider.dart';
import 'package:hello_world_app/config/theme/app_theme.dart';
import 'package:hello_world_app/presentation/screens/chat/chat_screen.dart';
// import 'package:hello_world_app/presentation/screens/counter/counter_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final videoPostReposity =
        VideoPostsRepositoryImpl(videosDatasource: LocalVideoDatasource());

    return MultiProvider(
      //providers: [ChangeNotifierProvider(create: (_) => ChatProvider())],
      //providers: [
      //  ChangeNotifierProvider(
      //     lazy: false, create: (_) => DiscoverProvider()..loadNextPage()),
      //],
      providers: [
        ChangeNotifierProvider(
            lazy: false,
            create: (_) => DiscoverProvider(videosRepositoy: videoPostReposity)
              ..loadNextPage()),
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: AppTheme(selectedColor: 2).theme(),
          home: const DiscoverScreen()),
    );
  }
}
