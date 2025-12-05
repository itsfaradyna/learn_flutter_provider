// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'country_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CountryDto _$CountryDtoFromJson(Map<String, dynamic> json) => CountryDto(
  name: json['name'] as String,
  alpha2Code: json['alpha2Code'] as String,
  alpha3Code: json['alpha3Code'] as String,
  callingCodes: (json['callingCodes'] as List<dynamic>)
      .map((e) => e as String)
      .toList(),
  flag: json['flag'] as String,
);

Map<String, dynamic> _$CountryDtoToJson(CountryDto instance) =>
    <String, dynamic>{
      'name': instance.name,
      'alpha2Code': instance.alpha2Code,
      'alpha3Code': instance.alpha3Code,
      'callingCodes': instance.callingCodes,
      'flag': instance.flag,
    };
