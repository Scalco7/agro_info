import 'package:flutter/material.dart';

enum WeatherConditionEnum {
  sunny(1000, "Ensolarado", Color.fromARGB(255, 255, 191, 79)),
  partlyCloudy(1003, "Parcialmente nublado", Colors.blueGrey),
  cloudy(1006, "Nublado", Colors.grey),
  overcast(1009, "Encoberto", Colors.blueGrey),
  mist(1030, "Névoa", Colors.cyan),
  patchyRain(1063, "Possibilidade de chuva isolada", Colors.lightBlue),
  patchySnow(1066, "Possibilidade de neve isolada", Colors.indigo),
  patchySleet(1069, "Possibilidade de granizo isolado", Colors.cyan),
  patchyFreezingDrizzle(1072, "Possibilidade de garoa congelante", Colors.blue),
  thunderyOutbreaks(1087, "Possibilidade de trovoadas", Colors.deepPurple),
  blowingSnow(1114, "Neve soprada", Colors.blue),
  blizzard(1117, "Vera de neve (Blizzard)", Colors.blueAccent),
  fog(1135, "Neblina", Colors.blueGrey),
  freezingFog(1147, "Neblina congelante", Colors.grey),
  patchyLightDrizzle(1150, "Garoa leve isolada", Colors.lightBlue),
  lightDrizzle(1153, "Garoa leve", Colors.lightBlue),
  freezingDrizzle(1168, "Garoa congelante", Colors.blue),
  heavyFreezingDrizzle(1171, "Garoa congelante forte", Colors.blueAccent),
  patchyLightRain(1180, "Chuva leve isolada", Colors.lightBlue),
  lightRain(1183, "Chuva leve", Colors.lightBlueAccent),
  moderateRainAtTimes(1186, "Chuva moderada ocasional", Colors.blue),
  moderateRain(1189, "Chuva moderada", Colors.blue),
  heavyRainAtTimes(1192, "Chuva forte ocasional", Colors.blueAccent),
  heavyRain(1195, "Chuva forte", Colors.blueAccent),
  lightFreezingRain(1198, "Chuva congelante leve", Colors.cyan),
  modOrHeavyFreezingRain(1201, "Chuva congelante moderada ou forte", Colors.cyanAccent),
  lightSleet(1204, "Granizo leve", Colors.cyan),
  modOrHeavySleet(1207, "Granizo moderado ou forte", Colors.cyanAccent),
  patchyLightSnow(1210, "Neve leve isolada", Colors.blue),
  lightSnow(1213, "Neve leve", Colors.blue),
  patchyModerateSnow(1216, "Neve moderada isolada", Colors.blueAccent),
  moderateSnow(1219, "Neve moderada", Colors.blueAccent),
  patchyHeavySnow(1222, "Neve forte isolada", Colors.indigo),
  heavySnow(1225, "Neve forte", Colors.indigo),
  icePellets(1237, "Pelotas de gelo", Colors.cyan),
  lightRainShower(1240, "Pancadas de chuva leve", Colors.lightBlue),
  modOrHeavyRainShower(1243, "Pancadas de chuva moderada ou forte", Colors.blue),
  torrentialRainShower(1246, "Chuva torrencial", Colors.indigo),
  lightSleetShowers(1249, "Pancadas de granizo leve", Colors.cyan),
  modOrHeavySleetShowers(1252, "Pancadas de granizo moderada ou forte", Colors.cyanAccent),
  lightSnowShowers(1255, "Pancadas de neve leve", Colors.blue),
  modOrHeavySnowShowers(1258, "Pancadas de neve moderada ou forte", Colors.blueAccent),
  lightIcePelletsShowers(1261, "Pancadas de pelotas de gelo leve", Colors.cyan),
  modOrHeavyIcePelletsShowers(1264, "Pancadas de pelotas de gelo forte", Colors.cyanAccent),
  patchyLightRainThunder(1273, "Chuva leve com trovoadas isoladas", Colors.deepPurpleAccent),
  modOrHeavyRainThunder(1276, "Chuva moderada ou forte com trovoadas", Colors.deepPurple),
  patchyLightSnowThunder(1279, "Neve leve com trovoadas isoladas", Colors.deepPurpleAccent),
  modOrHeavySnowThunder(1282, "Neve moderada ou forte com trovoadas", Colors.deepPurple);

  final int code;
  final String description;
  final Color color;

  const WeatherConditionEnum(this.code, this.description, this.color);

  static WeatherConditionEnum fromCode(int code) {
    return WeatherConditionEnum.values.firstWhere(
      (condition) => condition.code == code,
      orElse: () => WeatherConditionEnum.sunny,
    );
  }
}