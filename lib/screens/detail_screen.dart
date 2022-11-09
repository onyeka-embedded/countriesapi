import 'package:countriesapp/custom_widgets/detail_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:card_swiper/card_swiper.dart';
import '../const/app_color.dart';
import '../custom_widgets/country_widget.dart';
import '../provider/theme_provider.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                    SizedBox(
                          height: 33.h,
                          width: 214.w,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                           Icon(Icons.arrow_back),
                          Text("Andorra", style: TextStyle(fontSize: 18.sp)),
                        ]
                      ),
                    ),
                    SizedBox(height: 18.h),
                    
                  SizedBox(
                    height: 200.h,
                    width: double.maxFinite,
                    
                    child: Swiper(
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(8)
                    ),
                  );
                },
                autoplay: false,
                itemCount: 3,
                
                pagination: const SwiperPagination(
                    alignment: Alignment.bottomCenter,
                    builder: DotSwiperPaginationBuilder(
                        color: Colors.white, activeColor: Colors.blue, size: 5, activeSize: 5)),
                    control: SwiperControl(
                      iconPrevious: Icons.arrow_back_ios,
                      iconNext: Icons.arrow_forward_ios,
                       color: Colors.white,
                       size: 20,
                       padding: EdgeInsets.symmetric(horizontal: 20.w)),
              ),
                  ),
                  SizedBox(height: 18.h),

                    const DetailWidget(
                      population: "77,354", 
                      region: "Europe", 
                      capital: "capital", 
                      motto: "motto", 
                      officialLang: "officialLang", 
                      ethnicGroup: "ethnicGroup", 
                      religion: "religion", 
                      govt: "govt",
                       independence: "independence",
                        area: "area", 
                        currency: "currency", 
                        gdp: "gdp", 
                        timeZone: "timeZone", 
                        dateFormat: "dateFormat",
                         dailingCode: "dailingCode", 
                         drivingSide: "drivingSide"
                         )
                  
                  ]
                );
              }
            ),
          )
      );
  }
}