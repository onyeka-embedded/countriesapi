import 'package:countriesapp/provider/countries_provider.dart';
import 'package:countriesapp/screens/detail_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../const/app_color.dart';
import '../custom_widgets/country_widget.dart';
import '../models/countries_model.dart';
import '../provider/theme_provider.dart';
import '../services/countries_api.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({ Key? key }) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late List <CountriesModel>? datar = [];
  CountriesApiService countriesApiService = CountriesApiService();

  @override
   initState()  {
    // TODO: implement initState
    final _Countiesrovider = Provider.of<CountriesProvider>(context, listen: false);
     _Countiesrovider.getAllCountriesData();
   // print(_Countiesrovider.countryData[0].name.common.toString());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
     final _provider = Provider.of<DarkThemeProvider>(context, listen: false);
     final _Countriesrovider = Provider.of<CountriesProvider>(context, listen: false);
     datar!.sort((a, b) => a.name.common.compareTo(b.name.common.toString()));
  
    return Scaffold(
          body: Container(
            margin: EdgeInsets.only(left: 24.w, right: 24.w, top: 24.h),
            child: Consumer<DarkThemeProvider>(
                    builder: (BuildContext context, data, child) {
                return SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:[
                      SizedBox(height: 24.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: (){
                             // Navigator.push(context, MaterialPageRoute(builder: (context) => const DetailScreen()));
                            },
                            child: SizedBox(
                              height: 25.h,
                              width: 95.w,
                              child:data.isDark ? Image.asset("assets/images/logo.png",
                            fit: BoxFit.cover) : Image.asset("assets/images/ex_logo.png",
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
                      SizedBox(height: 20.h),
                      
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
                                  //alignLabelWithHint: true,
                                contentPadding: EdgeInsets.zero,
                                hintStyle: TextStyle(
                                  fontSize: 12,
                                  color: data.isDark ? const Color(0xFFEAECF0) : const Color(0xFF000000),
                                  fontFamily: "Axiforma" 
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
                                  Icon(CupertinoIcons.globe, size: 25.h,),
                                  Text("EN", style: TextStyle(fontSize: 14.sp), )
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
                                  Icon(CupertinoIcons.sort_down, size: 25.h,),
                                  Text("Filter",  style: TextStyle(fontSize: 14.sp))
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
                             child:Consumer<CountriesProvider>(
                                               builder: (BuildContext context, countriesData, child) {
                                 return ListView.builder(
                                  // print(datar.length);
                                   itemCount: countriesData.countryData.length,
                                    itemBuilder: (BuildContext context, index) {
                                      print(datar!.length);
                                      return  GestureDetector(
                                        onTap: (){ 
                                          Navigator.push(context, MaterialPageRoute(builder: (context) =>  DetailScreen(name:countriesData.countryData![index].name.common.toString())));

                                        },
                                        child: CountryWidget(
                                          image:  countriesData.countryData[index].flags.png.toString(),
                                          countryName: countriesData.countryData[index].name.official.toString(),
                                          color_1: data.isDark ? AppColor.countryNameColorDark: AppColor.countryNameColorLight,
                                          capital: countriesData.countryData[index].capital.toString().replaceAll("[", "").replaceAll("]", ""),
                                          color_2: data.isDark ? AppColor.countryCapitalColorDark : AppColor.countryCapitalColorLightDark,),
                                      );
                                    });
                               }
                             )
                            ),
                          ],
                        )
                    ]
                  ),
                );
              }
            ),
          )
      );
  }
}