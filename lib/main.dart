import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:learn_flutter_provider/data/datasources/country_api.dart';
import 'package:learn_flutter_provider/data/models/cart_model.dart';
import 'package:learn_flutter_provider/data/models/counter_item_model.dart';
import 'package:learn_flutter_provider/data/models/user_model.dart';
import 'package:learn_flutter_provider/data/repositories/country_repository_impl.dart';
import 'package:learn_flutter_provider/ui/screens/home_screen.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final dio = Dio();
  final api = CountryApi(dio);
  final repo = CountryRepositoryImpl(api);

  final countries = await repo.getCountries();

  for (var country in countries) {
    print('${country.name} - ${country.alpha2Code} - ${country.flag}');
  }

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CounterItemModel()),
        ChangeNotifierProvider(create: (_) => UserModel()),
        ChangeNotifierProvider(create: (_) => CartModel()),
      ],
      child: MyApp(),
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: TextTheme(
          headlineLarge: TextStyle(fontSize: 34, fontWeight: FontWeight.bold),
          // You can add other text styles here
        ),
      ),
      home: HomeScreen(),
    );
  }
}