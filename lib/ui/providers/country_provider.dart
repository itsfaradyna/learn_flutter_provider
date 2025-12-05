import 'package:flutter/foundation.dart';
import '../../domain/entities/country.dart';
import '../../domain/repositories/country_repository.dart';

class CountryProvider extends ChangeNotifier {
  final CountryRepository repository;

  CountryProvider(this.repository);

  List<Country> _countries = [];
  List<Country> get countries => _countries;

  bool _loading = false;
  bool get loading => _loading;

  Future<void> fetchCountries() async {
    _loading = true;
    notifyListeners();

    try {
      _countries = await repository.getCountries();
    } catch (e) {
      print('Error fetching countries: $e');
    } finally {
      _loading = false;
      notifyListeners();
    }
  }
}