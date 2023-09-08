import 'package:edu_learn_app/untils/colors.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoApp extends StatefulWidget {
  const VideoApp({Key? key}) : super(key: key);

  @override
  _VideoAppState createState() => _VideoAppState();
}

class _VideoAppState extends State<VideoApp> {
  late VideoPlayerController _controller;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(
        'https://assets.mixkit.co/videos/preview/mixkit-general-aerial-view-of-a-paradisiacal-estuary-50220-large.mp4')
      ..initialize().then((value) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        _controller.addListener(() {
          //custom Listner
          setState(() {
            if (!_controller.value.isPlaying &&
                _controller.value.isInitialized &&
                (_controller.value.duration == _controller.value.position)) {
              //checking the duration and position every time
              setState(() {
                isLoading = false;
              });
            }
          });
        });
      });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: _controller.value.isInitialized
          ? Stack(alignment: AlignmentDirectional.center, children: [
              AspectRatio(
                aspectRatio: _controller.value.aspectRatio,
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: VideoPlayer(_controller)),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    // If the video is playing, pause it.
                    if (_controller.value.isPlaying) {
                      _controller.pause();
                    } else {
                      // If the video is paused, play it.
                      _controller.play();
                    }
                  });
                },
                child: _controller.value.isPlaying
                    ? Container()
                    : Container(
                        width: 40,
                        height: 40,
                        decoration: const BoxDecoration(
                            color: Color(0xFFFDE0B0),
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                        child: Icon(
                          _controller.value.isPlaying
                              ? Icons.pause
                              : Icons.play_arrow_outlined,
                          color: AppColors.primaryColor,
                          size: 16,
                        ),
                      ),
              ),
            ])
          : const CircularProgressIndicator(),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}
