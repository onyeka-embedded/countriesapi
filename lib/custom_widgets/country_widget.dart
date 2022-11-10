import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../const/app_color.dart';

class CountryWidget extends StatelessWidget {
  const CountryWidget({ Key? key, required this.countryName, required this.capital, required this.color_1, required this.color_2, required this.image }) : super(key: key);
  final String countryName;
  final String capital;
  final Color color_1;
  final Color color_2;
  final String image;
  @override
  Widget build(BuildContext context) {
    return Container(
       margin: EdgeInsets.only(bottom: 20.h),
      height: 45.h,
      width: 200.w,
      child: Row(
       ///mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
              height: 40.h,
             width: 40.h,
             decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(5),
                      image: DecorationImage(
                        image: NetworkImage(image),
                        )
                    ),
                    //child: Image.network(image, fit: BoxFit.fill),
          ),
            SizedBox(width: 14.w,),
          Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
            children: [
             // const Text("A"),
             // SizedBox(height: 18.h,),
              Text(countryName, style: TextStyle(fontSize: 10.sp, fontWeight: FontWeight.w100, color: color_1, fontFamily: "Axiforma-Regular" ),),
              Text(capital, style: TextStyle(fontSize: 10.sp, fontWeight: FontWeight.w100, color: color_2, fontFamily: "Axiforma" ),),
            ]
          )
        ],
      )
    );
  }
}