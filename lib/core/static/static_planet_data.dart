import '../helpers/app_assets.dart';
import '../model/planet_model.dart';
import '../model/explore_model.dart';

List<PlanetModel> planetData = [
  PlanetModel(
      title: "Proxima b",
      subtitle: "Potentially habitable",
      model3DPath: AppAssets.planetProximab3DModel,
      imageView: AppAssets.planet1,
      imageForYoutube: AppAssets.youtube1,
      imageForExplore: AppAssets.exoPlanet1,
      youtubeLink:"https://www.youtube.com/watch?v=ZDVuNu7zaBc" ,
      exploreInfoList: [
        ExploreInfoModel(
          title: "Introduction",
          description:
              "Proxima b is an Earth-sized exoplanet located about 4 light-years away, orbiting Proxima Centauri.",
        ),
        ExploreInfoModel(
          title: "Orbit and Mass",
          description:
              "It completes an orbit in 11 days and has a mass 1.3 times that of Earth.",
        ),
        ExploreInfoModel(
          title: "Habitable Zone",
          description:
              "It is in the habitable zone where liquid water could potentially exist.",
        ),
        ExploreInfoModel(
          title: "Challenges",
          description:
              "Its proximity to its star may cause atmospheric loss due to intense radiation.",
        ),
      ]),
  PlanetModel(
      title: "Kepler-452b",
      subtitle: "Earth's cousin",
      model3DPath: AppAssets.planetKepler452b3DModel,
      imageView: AppAssets.planet2,
      imageForYoutube: AppAssets.youtube2,
      imageForExplore: AppAssets.exoPlanet2,
      youtubeLink:"https://www.youtube.com/watch?v=3WXvlZS6Dx4&pp=ygUaRXhwbGFpbiBHbGllc2UtNTgxZyBwbGFuZXQ%3D" ,
      exploreInfoList:  [
    ExploreInfoModel(
      title: "Nickname",
      description: "Kepler-452b is often referred to as Earth's older cousin due to its similarities to Earth and its older star.",
    ),
    ExploreInfoModel(
      title: "Distance from Earth",
      description: "Kepler-452b is located about 1,400 light-years away from Earth.",
    ),
    ExploreInfoModel(
      title: "Star Type",
      description: "Kepler-452b orbits a yellow G-type star, similar to our Sun."
    ),
    ExploreInfoModel(
      title: "Orbital Period",
      description: "A year on Kepler-452b lasts 385 Earth days, slightly longer than a year on Earth."
    ),
        ExploreInfoModel(
      title: "Habitability",
      description: "Kepler-452b is in its star's habitable zone, where liquid water could potentially exist."
    ),
        ExploreInfoModel(
      title: "Size Comparison",
      description: "Kepler-452b is about 60% larger than Earth, making it a super-Earth."
    ),
        ExploreInfoModel(
      title: "Star Age",
      description: "The star Kepler-452 is approximately 6 billion years old, older than our Sun."
    ),
        ExploreInfoModel(
      title: "Challenges to Habitability",
      description: "Kepler-452b may have experienced a runaway greenhouse effect, making its surface too hot to support life."
    ),
  ]),
  PlanetModel(
      title: "Gliese 581g",
      subtitle: "Second earth",
      model3DPath: AppAssets.planetGliese5813DModel,
      imageView: AppAssets.planet3,
      imageForYoutube: AppAssets.youtube3,
      imageForExplore: AppAssets.exoPlanet3,
      youtubeLink:"https://www.youtube.com/watch?v=ViL4Wepe5xY&t=33s&pp=ygUbRXhwbGFpbiBLZXBsZS00NTJiIGYgcGxhbmV0" ,
      exploreInfoList:  [
  ExploreInfoModel(
    title: 'Location',
    description: 'Gliese 581g is located in the Gliese 581 star system, which is around 20 light-years away from Earth.',
  ),
  ExploreInfoModel(
    title: 'Type of Planet',
    description: 'It is believed to be a rocky, Earth-like planet, making it a candidate for supporting life.',
  ),
  ExploreInfoModel(
    title: 'Star Type',
    description: 'Gliese 581g orbits a red dwarf star, which is cooler and smaller than the Sun.',
  ),
  ExploreInfoModel(
    title: 'Habitability',
    description: 'Gliese 581g orbits within the habitable zone of its star, where temperatures could allow liquid water to exist.',
  ),
  ExploreInfoModel(
    title: 'Orbital Period',
    description: 'It takes 13 Earth days to complete one orbit around its star.',
  ),
  ExploreInfoModel(
    title: 'Climate',
    description: 'Gliese 581g is likely tidally locked, meaning one side of the planet always faces its star, creating extreme differences between its day and night sides.',
  ),
  ExploreInfoModel(
    title: 'Controversy',
    description: 'The existence of Gliese 581g is controversial as some astronomers have debated whether it actually exists based on conflicting data from observations.',
  ),
]),
  PlanetModel(
      title: "Wasp-12b",
      subtitle: "Tidal distortion",
      model3DPath: AppAssets.planetWASP12bDModel,
      imageView: AppAssets.planet4,
      imageForYoutube: AppAssets.youtube4,
      imageForExplore: AppAssets.exoPlanet4,
      youtubeLink:"https://www.youtube.com/watch?v=3Frf-uHYNVg" ,
      exploreInfoList: [
        ExploreInfoModel(
          title: "Type",
          description:
              "A gas giant Hot Jupiter with an extremely close orbit (1.1 days).",
        ),
        ExploreInfoModel(
            title: "Shape",
            description:
                "It is stretched into an egg-like shape due to tidal forces."),
        ExploreInfoModel(
            title: "Fate",
            description:
                "It will be consumed by its star in about 10 million years."),
      ]),
  PlanetModel(
      title: "55 cancri e",
      subtitle: "Lava planet",
      model3DPath: AppAssets.planet55CancrieDModel,
      imageView: AppAssets.planet5,
      imageForYoutube: AppAssets.youtube5,
      imageForExplore: AppAssets.exoPlanet5,
      youtubeLink:"https://www.youtube.com/watch?v=fbqCaiakhOI&pp=ygUbNTUgQ2FuY3JpIGVcIHBsYW5ldCBleHBsYWlu" ,
      exploreInfoList: [
        ExploreInfoModel(
          title: "Type",
          description:
              "A super-Earth exoplanet much larger than Earth but smaller than gas giants.",
        ),
        ExploreInfoModel(
            title: "Surface",
            description:
                "Its surface is a molten ocean of lava due to its proximity to its star."),
        ExploreInfoModel(
            title: "Night Sky",
            description:
                "Sparkling clouds may form in its cooler nightside, creating a stunning view."),
      ]),
  PlanetModel(
      title: "Kepler22b",
      subtitle: "Super-earth potential",
      model3DPath: AppAssets.planetKEPLER22BDModel,
      imageView: AppAssets.planet6,
      imageForYoutube: AppAssets.youtube6,
      imageForExplore: AppAssets.exoPlanet6,
      youtubeLink:"https://www.youtube.com/watch?v=x8qK-K3XuIM&pp=ygUZS0VQTEVSLTIyQiBwbGFuZXQgZXhwbGFpbg%3D%3D" ,
      exploreInfoList: [
        ExploreInfoModel(
            title: "Location",
            description:
                "Kepler-22b orbits in the habitable zone of a Sun-like star."),
        ExploreInfoModel(
            title: "Size ",
            description:
                "It is 2.4 times the size of Earth, but its exact composition is unknown."),
        ExploreInfoModel(
            title: "Potential for Life",
            description:
                "Its location in the habitable zone makes it a candidate for further study."),
      ]),
  PlanetModel(
      title: "Eris",
      subtitle: "Distant dwarf",
      model3DPath: AppAssets.planetErisModel,
      imageView: AppAssets.planet7,
      imageForYoutube: AppAssets.youtube7,
      imageForExplore: AppAssets.exoPlanet7,
      youtubeLink:"https://www.youtube.com/watch?v=c2WOf4Ws4AA&pp=ygUTRXJpcyBwbGFuZXQgZXhwbGFpbg%3D%3D" ,
      exploreInfoList: [
        ExploreInfoModel(
            title: "Discovery",
            description:
                "Eris, one of the largest dwarf planets, was discovered in 2005."),
        ExploreInfoModel(
            title: "Key Facts",
            description:
                "A day on Eris lasts 25.9 hours, and it takes 557 Earth years to complete an orbit around the Sun."),
        ExploreInfoModel(
            title: "Importance",
            description:
                "Eris played a key role in the reclassification of Pluto as a dwarf planet."),
      ]),
  PlanetModel(
      title: "Vesta",
      subtitle: "Super-earth potential",
      model3DPath: AppAssets.planetVestaModel,
      imageView: AppAssets.planet8,
      imageForYoutube: AppAssets.youtube8,
      imageForExplore: AppAssets.exoPlanet8,
      youtubeLink: "https://www.youtube.com/watch?v=24RfWMymkJo&pp=ygUUVmVzdGEgcGxhbmV0IGV4cGxhaW4%3D",
      exploreInfoList: [
        ExploreInfoModel(title: "Surface", description: "Vesta's surface has large craters and unique geological features."),
        ExploreInfoModel(title: "Structure", description: "Unlike most asteroids, Vesta has a core, mantle, and crust like Earth."),
        ExploreInfoModel(title: "Dawn Mission", description: "NASA's Dawn spacecraft revealed that Vesta's structure and water-related features provide insights into planetary formation."),
      ]),
];
