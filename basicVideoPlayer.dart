//add video_player: ^2.8.1 to pubspec.yaml

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: const VideoPlayerScreen(),
    );
  }
}

class VideoPlayerScreen extends StatefulWidget {
  const VideoPlayerScreen({super.key});
  @override
  State<VideoPlayerScreen> createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  late VideoPlayerController _controller;
  bool _isInitialized = false;
  bool _showControls = true;
  Timer? _hideTimer;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.networkUrl(
      Uri.parse('https://ygrsvrxiygsdvudcngfc.supabase.co/storage/v1/object/public/deneme/galacticOdyssey/1.mp4'),
    )..initialize().then((_) {
        setState(() => _isInitialized = true);
        _startHideTimer();
      });

    _controller.addListener(() {
      if (mounted) setState(() {});
    });
  }

  void _startHideTimer() {
    _hideTimer?.cancel();
    if (_controller.value.isPlaying) {
      _hideTimer = Timer(const Duration(seconds: 3), () {
        if (mounted) setState(() => _showControls = false);
      });
    }
  }

  void _toggleControls() {
    setState(() {
      _showControls = !_showControls;
    });
    if (_showControls) _startHideTimer();
  }

  @override
  void dispose() {
    _hideTimer?.cancel();
    _controller.dispose();
    super.dispose();
  }

  String _formatDuration(Duration duration) {
    return "${duration.inMinutes.remainder(60).toString().padLeft(2, '0')}:${duration.inSeconds.remainder(60).toString().padLeft(2, '0')}";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('YouTube Style Player')),
      body: Center(
        child: _isInitialized
            ? Container(
                width: 320,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: AspectRatio(
                    aspectRatio: _controller.value.aspectRatio,
                    child: Stack(
                      children: [
                        // 1. KATMAN: VIDEO
                        VideoPlayer(_controller),

                        // 2. KATMAN: GENEL TIKLAMA ALANI (Aç/Kapat için)
                        Positioned.fill(
                          child: GestureDetector(
                            behavior: HitTestBehavior.opaque,
                            onTap: _toggleControls,
                            child: Container(
                              color: _showControls ? Colors.black38 : Colors.transparent,
                            ),
                          ),
                        ),

                        // 3. KATMAN: KONTROLLER (En üstte olmalı ki butonlara basılsın)
                        if (_showControls)
                          IgnorePointer(
                            ignoring: !_showControls,
                            child: Stack(
                              children: [
                                // Orta Play/Pause
                                Center(
                                  child: CircleAvatar(
                                    backgroundColor: Colors.white24,
                                    radius: 30,
                                    child: IconButton(
                                      iconSize: 40,
                                      icon: Icon(
                                        _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
                                        color: Colors.white,
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          _controller.value.isPlaying ? _controller.pause() : _controller.play();
                                        });
                                        _startHideTimer();
                                      },
                                    ),
                                  ),
                                ),
                                // Alt Mavi Panel
                                Positioned(
                                  bottom: 10,
                                  left: 10,
                                  right: 10,
                                  child: Container(
                                    padding: const EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                      color: Colors.blueAccent.withOpacity(0.9),
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        VideoProgressIndicator(
                                          _controller,
                                          allowScrubbing: true,
                                          colors: const VideoProgressColors(playedColor: Colors.white),
                                        ),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(_formatDuration(_controller.value.position), style: const TextStyle(fontSize: 10)),
                                            Text(_formatDuration(_controller.value.duration), style: const TextStyle(fontSize: 10)),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
              )
            : const CircularProgressIndicator(),
      ),
    );
  }
}
