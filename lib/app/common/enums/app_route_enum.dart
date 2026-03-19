enum AppRouteEnum {
  plague(0, "plague"),
  zarcCalc(1, "zarc-calc"),
  plagueDetails(2, "plague-details"),
  splash(3, "splash");

  final String name;
  final int routeIndex;

  const AppRouteEnum(this.routeIndex, this.name);

  static AppRouteEnum fromIndex(int index) {
    if (index < plague.routeIndex) {
      throw Exception("Index não corresponde a nenhuma página.");
    }
    if (index > splash.routeIndex) {
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
