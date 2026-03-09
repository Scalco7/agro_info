enum PlagueClassification {
  insetos("insetos"),
  doenca("doença");

  final String apiName;
  const PlagueClassification(this.apiName);

  static PlagueClassification fromString(String name) {
    PlagueClassification classification = PlagueClassification.values.firstWhere(
      (element) => element.apiName == name.toLowerCase()
    );
    return classification;
  }
}
