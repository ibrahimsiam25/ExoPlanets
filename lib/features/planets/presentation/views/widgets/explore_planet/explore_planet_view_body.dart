import 'package:flutter/material.dart';
import 'package:exo_planets/core/helpers/spacing.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../core/model/planet_model.dart';
import 'package:exo_planets/core/theme/app_text_styles.dart';
import '../../../../../../core/helpers/get_vedio_id_from_url.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:exo_planets/features/planets/presentation/views/widgets/explore_planet/explore_item.dart';
import 'package:exo_planets/features/planets/presentation/views/widgets/explore_planet/custom_explore_app_bar.dart';

class ExplorePlanetViewBody extends StatefulWidget {
  const ExplorePlanetViewBody({super.key, required this.planetModel});
  final PlanetModel planetModel;

  @override
  State<ExplorePlanetViewBody> createState() => _ExplorePlanetViewBodyState();
}

class _ExplorePlanetViewBodyState extends State<ExplorePlanetViewBody> {
  bool _isVideoPlaying = false;
  final double _maxHeight = 300.h;
  final double _minHeight = 120.h;
  double _stackHeight = 300.h;

  late final ScrollController _scrollController;

  late final YoutubePlayerController _controller = YoutubePlayerController(
    initialVideoId: getVideoIdFromUrl(widget.planetModel.youtubeLink),
    flags: const YoutubePlayerFlags(
      autoPlay: true,
      mute: false,
    ),
  );

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    double newHeight = _maxHeight - _scrollController.offset;

    if (newHeight < _minHeight) {
      newHeight = _minHeight;
    } else if (newHeight > _maxHeight) {
      newHeight = _maxHeight;
    }

    setState(() {
      _stackHeight = newHeight;
    });
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              height: _stackHeight,
              width: double.infinity,
              child: Image.asset(
                widget.planetModel.imageForExplore,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            CustomExploreAppBar(planetModel: widget.planetModel),
          ],
        ),
        Expanded(
          child: ListView(
            controller: _scrollController,
            children: [
              vGap(10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Watch this video",
                        style: AppTextStyles.font32RedW600,
                      ),
                    ),
                    vGap(5),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          _isVideoPlaying = !_isVideoPlaying;
                        });
                      },
                      child: _isVideoPlaying
                          ? YoutubePlayer(
                              controller: _controller,
                              showVideoProgressIndicator: true,
                            )
                          : Image.asset(
                              widget.planetModel.imageForYoutube,
                              width: double.infinity,
                              fit: BoxFit.fill,
                            ),
                    ),
                    vGap(16),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: widget.planetModel.exploreInfoList.length,
                      itemBuilder: (context, index) {
                        return ExploreItem(
                          widget.planetModel.exploreInfoList[index],
                        );
                      },
                    ),
                    vGap(48),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
