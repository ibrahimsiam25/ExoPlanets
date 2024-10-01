import 'package:exo_planets/core/model/explore_model.dart';

class PlanetModel {
  final String model3DPath; 
  final String title;        
  final String subtitle;
  final String imageView;
  final String imageForYoutube;
  final String imageForExplore;
  final List<ExploreInfoModel> exploreInfoList ;
  PlanetModel({required this.exploreInfoList, required this.imageForYoutube,required this.imageForExplore,required this.imageView, required this.model3DPath, required this.title, required this.subtitle});     // العنوان الفرعي
}