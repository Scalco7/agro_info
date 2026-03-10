enum AppRouteEnum {
  splash(0, "splash"),
  plague(1, "plague"),
  zarcCalc(2, "zarc-calc");

  final String name;
  final int routeIndex;

  const AppRouteEnum(this.routeIndex, this.name);

  static AppRouteEnum fromIndex(int index) {
    if (index < splash.routeIndex) {
      throw Exception("Index não corresponde a nenhuma página.");
    }
    if (index > zarcCalc.routeIndex) {
      throw Exception("Index não corresponde a nenhuma página.");
    }

    AppRouteEnum classification = AppRouteEnum.values.firstWhere(
      (page) => page.routeIndex == index,
    );
    return classification;
  }

  static AppRouteEnum fromName(String name) {
    AppRouteEnum classification = AppRouteEnum.values.firstWhere(
      (page) => page.name == name,
    );
    return classification;
  }
}
