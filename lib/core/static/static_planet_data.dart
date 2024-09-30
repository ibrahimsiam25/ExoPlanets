import '../helpers/app_assets.dart';
import '../model/planet_moodel.dart';

List<PlanetModel> planetData = [
  PlanetModel(
      title: "Proxima b",
      subtitle: "Potentially habitable",
      model3DPath: AppAssets.planetProximab3DModel,
      image: AppAssets.planet1),
  PlanetModel(
      title: "Kepler-452b",
      subtitle: "Earth's cousin",
      model3DPath: AppAssets.planetKepler452b3DModel,
      image: AppAssets.planet2),
  PlanetModel(
      title: "Gliese 581g",
      subtitle: "Second earth",
      model3DPath: AppAssets.planetGliese5813DModel,
      image: AppAssets.planet3),
  PlanetModel(
      title: "Wasp-12b",
      subtitle: "Tidal distortion",
      model3DPath: AppAssets.planetWASP12bDModel,
      image: AppAssets.planet4),
  PlanetModel(
      title: "55 cancri e",
      subtitle: "Lava planet",
      model3DPath: AppAssets.planet55CancrieDModel,
      image: AppAssets.planet5),
  PlanetModel(
      title: "Kepler22b",
      subtitle: "Super-earth potential",
      model3DPath: AppAssets.planetKEPLER22BDModel,
      image: AppAssets.planet6),
  PlanetModel(
      title: "Eris",
      subtitle: "Distant dwarf",
      model3DPath: AppAssets.planetErisModel,
      image: AppAssets.planet7),
  PlanetModel(
      title: "Vesta",
      subtitle: "Super-earth potential",
      model3DPath: AppAssets.planetVestaModel,
      image: AppAssets.planet8),
];
