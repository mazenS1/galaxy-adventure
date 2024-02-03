// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:just_audio/just_audio.dart';
import 'dart:math';
import 'dart:async';

class AdvanceMusicPlayer extends StatefulWidget {
  const AdvanceMusicPlayer({
    Key? key,
    this.width,
    this.height,
    required this.initialUrl,
    required this.musicUrls,
    required this.sliderActiveColor,
    required this.sliderInactiveColor,
    required this.backwardIconPath,
    required this.forwardIconPath,
    required this.backwardIconColor,
    required this.forwardIconColor,
    required this.pauseIconPath,
    required this.playIconPath,
    required this.pauseIconColor,
    required this.playIconColor,
    required this.loopIconPath,
    required this.loopIconColor,
    required this.shuffleIconPath,
    required this.shuffleIconColor,
    required this.playbackDurationTextColor,
    required this.previousIconPath,
    required this.nextIconPath,
    required this.previousIconColor,
    required this.nextIconColor,
    required this.loopIconPressedPath,
    required this.shuffleIconPressedPath,
    required this.speakerOnIconPath,
    required this.speakerOffIconPath,
    required this.speakerOnIconColor,
    required this.speakerOffIconColor,
    required this.dropdownTextColor,
    required this.timerIcon,
  }) : super(key: key);

  final double? width;
  final double? height;
  final String initialUrl;
  final List<String> musicUrls;
  final Color sliderActiveColor;
  final Color sliderInactiveColor;
  final Widget backwardIconPath;
  final Widget forwardIconPath;
  final Color backwardIconColor;
  final Color forwardIconColor;
  final Widget pauseIconPath;
  final Widget playIconPath;
  final Color pauseIconColor;
  final Color playIconColor;
  final Widget loopIconPath;
  final Color loopIconColor;
  final Widget shuffleIconPath;
  final Color shuffleIconColor;
  final Color playbackDurationTextColor;
  final Widget previousIconPath;
  final Widget nextIconPath;
  final Color previousIconColor;
  final Color nextIconColor;
  final Widget loopIconPressedPath;
  final Widget shuffleIconPressedPath;
  final Widget speakerOnIconPath;
  final Widget speakerOffIconPath;
  final Color speakerOnIconColor;
  final Color speakerOffIconColor;
  final Color dropdownTextColor;
  final Widget timerIcon;

  @override
  _AdvanceMusicPlayerState createState() => _AdvanceMusicPlayerState();
}

class _AdvanceMusicPlayerState extends State<AdvanceMusicPlayer>
    with SingleTickerProviderStateMixin {
  late AudioPlayer audioPlayer;
  bool isPlaying = false;
  Duration totalDuration = Duration.zero;
  Duration currentPosition = Duration.zero;
  int currentSongIndex = 0;
  bool isLooping = false;
  bool isShuffling = false;
  bool isSpeakerOn = true;
  String playbackSpeed = 'Normal';
  Map<String, double> speedValues = {
    '0.25x': 0.25,
    '0.5x': 0.5,
    '0.75x': 0.75,
    'Normal': 1.0,
    '1.25x': 1.25,
    '1.5x': 1.5,
    '1.75': 1.75,
    '2x': 2.0,
  };

  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;
  Duration? selectedTimer;
  final List<Duration> timerOptions = [
    Duration(minutes: 1),
    Duration(minutes: 10),
    Duration(minutes: 15),
    Duration(minutes: 20),
    Duration(minutes: 25),
    Duration(minutes: 30),
    Duration(minutes: 35),
    Duration(minutes: 40),
    Duration(minutes: 45),
    Duration(minutes: 50),
    Duration(minutes: 55),
    Duration(minutes: 60),
    Duration(minutes: 90),
    Duration(minutes: 120),
  ];
  Timer? countdownTimer;

  @override
  void initState() {
    super.initState();
    audioPlayer = AudioPlayer();
    audioPlayer.setUrl(widget.initialUrl);
    audioPlayer.playerStateStream.listen((PlayerState state) {
      setState(() {
        isPlaying = state.playing;
        totalDuration = audioPlayer.duration ?? Duration.zero;
        currentPosition = audioPlayer.position ?? Duration.zero;
      });

      if (state.processingState == ProcessingState.completed) {
        playNext();
      }

      // Update currentURL
      if (state.playing) {
        FFAppState().currentURL = widget.musicUrls[currentSongIndex];
      }
    });

    audioPlayer.positionStream.listen((position) {
      setState(() {
        currentPosition = position;
      });
      // Check if the selected timer is complete
      if (selectedTimer != null && currentPosition >= selectedTimer!) {
        audioPlayer.pause();
        setState(() {
          selectedTimer = null;
        });
      }
    });

    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );

    _fadeAnimation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeIn,
    );

    _animationController.forward();
  }

  @override
  void dispose() {
    audioPlayer.dispose();
    _animationController.dispose();
    if (countdownTimer != null) {
      countdownTimer!.cancel();
    }

    super.dispose();
  }

  void seekTo(Duration position) {
    audioPlayer.seek(position);
  }

  void updatePosition(double value) {
    final newPosition = Duration(milliseconds: value.toInt());
    seekTo(newPosition); // Complete the method call by passing newPosition
  }

  void playPause() {
    if (isPlaying) {
      audioPlayer.pause();
    } else {
      audioPlayer.play();
    }
  }

  void skip(Duration duration) {
    final newPosition = currentPosition + duration;
    if (newPosition < Duration.zero) {
      seekTo(Duration.zero);
    } else if (newPosition > totalDuration) {
      seekTo(totalDuration);
    } else {
      seekTo(newPosition);
    }
  }

  void playPrevious() {
    if (currentSongIndex > 0) {
      currentSongIndex--;
    } else {
      currentSongIndex = widget.musicUrls.length - 1;
    }
    audioPlayer.setUrl(widget.musicUrls[currentSongIndex]);
    audioPlayer.play();
  }

  void playNext() {
    if (isShuffling) {
      currentSongIndex = _getRandomIndex();
    } else {
      if (currentSongIndex < widget.musicUrls.length - 1) {
        currentSongIndex++;
      } else {
        currentSongIndex = 0;
      }
    }
    audioPlayer.setUrl(widget.musicUrls[currentSongIndex]);
    audioPlayer.play();
  }

  void toggleLooping() {
    setState(() {
      isLooping = !isLooping;
      audioPlayer.setLoopMode(isLooping ? LoopMode.one : LoopMode.off);
    });
  }

  void toggleShuffle() {
    setState(() {
      isShuffling = !isShuffling;
    });
  }

  void toggleSpeaker() {
    setState(() {
      isSpeakerOn = !isSpeakerOn;
      if (isSpeakerOn) {
        audioPlayer.setVolume(1.0);
      } else {
        audioPlayer.setVolume(0.0);
      }
    });
  }

  void setPlaybackSpeed(String speed) {
    double playbackSpeed = speedValues[speed]!;
    audioPlayer.setSpeed(playbackSpeed);
  }

  int _getRandomIndex() {
    final random = Random();
    int randomIndex = currentSongIndex;
    while (randomIndex == currentSongIndex) {
      randomIndex = random.nextInt(widget.musicUrls.length);
    }
    return randomIndex;
  }

  void setTimer(Duration duration) {
    setState(() {
      selectedTimer = duration;
      if (duration == Duration.zero) {
        audioPlayer.pause(); // Pause the player if the selected timer is 0
      }
      Navigator.pop(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _fadeAnimation,
      child: Container(
        width: widget.width,
        height: widget.height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: toggleSpeaker,
                  icon: isSpeakerOn
                      ? widget.speakerOnIconPath
                      : widget.speakerOffIconPath,
                  color: isSpeakerOn
                      ? widget.speakerOnIconColor
                      : widget.speakerOffIconColor,
                ),
                DropdownButton<String>(
                  value: playbackSpeed,
                  onChanged: (String? speed) {
                    setState(() {
                      playbackSpeed = speed!;
                      setPlaybackSpeed(speed);
                    });
                  },
                  items: speedValues.keys
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(
                        value,
                        style: TextStyle(
                          color: widget.dropdownTextColor,
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ],
            ),
            SizedBox(height: 8),
            Slider(
              value: currentPosition.inMilliseconds.toDouble(),
              min: 0,
              max: totalDuration.inMilliseconds.toDouble(),
              onChanged: (double value) {
                updatePosition(value);
              },
              activeColor: widget.sliderActiveColor,
              inactiveColor: widget.sliderInactiveColor,
            ),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '${currentPosition.inMinutes}:${(currentPosition.inSeconds % 60).toString().padLeft(2, '0')}',
                  style: TextStyle(color: widget.playbackDurationTextColor),
                ),
                Text(
                  '${totalDuration.inMinutes}:${(totalDuration.inSeconds % 60).toString().padLeft(2, '0')}',
                  style: TextStyle(color: widget.playbackDurationTextColor),
                ),
              ],
            ),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  onPressed: playPrevious,
                  icon: widget.previousIconPath,
                  color: widget.previousIconColor,
                ),
                IconButton(
                  onPressed: () => skip(Duration(seconds: -10)),
                  icon: widget.backwardIconPath,
                  color: widget.backwardIconColor,
                ),
                IconButton(
                  onPressed: playPause,
                  icon: isPlaying ? widget.pauseIconPath : widget.playIconPath,
                  color:
                      isPlaying ? widget.pauseIconColor : widget.playIconColor,
                ),
                IconButton(
                  onPressed: () => skip(Duration(seconds: 10)),
                  icon: widget.forwardIconPath,
                  color: widget.forwardIconColor,
                ),
                IconButton(
                  onPressed: playNext,
                  icon: widget.nextIconPath,
                  color: widget.nextIconColor,
                ),
              ],
            ),
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: toggleLooping,
                  child: isLooping
                      ? widget.loopIconPressedPath
                      : widget.loopIconPath,
                ),
                GestureDetector(
                  onTap: toggleShuffle,
                  child: isShuffling
                      ? widget.shuffleIconPressedPath
                      : widget.shuffleIconPath,
                ),
                GestureDetector(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('Sleep Timer'),
                          content: Container(
                            height: 200,
                            width: 200,
                            child: ListView.builder(
                              itemCount: timerOptions.length,
                              itemBuilder: (BuildContext context, int index) {
                                final duration = timerOptions[index];
                                final minutes = duration.inMinutes;
                                bool isSelected = duration == selectedTimer;
                                return ListTile(
                                  title: Text(
                                    '$minutes minutes',
                                    style: TextStyle(
                                      color: isSelected
                                          ? Colors
                                              .blue // Customize the selected option's text color
                                          : null,
                                    ),
                                  ),
                                  onTap: () {
                                    setTimer(
                                        duration); // Set the selected timer
                                  },
                                );
                              },
                            ),
                          ),
                          actions: [
                            TextButton(
                              onPressed: () {
                                setState(() {
                                  selectedTimer = null;
                                  Navigator.pop(context);
                                });
                              },
                              child: Text('Cancel'),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  child: widget.timerIcon,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
