import 'package:flutter/material.dart';
import 'package:exo_planets/core/helpers/spacing.dart';
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

  late final YoutubePlayerController _controller = YoutubePlayerController(
    initialVideoId: getVideoIdFromUrl(widget.planetModel.youtubeLink),
    flags: const YoutubePlayerFlags(
      autoPlay: true,
      mute: false,
    ),
  );
@override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                widget.planetModel.imageForExplore,
                width: double.infinity,
                fit: BoxFit.fill,
              ),
              vGap(10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text("Watch this video",
                          style: AppTextStyles.font32RedW600),
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
                    // Remove SizedBox and directly use ListView.builder
                    ListView.builder(
                      shrinkWrap: true, // Enable shrink wrapping
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: widget.planetModel.exploreInfoList.length,
                      itemBuilder: (context, index) {
                        return ExploreItem(
                            widget.planetModel.exploreInfoList[index]);
                      },
                    ),
                    vGap(48),
                  ],
                ),
              ),
            ],
          ),
          CustomExploreAppBar(planetModel: widget.planetModel),
        ],
      ),
    );
  }

  
}
