import 'package:countriesapp/models/countries_model.dart';
import 'package:countriesapp/services/countries_api.dart';
import 'package:flutter/cupertino.dart';


class CountriesProvider with ChangeNotifier{
   late List <CountriesModel>? _countryList = [];
   late List <CountriesModel>? _countryByNameList = [];
    late List <CountriesModel>? _searchResult = [];
    late List <CountriesModel>? _finalList = [];
  CountriesApiService countriesApiService = CountriesApiService();
  //bool isLoading = false;
    get countryData  =>  _searchResult!.isEmpty ? _countryList : _searchResult;
    get countryByNameList  => _countryByNameList;
   // get isLoading => _isLoading;


  getAllCountriesData() async {
      //isLoading = true;
   //notifyListeners();
    _countryList = (await countriesApiService.getAllCountries());
    _countryList!.sort((a, b) => a.name.common.toLowerCase().compareTo(b.name.common.toLowerCase().toString()));
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

  searchResult(String text){
    _searchResult!.clear();
    for (var value in _countryList!) {
    if (value.name.common.toLowerCase().contains(text.toLowerCase())) {
                  _searchResult!.add(value);        
              }
          }
         notifyListeners();
     }  
}