import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:pixel_snake/home_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late VideoPlayerController _controller1;
  late VideoPlayerController _controller2;
  late VideoPlayerController _controller3;
  late VideoPlayerController _controller4;
  late VideoPlayerController _controller5;
  bool _firstVideoComplete = false;
  bool _secondVideoComplete = false;
  bool _thirdVideoComplete = false;
  bool _forthVideoComplete = false;

  @override
  void initState() {
    super.initState();
    _initializeFirstVideo();
  }

  void _initializeFirstVideo() {
    _controller1 = VideoPlayerController.asset('assets/EntryVideo1.mp4')
      ..initialize().then((_) {
        setState(() {});
        _controller1.play();
        _controller1.addListener(() {
          if (_controller1.value.position >= _controller1.value.duration!) {
            setState(() {
              _firstVideoComplete = true;
            });
            _controller1.dispose(); 
            _initializeSecondVideo();
          }
        });
      });
  }

  void _initializeSecondVideo() {
    _controller2 = VideoPlayerController.asset('assets/MOVERight.mp4')
      ..initialize().then((_) {
        setState(() {});
        _controller2.play();
        _controller2.addListener(() {
          if (_controller2.value.position >= _controller2.value.duration!) {
            setState(() {
              _secondVideoComplete = true;
            });
            _controller2.dispose(); 
            _initializeThirdVideo();
          }
        });
      });
  }

  void _initializeThirdVideo() {
    _controller3 = VideoPlayerController.asset('assets/MOVEleft.mp4')
      ..initialize().then((_) {
        setState(() {});
        _controller3.play();
        _controller3.addListener(() {
          if (_controller3.value.position >= _controller3.value.duration!) {
            setState(() {
              _thirdVideoComplete = true;
            });
            _controller3.dispose(); 
            _initializeForthVideo();
          }
        });
      });
  }

  void _initializeForthVideo() {
    _controller4 = VideoPlayerController.asset('assets/MOVEup.mp4')
      ..initialize().then((_) {
        setState(() {});
        _controller4.play();
        _controller4.addListener(() {
          if (_controller4.value.position >= _controller4.value.duration!) {
            setState(() {
              _forthVideoComplete = true;
            });
            _controller4.dispose(); 
            _initializeFifthVideo();
          }
        });
      });
  }

  void _initializeFifthVideo() {
    _controller5 = VideoPlayerController.asset('assets/MOVEdown.mp4')
      ..initialize().then((_) {
        setState(() {});
        _controller5.play();
        _controller5.addListener(() {
          if (_controller5.value.position >= _controller5.value.duration!) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => HomePage()),
            );
          }
        });
      });
  }

  @override
  void dispose() {
    super.dispose();
    _controller1.dispose();
    _controller2.dispose();
    _controller3.dispose();
    _controller4.dispose();
    _controller5.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _firstVideoComplete
            ? _secondVideoComplete
                ? _thirdVideoComplete
                    ? _forthVideoComplete
                        ? _controller5.value.isInitialized
                            ? AspectRatio(
                                aspectRatio: _controller5.value.aspectRatio,
                                child: VideoPlayer(_controller5),
                              )
                            : CircularProgressIndicator()
                        : _controller4.value.isInitialized
                            ? AspectRatio(
                                aspectRatio: _controller4.value.aspectRatio,
                                child: VideoPlayer(_controller4),
                              )
                            : CircularProgressIndicator()
                    : _controller3.value.isInitialized
                        ? AspectRatio(
                            aspectRatio: _controller3.value.aspectRatio,
                            child: VideoPlayer(_controller3),
                          )
                        : CircularProgressIndicator()
                : _controller2.value.isInitialized
                    ? AspectRatio(
                        aspectRatio: _controller2.value.aspectRatio,
                        child: VideoPlayer(_controller2),
                      )
                    : CircularProgressIndicator()
            : _controller1.value.isInitialized
                ? AspectRatio(
                    aspectRatio: _controller1.value.aspectRatio,
                    child: VideoPlayer(_controller1),
                  )
                : CircularProgressIndicator(),
      ),
    );
  }
}
