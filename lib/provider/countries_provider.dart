import 'package:countriesapp/models/countries_model.dart';
import 'package:countriesapp/services/countries_api.dart';
import 'package:flutter/cupertino.dart';


class CountriesProvider with ChangeNotifier{
   late List <CountriesModel>? _countryList = [];
   late List <CountriesModel>? _countryByNameList = [];
  CountriesApiService countriesApiService = CountriesApiService();
  //bool isLoading = false;
    get countryData  => _countryList;
    get countryByNameList  => _countryByNameList;
   // get isLoading => _isLoading;
  getAllCountriesData() async {
      //isLoading = true;
   //notifyListeners();
    _countryList = (await countriesApiService.getAllCountries());
   // isLoading =  false;
    notifyListeners();
  }

  getAllCountryByName(String name) async {
      //isLoading = true;
   //notifyListeners();
    _countryByNameList = (await countriesApiService.getCountryBName(name));
   // isLoading =  false;
    notifyListeners();
  }
}