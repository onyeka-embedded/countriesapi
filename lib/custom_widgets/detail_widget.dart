import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DetailWidget extends StatelessWidget {
  const DetailWidget(
    { Key? key, 
    required this.population, 
    required this.region, 
    required this.capital, 
    required this.motto, 
    required this.officialLang, 
    required this.ethnicGroup, 
    required this.religion, 
    required this.govt, 
    required this.independence,
    required this.area, 
    required this.currency,
     required this.gdp, 
     required this.timeZone,
      required this.dateFormat,
      required this.dailingCode,
       required this.drivingSide, }) 
    : super(key: key);
    
  final String population;
  final String region;
  final String capital;
  final String motto;

  final String officialLang;
  final String ethnicGroup;
  final String religion;
  final String govt;

  final String independence;
  final String area;
  final String currency;
  final String gdp;

  final String timeZone;
  final String dateFormat;
  final String dailingCode;
  final String drivingSide;
  // Color color_1;
  // Color color_2;
  
  @override
  Widget build(BuildContext context) {
    return SizedBox(
       child: Column(
             children: [
             Row(
               children: [
               Text("Population:  ", style: _headingStyle(),),
              Text(population, style: _valueStyle(),),
               ],
             ),
                Row(
               children: [
               Text("Region:  ", style: _headingStyle(),),
              Text(region, style: _valueStyle(),),
               ],
             ),
                Row(
               children: [
               Text("Capital:  ", style: _headingStyle(),),
              Text(capital, style: _valueStyle(),),
               ],
             ),
                Row(
               children: [
               Text("Motto:  ", style: _headingStyle(),),
              Text(motto, style: _valueStyle(),),
               ],
             ),
              SizedBox(height: 24.h,),
                Row(
               children: [
               Text("Official language:  ", style: _headingStyle(),),
              Text(officialLang, style: _valueStyle(),),
               ],
             ),
                Row(
               children: [
               Text("Ethnic Group:  ", style: _headingStyle(),),
              Text(ethnicGroup, style: _valueStyle(),),
               ],
             ),
                Row(
               children: [
               Text("Religion:  ", style: _headingStyle(),),
              Text(religion, style: _valueStyle(),),
               ],
             ),
                Row(
               children: [
               Text("Government:  ", style: _headingStyle(),),
              Text(govt, style: _valueStyle(),),
               ],
             ),
              SizedBox(height: 24.h,),
                Row(
               children: [
               Text("Independence:  ", style: _headingStyle(),),
              Text(independence, style: _valueStyle(),),
               ],
             ),
                Row(
               children: [
               Text("Area:  ", style: _headingStyle(),),
              Text(area, style: _valueStyle(),),
               ],
             ),
                Row(
               children: [
               Text("Currency:  ", style: _headingStyle(),),
              Text(currency, style: _valueStyle(),),
               ],
             ),
                Row(
               children: [
               Text("GDP:  ", style: _headingStyle(),),
              Text(gdp, style: _valueStyle(),),
               ],
             ),
              SizedBox(height: 24.h,),
                Row(
               children: [
               Text("Time zone:  ", style: _headingStyle(),),
              Text(timeZone, style: _valueStyle(),),
               ],
             ),
                Row(
               children: [
               Text("Date format:  ", style: _headingStyle(),),
              Text(dateFormat, style: _valueStyle(),),
               ],
             ),
               Row(
               children: [
               Text("Dailing code:  ", style: _headingStyle(),),
              Text(dailingCode, style: _valueStyle(),),
               ],
             ),
               Row(
               children: [
               Text("Driving side:  ", style: _headingStyle(),),
              Text(drivingSide, style: _valueStyle(),),
               ],
             ),
             // SizedBox(height: 24.h,)
                  ],
          )
    );
  }

  TextStyle _valueStyle() => TextStyle(fontSize: 10.sp, fontWeight: FontWeight.normal,fontFamily: "Axiforma" );

  TextStyle _headingStyle() => TextStyle(fontSize: 10.sp, fontWeight: FontWeight.normal, fontFamily: "Axiforma" );
}