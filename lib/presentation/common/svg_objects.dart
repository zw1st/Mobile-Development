import 'package:flutter/cupertino.dart';
import 'package:mobile_dev/components/recources.g.dart';
import 'package:flutter_svg/flutter_svg.dart';

abstract class SvgObjects {
  static void init() {
    final pics = <String>[R.ASSETS_SVG_SATELLITE_SVG, R.ASSETS_SVG_SCIENCE_SVG];
    for (final String p in pics) {
      final loader = SvgAssetLoader(p);
      svg.cache.putIfAbsent(loader.cacheKey(null), () => loader.loadBytes(null));
    }
  }
}

class SvgSatellite extends StatelessWidget {
  const SvgSatellite({super.key});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(R.ASSETS_SVG_SATELLITE_SVG);
  }
}

class ScienceSvg extends StatelessWidget {
  const ScienceSvg({super.key});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(R.ASSETS_SVG_SCIENCE_SVG);
  }
}
