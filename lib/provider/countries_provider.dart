import 'package:countriesapp/models/countries_model.dart';
import 'package:countriesapp/services/countries_api.dart';
import 'package:flutter/cupertino.dart';

import '../const/enum_const.dart';


class CountriesProvider with ChangeNotifier{

   CountryLanguages? _languages = CountryLanguages.behasa; 
    FilterContinent? _continent = FilterContinent.africa; 

    final List<bool> _checkContinent = [
      true,
      false,
      false,
      false,
      false,
    ];

     final List<String> _continentList = [
      "Africa",
      "Americas",
      "Asia",
      "Europe",
      "Oceania",
    ];

    String searchRegion = "";
    
   late List <CountriesModel>? _countryList = [];
   late List <CountriesModel>? _countryByNameList = [];
   late List <CountriesModel>? _countryByContinentList = [];

    late List <CountriesModel>? _searchResult = [];
    late List <CountriesModel>? _finalList = [];
  CountriesApiService countriesApiService = CountriesApiService();
  bool _isLoading = true;
    get countryData  => _countryByContinentList!.isEmpty ? (_searchResult!.isEmpty ? _countryList : _searchResult) : _countryByContinentList;
    get countryByNameList  => _countryByNameList;
    get isLoading => _isLoading;
    get countryByContinentList => _countryByContinentList;

    CountryLanguages? get  languages  => _languages;
    FilterContinent? get continent => _continent;

    get checkContinent => _checkContinent;
    //get checkContinent => _checkContinent;

clearAllCheckList(){
   for(int i = 0; i < _checkContinent.length; i++){
           _checkContinent[i] = false;
         }
         searchRegion = "";
         notifyListeners();
}

  getAllCountriesData() async {
      //_isLoading = true;
    //notifyListeners();
    _countryList = (await countriesApiService.getAllCountries());
    _countryList!.sort((a, b) => a.name.common.toLowerCase().compareTo(b.name.common.toLowerCase().toString()));
   _isLoading =  false;
    notifyListeners();
  }

  getAllCountryByName(String name) async {
     // isLoading = true;
   //notifyListeners();
    _countryByNameList = (await countriesApiService.getCountryBName(name));
    //isLoading =  false;
    notifyListeners();
  }

   getAllCountryByContinent() async {
     // isLoading = true;
   //notifyListeners();
    _countryByContinentList = (await countriesApiService.getCountryByContinent(searchRegion));
    //isLoading =  false;
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
  listTileControl(CountryLanguages? value){
       _languages = value;
       notifyListeners();
  }

 filterListTileControl(FilterContinent? value){
       _continent = value;
       if(_continent == FilterContinent.africa){
         _checkContinent[0] == true;
         searchRegion = _continentList[0];
         for(int i = 0; i < _checkContinent.length; ++i){
           if(i == 0) continue;
           _checkContinent[i] = false;
         }
       }
       else if(_continent == FilterContinent.americas){
         _checkContinent[1] = true;
          searchRegion = _continentList[1];
         for(int i = 0; i < _checkContinent.length; i++){
           if(i == 1) continue;
           _checkContinent[i] = false;
         }
       } 
       else if(_continent == FilterContinent.asia){
         _checkContinent[2] = true;
          searchRegion = _continentList[2];
         for(int i = 0; i < _checkContinent.length; i++){
           if(i == 2) continue;
           _checkContinent[i] = false;
         }
       }
       else if(_continent == FilterContinent.europe){
         _checkContinent[3] = true;
          searchRegion = _continentList[3];
         for(int i = 0; i < _checkContinent.length; i++){
           if(i == 3) continue;
           _checkContinent[i] = false;
         }
       }
       else if(_continent == FilterContinent.oceania){
         _checkContinent[4] = true;
          searchRegion = _continentList[4];
         for(int i = 0; i < _checkContinent.length; i++){
           if(i == 4) continue;
           _checkContinent[i] = false;
         }
       }
       else {
    //_countryByContinentList!.clear();
       }
       notifyListeners();
  }
}