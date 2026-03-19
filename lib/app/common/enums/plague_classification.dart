enum PlagueClassification {
  insetos("insetos", "Insetos"),
  doenca("doença", "Doenças");

  final String apiName;
  final String filterName;
  const PlagueClassification(this.apiName, this.filterName);

  static PlagueClassification fromString(String name) {
    PlagueClassification classification = PlagueClassification.values.firstWhere(
      (element) => element.apiName == name.toLowerCase()
    );
    return classification;
  }
}
