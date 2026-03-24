enum CommoditiesEnum {
  naturalGas("Gás Natural", "NATURAL_GAS"),
  copper("Cobre", "COPPER"),
  aluminum("Aluminio", "ALUMINUM"),
  wheat("Trigo", "WHEAT"),
  corn("Milho", "CORN"),
  cotton("Algodão", "COTTON"),
  sugar("Açucar", "SUGAR"),
  coffee("Café", "COFFEE");

  final String portugueseName;
  final String code;

  const CommoditiesEnum(this.portugueseName, this.code);

  static CommoditiesEnum fromCode(String commodityCode) {
     CommoditiesEnum commodity = CommoditiesEnum.values.firstWhere(
      (element) => element.code == commodityCode.toUpperCase()
    );
    return commodity;
  }
}
