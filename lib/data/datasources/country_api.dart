import 'package:dio/dio.dart';
import 'package:learn_flutter_provider/data/models/dto/country_dto.dart';

class CountryApi {
  final Dio dio;

  CountryApi(this.dio);

  Future<List<CountryDto>> getCountries() async {
    final response = await dio.get('https://www.apicountries.com/countries');

    final data = response.data as List;

    return data.map((json) => CountryDto.fromJson(json)).toList();
  }
}