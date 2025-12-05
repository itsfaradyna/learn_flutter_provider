import 'package:learn_flutter_provider/domain/entities/country.dart';

abstract class CountryRepository {

  Future<List<Country>> getCountries();

}