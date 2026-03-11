enum StateEnum {
  ac("Acre", "AC"),
  al("Alagoas", "AL"),
  ap("Amapá", "AP"),
  am("Amazonas", "AM"),
  ba("Bahia", "BA"),
  ce("Ceará", "CE"),
  df("Distrito Federal", "DF"),
  es("Espírito Santo", "ES"),
  go("Goiás", "GO"),
  ma("Maranhão", "MA"),
  mt("Mato Grosso", "MT"),
  ms("Mato Grosso do Sul", "MS"),
  mg("Minas Gerais", "MG"),
  pa("Pará", "PA"),
  pb("Paraíba", "PB"),
  pr("Paraná", "PR"),
  pe("Pernambuco", "PE"),
  pi("Piauí", "PI"),
  rj("Rio de Janeiro", "RJ"),
  rn("Rio Grande do Norte", "RN"),
  rs("Rio Grande do Sul", "RS"),
  ro("Rondônia", "RO"),
  rr("Roraima", "RR"),
  sc("Santa Catarina", "SC"),
  sp("São Paulo", "SP"),
  se("Sergipe", "SE"),
  to("Tocantins", "TO");

  final String name;
  final String acronym;
  const StateEnum(this.name, this.acronym);
}
