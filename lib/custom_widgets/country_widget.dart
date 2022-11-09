import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../const/app_color.dart';

class CountryWidget extends StatelessWidget {
  const CountryWidget({ Key? key, required this.countryName, required this.capital, required this.color_1, required this.color_2 }) : super(key: key);
  final String countryName;
  final String capital;
  final Color color_1;
  final Color color_2;
  @override
  Widget build(BuildContext context) {
    return Container(
       margin: EdgeInsets.only(bottom: 26.h),
      height: 41.h,
      width: 137.w,
      child: Row(
       ///mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
           
              height: 40.h,
             width: 40.h,
             color: Colors.red
          ),
            SizedBox(width: 16.w,),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
            children: [
             // const Text("A"),
             // SizedBox(height: 18.h,),
              Text(countryName, style: TextStyle(fontSize: 11.sp, fontWeight: FontWeight.w400, color: color_1),),
              Text(capital, style: TextStyle(fontSize: 11.sp, fontWeight: FontWeight.w400, color: color_2),),
            ]
          )
        ],
      )
    );
  }
}