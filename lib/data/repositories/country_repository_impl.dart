import 'package:learn_flutter_provider/domain/entities/country.dart';
import 'package:learn_flutter_provider/domain/repositories/country_repository.dart';

import '../datasources/country_api.dart';

class CountryRepositoryImpl implements CountryRepository {
  final CountryApi api;

  CountryRepositoryImpl(this.api);

  @override
  Future<List<Country>> getCountries() async {
    final dtos = await api.getCountries();

    return dtos
        .map(
          (dto) => Country(
            name: dto.name,
            alpha2Code: dto.alpha2Code,
            alpha3Code: dto.alpha3Code,
            callingCodes: dto.callingCodes,
            flag: dto.flag,
          ),
        )
        .toList();
  }
}