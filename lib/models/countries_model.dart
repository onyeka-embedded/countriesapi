
import 'dart:convert';

class CountriesModel{

  Name name;
  String capital;
  String flag;
  Flags flags;
  int population;
  String region;
  Map <String, dynamic>? languages;
  Map <String, dynamic>? idd;
  Map <String, dynamic> car;
  Map <String, dynamic>? currencies;
  bool? independent;
  double area;
 // currencies currencies;
  List <dynamic> timezones;


    CountriesModel({
      required this.name,
      required this.capital,
      required this.flag,
      required this.flags,
      required this.population,
      required this.region,
      required this.independent,
      required this.area,
      required this.car,
      required this.timezones,
      required this.languages,
      required this.idd,
      required this.currencies
        });

      factory CountriesModel.fromJson(Map<String, dynamic> json){

        return CountriesModel(
          name:  Name.fromJson(json["name"]),
          capital: json["capital"].toString(),
          flag:  json["flag"] ??  "",
          flags: Flags.fromJson(json["flags"]),
          population: json["population"] ??  0,
           region:  json["region"] ??  "",
          independent:  json["independent"],
          area:  json["area"] ??  0,
          car: json["car"],
          languages: json["languages"],
          timezones: json["timezones"],
          idd: json["idd"],
          currencies: json["currencies"],
        );
      }

     static List<CountriesModel> countriesFromSnapshots(List newSnapshot) {
          return newSnapshot.map((json) {
             return CountriesModel.fromJson(json);
                }).toList(); 
  } 

   static List<CountriesModel> countriesFromSnapshot(String str) =>
          List<CountriesModel>.from(json.decode(str).map((x) => CountriesModel.fromJson(x)));

}         

class Name {
  String common;
  String official;

  Name({
    required this.common,
    required this.official
  });

   factory Name.fromJson(Map<String, dynamic> json){
    return Name(
       common: json['common'] ?? "",
      official: json['official'] ?? "",
    );
  }
}

class Flags {
  Flags({
    required this.png,
    required this.svg,
  });

  String png;
  String svg;

  factory Flags.fromJson(Map<String, dynamic> json) => Flags(
        png: json["png"],
        svg: json["svg"],
      );
  }

  class Languages {
  Languages({
    required this.eng,
    //required this.hin,
    //required this.tam,
  });

  String eng;
  //String hin;
  //String tam;

  factory Languages.fromJson(Map<String, dynamic> json) => Languages(
        eng: json["eng"],
      //  hin: json["hin"],
        //tam: json["tam"],

      );
  }

