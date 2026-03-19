import 'package:agro_info/app/common/enums/plague_classification.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class PlagueIconWidget extends StatelessWidget {
  final String plagueCientificName;
  final PlagueClassification plagueClassification;
  final Color? color;
  final double iconSize;

  const PlagueIconWidget({
    super.key,
    required this.plagueCientificName,
    required this.plagueClassification,
    this.color,
    this.iconSize = 28.0,
  });

  @override
  Widget build(BuildContext context) {
    final cientificName = plagueCientificName.toLowerCase();

    IconData iconData;
    String svgPath = "";

    switch (plagueClassification) {
      case PlagueClassification.doenca:
        switch (cientificName) {
          case _ when cientificName.contains("acidovorax"):
            svgPath = "assets/images/plague_icons/bacterium.svg";
            break;
        }
        iconData = Icons.coronavirus_outlined;
      case PlagueClassification.insetos:
        switch (cientificName) {
          case _ when cientificName.contains("aegomorphus"):
            svgPath = "assets/images/plague_icons/beetle.svg";
            break;
          case _ when cientificName.contains("anticarsia"):
          case _ when cientificName.contains("agraulis"):
          case _ when cientificName.contains("agrotis"):
            svgPath = "assets/images/plague_icons/caterpillar.svg";
            break;
          case _ when cientificName.contains("acrogonia"):
          case _ when cientificName.contains("aeneolamia"):
          case _ when cientificName.contains("aethalion"):
          case _ when cientificName.contains("agallia"):
            svgPath = "assets/images/plague_icons/cicada.svg";
            break;
          case _ when cientificName.contains("anastrepha"):
          case _ when cientificName.contains("amauromyza"):
          case _ when cientificName.contains("aleurothrixus"):
          case _ when cientificName.contains("aleurodicus"):
          case _ when cientificName.contains("aleurocanthus"):
            svgPath = "assets/images/plague_icons/fly.svg";
            break;
          case _ when cientificName.contains("caelifera"):
            svgPath = "assets/images/plague_icons/locust.svg";
            break;
          case _ when cientificName.contains("anagasta"):
          case _ when cientificName.contains("anacampsis"):
            svgPath = "assets/images/plague_icons/moth.svg";
            break;
          case _ when cientificName.contains("acromyrmex "):
            svgPath = "assets/images/plague_icons/ant.svg";
            break;
        }
    }

    if (svgPath.isNotEmpty) {
      return SvgPicture.asset(
        svgPath,
        width: iconSize,
        height: iconSize,
        colorFilter: color == null
            ? null
            : ColorFilter.mode(color!, BlendMode.srcIn),
        placeholderBuilder: (BuildContext context) =>
            Icon(Icons.pest_control_outlined, size: iconSize, color: color),
      );
    }

    switch (plagueClassification) {
      case PlagueClassification.doenca:
        iconData = Icons.coronavirus_outlined;
      case PlagueClassification.insetos:
        switch (cientificName) {
          case _ when cientificName.contains("abelha"):
            iconData = Icons.emoji_nature_outlined;
          default:
            iconData = Icons.pest_control_outlined;
        }
    }
    return Icon(iconData, size: 28, color: color);
  }
}
