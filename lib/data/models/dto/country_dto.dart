import 'package:json_annotation/json_annotation.dart';

part 'country_dto.g.dart';

@JsonSerializable()
class CountryDto {
  final String name;

  @JsonKey(name: 'alpha2Code')
  final String alpha2Code;

  @JsonKey(name: 'alpha3Code')
  final String alpha3Code;

  @JsonKey(name: 'callingCodes')
  final List<String> callingCodes;

  @JsonKey(name: 'flag')
  final String flag;

  CountryDto({
    required this.name,
    required this.alpha2Code,
    required this.alpha3Code,
    required this.callingCodes,
    required this.flag,
  });

  factory CountryDto.fromJson(Map<String, dynamic> json) =>
      _$CountryDtoFromJson(json);

  Map<String, dynamic> toJson() => _$CountryDtoToJson(this);
}