class Country {
  final String name;
  final String alpha2Code;
  final String alpha3Code;
  final List<String> callingCodes;
  final String flag;

  Country({
    required this.name,
    required this.alpha2Code,
    required this.alpha3Code,
    required this.callingCodes,
    required this.flag,
  });
}