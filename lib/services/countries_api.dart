import 'dart:convert';
import 'dart:developer';

import 'package:countriesapp/models/countries_model.dart';

import '../const/api_const.dart';
import 'package:http/http.dart' as http;

class CountriesApiService{

   Future<List<CountriesModel>?> getAllCountries() async {
        List <CountriesModel> result  = [];
       try {
     
      final response = await http.get(
        Uri.parse(BASEURL),
       // headers: {"X-Api-key": API_KEY},
      );
//print('Response status: ${response.statusCode}');
      // log('Response body: ${response.body}');
     
      if (response.statusCode == 200) {
       final jsonList = jsonDecode(response.body);
       // List <CountriesModel> result =  CountriesModel.countriesFromSnapshot(response.body);
        for (var element in jsonList){
         result.add(CountriesModel.fromJson(element));
       // print(element);
        }

          return result;
      }

      //return null;
     // return result;

    } catch (error) {
      print("errorrrr: $error");
      throw error.toString();
    }
    return null;
  }

  
   Future<List<CountriesModel>?> getCountryBName(String countryName) async {
        List <CountriesModel> result1  = [];
       try {
     
      final response = await http.get(
        Uri.parse("https://restcountries.com/v3.1/name/${countryName.toLowerCase()}"),
       // headers: {"X-Api-key": API_KEY},
      );
//print('Response status: ${response.statusCode}');
      // log('Response body: ${response.body}');
     
      if (response.statusCode == 200) {
       final jsonList = jsonDecode(response.body);
        for (var element in jsonList){
         result1.add(CountriesModel.fromJson(element));
        //print(element);
        }

          return result1;
      }

    } catch (error) {
      print("errorrrr: $error");
      throw error.toString();
    }
    return null;
  }

  Future<List<CountriesModel>?> getCountryByContinent(String continentName) async {
        List <CountriesModel> result1  = [];
       try {
     
      final response = await http.get(
        Uri.parse("https://restcountries.com/v3.1/region/${continentName.toLowerCase()}"),
       // headers: {"X-Api-key": API_KEY},
      );
//print('Response status: ${response.statusCode}');
      // log('Response body: ${response.body}');
     
      if (response.statusCode == 200) {
       final jsonList = jsonDecode(response.body);
        for (var element in jsonList){
         result1.add(CountriesModel.fromJson(element));
        //print(element);
        }

          return result1;
      }

    } catch (error) {
      print("errorrrr: $error");
      throw error.toString();
    }
    return null;
  }
}