import 'package:cached_network_image/cached_network_image.dart';
import 'package:exo_planets/core/helpers/app_assets.dart';
import 'package:flutter/material.dart';

ImageProvider networkImageHelper(String? url) {
  if (url != null) {
    return CachedNetworkImageProvider(url);
  } else {
    return const AssetImage(AppAssets.avatarTest);
  }
}
