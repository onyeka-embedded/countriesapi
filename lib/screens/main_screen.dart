import 'package:countriesapp/screens/detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../const/app_color.dart';
import '../custom_widgets/country_widget.dart';
import '../provider/theme_provider.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
     final _provider = Provider.of<DarkThemeProvider>(context, listen: false);
    return Scaffold(
          body: Container(
            margin: EdgeInsets.only(left: 24.w, right: 24.w, top: 24.h),
            child: Consumer<DarkThemeProvider>(
                    builder: (BuildContext context, data, child) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:[
                    SizedBox(height: 24.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context) => const DetailScreen()));
                          },
                          child: SizedBox(
                            height: 23.h,
                            width: 90.w,
                            child:Image.asset("assets/images/ex_logo.png",
                          fit: BoxFit.cover),
                          ),
                        ),
                        GestureDetector(
                      onTap: () {
                        _provider.setDarkTheme = !_provider.isDark;
                         },
                          child: Icon(data.isDark ? Icons.dark_mode : Icons.sunny)),
                      ]
                    ),
                    SizedBox(height: 24.h),
                    
                    SizedBox(
                      height: 48.h,
                      width: 380.w,
                      child: TextField(
                            decoration: InputDecoration(
                              fillColor: data.isDark ? const Color.fromRGBO(152, 162, 179, 0.2) : const Color(0xFFF2F4F7),
                              filled: true,
                              border: const OutlineInputBorder(
                                borderSide: BorderSide.none,
                              ),
                              hintText: "Search Country",
                              hintStyle: TextStyle(
                                color: data.isDark ? const Color(0xFFEAECF0) : const Color(0xFFEAECF0) 
                              ),

                              prefixIcon: SizedBox(child: Icon(Icons.search)),
                            ),
                            
                      )
                    ),
                    SizedBox(height: 16.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: 40.h,
                          width: 73.w,
                          decoration: BoxDecoration(
                            color: data.isDark ? const Color(0xFF000F24): const Color(0xFFFCFCFD),
                            borderRadius: BorderRadius.circular(4.r),
                            border: Border.all(
                              color: data.isDark ? const Color(0xFFA9B8D5) : const Color(0xFFA9B8D5),
                              width: 0.2,
                            )
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10.w,),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Icon(Icons.circle_notifications),
                                Text("EN", )
                              ],
                            ),
                          ),
                        ),

                              Container(
                          height: 40.h,
                          width: 86.w,
                          decoration: BoxDecoration(
                            color: data.isDark ? const Color(0xFF000F24): const Color(0xFFFCFCFD),
                            borderRadius: BorderRadius.circular(4.r),
                            border: Border.all(
                              color: const Color(0xFFA9B8D5),
                              width: 0.2,
                            )
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10.w),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Icon(Icons.filter_1_outlined),
                                Text("Filter")
                              ],
                            ),
                          ),
                        ),
                           // CountryWidget(),
                      ],
                    ),
                      SizedBox(height: 16.h),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text("A"),
                      SizedBox(height: 18.h,),
                          Container(
                            height: 639.h,
                            width: double.maxFinite,
                           child: ListView.builder(
                             itemCount: 20,
                              itemBuilder: (BuildContext context, index) {
                                return  CountryWidget(
                                  countryName: "Nigeria",
                                  color_1: data.isDark ? AppColor.countryNameColorDark : AppColor.countryNameColorLight,
                                  capital: "Abuja",
                                  color_2: data.isDark ? AppColor.countryCapitalColorDark : AppColor.countryCapitalColorLightDark,);
                              })
                          ),
                        ],
                      )
                  ]
                );
              }
            ),
          )
      );
  }
}