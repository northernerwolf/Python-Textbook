import 'package:chewie/chewie.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:test_app/import.dart';
import 'package:video_player/video_player.dart';

class VideosScreen extends StatefulWidget {
  const VideosScreen({super.key});

  @override
  State<VideosScreen> createState() => _VideosScreenState();
}

class _VideosScreenState extends State<VideosScreen> {
  List videos = [
    // {"id": 1, "video": 'assets/images/banner1.png'},
    // {"id": 2, "video": 'assets/images/banner1.png'},
    // {"id": 3, "video": 'assets/images/banner1.png'},
    // {"id": 4, "video": 'assets/images/banner1.png'},
    // {"id": 5, "video": 'assets/images/banner1.png'},
    // {"id": 6, "video": 'assets/images/banner1.png'},
    'assets/videos/0.mp4',
    'assets/videos/1.mp4',
    'assets/videos/2.mp4',
    'assets/videos/3.mp4',
    'assets/videos/4.mp4',
    'assets/videos/5.mp4',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        flexibleSpace: colorfulAppBar,
        title: Text("Video tutorials"),
        centerTitle: true,
        elevation: 8,
      ),
      body: SafeArea(
          child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Col.amber,
                  Col.blue,
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            height: double.infinity,
            width: double.infinity,
          ),
          ListView.builder(
              shrinkWrap: true,
              itemCount: videos.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => VideosWidget(
                              url: videos[index],
                            )));
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 200,
                      width: double.infinity,
                      child: Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: Image.asset(
                              'assets/images/hqdefault.jpg',
                              height: 200,
                              width: double.infinity,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Center(
                            child: Icon(
                              Icons.play_arrow,
                              size: 100,
                              color: Colors.white,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                );
              })
        ],
      )),
    );
  }
}

class VideosWidget extends StatefulWidget {
  dynamic url;
  VideosWidget({required this.url, super.key});

  @override
  State<VideosWidget> createState() => _VideosWidgetState();
}

class _VideosWidgetState extends State<VideosWidget> {
  late ChewieController _chewieController;
  late VideoPlayerController _videoPlayerController;
  @override
  void initState() {
    _videoPlayerController = VideoPlayerController.asset(
      widget.url,
      videoPlayerOptions: VideoPlayerOptions(
        allowBackgroundPlayback: true,
        mixWithOthers: true,
      ),
    );
    _chewieController = ChewieController(
      videoPlayerController: _videoPlayerController,
      allowFullScreen: true,
      autoPlay: true,
      autoInitialize: true,
      allowMuting: true,
      looping: true,
      showControls: true,
      showControlsOnInitialize: true,
      allowPlaybackSpeedChanging: true,
      maxScale: 2.5,
      showOptions: false,
      zoomAndPan: false,
      aspectRatio: 16 / 9,
      progressIndicatorDelay: const Duration(seconds: 3),
    );
    super.initState();
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    _chewieController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: colorfulAppBar,
        title: Text("Video tutorials"),
        centerTitle: true,
        elevation: 8,
      ),
      body: Center(
        child: SizedBox(
          width: double.infinity,
          height: 235,
          child: Center(
            child: Chewie(
              controller: _chewieController,
            ),
          ),
        ),
      ),
    );
  }
}
