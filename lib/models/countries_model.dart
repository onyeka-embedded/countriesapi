
import 'dart:convert';

class CountriesModel{

  Name name;
  String capital;
  String flag;
  Flags flags;
  //int popolation;
  //String region;
  //Languages languages;
  //bool independent;
  //int area;
 // currencies currencies;


    CountriesModel({
      required this.name,
      required this.capital,
      required this.flag,
      required this.flags
      //required this.popolation,
      //required this.region,
      //required this.independent,
      //required this.area
        });

      factory CountriesModel.fromJson(Map<String, dynamic> json){

        return CountriesModel(
          name:  Name.fromJson(json["name"]),
          capital: json["capital"].toString(),
          flag:  json["flag"] ??  "",
          flags: Flags.fromJson(json["flags"]),
         // popolation: json["population"] ??  0,
         // region:  json["region"] ??  "",
         // independent:  json["independent"],
         // area:  json["area"] ??  0,
          
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
