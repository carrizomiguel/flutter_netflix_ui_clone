import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:netflix_ui/ui/content/home/models/content_model.dart';
import 'package:video_player/video_player.dart';

class WebHeaderPreview extends StatefulWidget {
  const WebHeaderPreview({
    Key? key,
    required this.featuredContent,
  }) : super(key: key);

  final Content featuredContent;

  @override
  State<WebHeaderPreview> createState() => _WebHeaderPreviewState();
}

class _WebHeaderPreviewState extends State<WebHeaderPreview> {
  late VideoPlayerController _videoController;
  bool _isMuted = true;
  bool _isPlaying = false;
  bool _showVideoAction = false;

  @override
  void initState() {
    super.initState();
    _videoController = VideoPlayerController.asset(
      widget.featuredContent.videoUrl!,
    );
    Future.delayed(const Duration(seconds: 3), () {
      _videoController
        ..initialize().then((_) => setState(() {}))
        ..setVolume(0)
        ..play();
      setState(() {
        _showVideoAction = true;
      });
    });
    _videoController.addListener(() {
      setState(() {
        _isPlaying = _videoController.value.isPlaying;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    _videoController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: () => _videoController.value.isPlaying
          ? _videoController.pause()
          : _videoController.play(),
      child: Stack(
        alignment: Alignment.bottomLeft,
        children: [
          AspectRatio(
            aspectRatio: 16 / 9,
            child: _isPlaying
                ? VideoPlayer(_videoController)
                : Image.asset(
                    widget.featuredContent.webImage!,
                    fit: BoxFit.cover,
                  ),
          ),
          Positioned(
            right: 0,
            left: 0,
            bottom: -1,
            child: AspectRatio(
              aspectRatio: 16 / 9,
              child: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.transparent,
                      Colors.transparent,
                      Colors.transparent,
                      Colors.transparent,
                      Colors.transparent,
                      Color(0xFF141414),
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            left: 60,
            top: 0,
            bottom: 0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: size.width * .13,
                  child: Image.asset(widget.featuredContent.titleImageUrl!),
                ),
                const SizedBox(height: 15),
                SizedBox(
                  width: size.width * .45,
                  child: Text(
                    widget.featuredContent.description!,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: size.width * .012, 
                      fontWeight: FontWeight.w500,
                      shadows: const [
                        Shadow(
                          color: Colors.black,
                          offset: Offset(2, 4),
                          blurRadius: 6.0,
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    _ActionButton(
                      label: 'Play',
                      icon: Iconsax.video_circle,
                      color: Colors.white,
                      textColor: Colors.black,
                      size: size,
                    ),
                    const SizedBox(width: 15),
                    _ActionButton(
                      label: 'More Info',
                      icon: Iconsax.info_circle,
                      color: Colors.grey,
                      textColor: Colors.white,
                      size: size,
                    ),
                  ],
                )
              ],
            ),
          ),
          Visibility(
            visible: _showVideoAction,
            child: Positioned(
              bottom: size.width * .15,
              right: 60,
              child: IconButton(
                onPressed: _isPlaying
                    ? () {
                        setState(() {
                          _isMuted = !_isMuted;
                          _videoController.setVolume(_isMuted ? 0 : 1);
                        });
                      }
                    : () {
                        _videoController.play();
                      },
                icon: Icon(
                  _isPlaying
                      ? _isMuted
                          ? Iconsax.volume_cross
                          : Iconsax.volume_high
                      : Iconsax.rotate_left,
                  color: Colors.white,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class _ActionButton extends StatelessWidget {
  const _ActionButton({
    Key? key,
    required this.label,
    required this.icon,
    required this.color,
    required this.textColor,
    required this.size,
  }) : super(key: key);

  final String label;
  final IconData icon;
  final Color color;
  final Color textColor;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: () {},
      icon: Icon(
        icon,
        color: textColor,
        size: size.width * .017,
      ),
      label: Text(
        label,
        style: TextStyle(
          color: textColor,
          fontSize: size.width * .015,
          fontWeight: FontWeight.w600,
        ),
      ),
      style: ElevatedButton.styleFrom(
        primary: color,
        padding: EdgeInsets.symmetric(
          vertical: size.width * .013,
          horizontal: size.width * .025,
        ),
      ),
    );
  }
}
