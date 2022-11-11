import 'package:countriesapp/custom_widgets/detail_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:card_swiper/card_swiper.dart';
import '../provider/countries_provider.dart';
import '../provider/theme_provider.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({Key? key, required this.name}) : super(key: key);
  final String name;

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  initState() {
    // TODO: implement initState
    final _Countiesrovider =
        Provider.of<CountriesProvider>(context, listen: false);
    _Countiesrovider.getAllCountryByName(widget.name);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      margin: EdgeInsets.only(left: 24.w, right: 24.w, top: 24.h),
      child: Consumer<DarkThemeProvider>(
          builder: (BuildContext context, data, child) {
        return Consumer<CountriesProvider>(
            builder: (BuildContext context, countriesDataByName, child) {
          return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 24.h),
                SizedBox(
                  height: 33.h,
                  width: 214.w,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap:(){
                            Navigator.pop(context);
                          },
                          child: Icon(Icons.arrow_back)),
                        Text(
                            countriesDataByName.countryByNameList.length > 0
                                ? countriesDataByName
                                    .countryByNameList[0].name.common
                                    .toString()
                                : "no data",
                            style: TextStyle(fontSize: 18.sp)),
                      ]),
                ),
                SizedBox(height: 18.h),
                SizedBox(
                  height: 200.h,
                  width: double.maxFinite,
                  child: Swiper(
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        decoration: BoxDecoration(
                            color: Colors.grey.shade100,
                            borderRadius: BorderRadius.circular(5),
                            image: DecorationImage(
                                image: NetworkImage(
                                  countriesDataByName.countryByNameList.length >
                                          0
                                      ? countriesDataByName
                                          .countryByNameList[0].flags.png
                                          .toString()
                                      : "no data",
                                ),
                                fit: BoxFit.cover)),
                      );
                    },
                    autoplay: false,
                    itemCount: 3,
                    pagination: const SwiperPagination(
                        alignment: Alignment.bottomCenter,
                        builder: DotSwiperPaginationBuilder(
                            color: Colors.white,
                            activeColor: Colors.blue,
                            size: 5,
                            activeSize: 5)),
                    control: SwiperControl(
                        iconPrevious: Icons.arrow_back_ios,
                        iconNext: Icons.arrow_forward_ios,
                        color: Colors.white,
                        size: 20,
                        padding: EdgeInsets.symmetric(horizontal: 20.w)),
                  ),
                ),
                SizedBox(height: 18.h),
                DetailWidget(
                    population: countriesDataByName.countryByNameList.length > 0
                        ? countriesDataByName.countryByNameList[0].population
                            .toString()
                        : "no data",
                    region: countriesDataByName.countryByNameList.length > 0
                        ? countriesDataByName.countryByNameList[0].region
                            .toString()
                        : "no data",
                    capital: countriesDataByName.countryByNameList.length > 0
                        ? countriesDataByName.countryByNameList[0].capital
                            .toString().replaceAll("[", "").replaceAll("]", "")
                        : "no data",
                    motto: "motto",
                    officialLang: countriesDataByName.countryByNameList.length > 0
                        ? countriesDataByName.countryByNameList[0].languages.values.first
                            .toString()
                        : "no data",
                    ethnicGroup: "ethnicGroup",
                    religion: "religion",
                    govt: "govt",
                    independence: countriesDataByName.countryByNameList.length > 0
                        ? countriesDataByName.countryByNameList[0].independent
                            .toString()
                        : "no data",
                    area: countriesDataByName.countryByNameList.length > 0
                        ? countriesDataByName.countryByNameList[0].area
                            .toString() + "km2"
                        : "no data",
                    currency:  countriesDataByName.countryByNameList.length > 0
                        ? countriesDataByName.countryByNameList[0].currencies.values.first["name"]
                            .toString()
                        : "no data",
                    gdp: "gdp",
                    timeZone: countriesDataByName.countryByNameList.length > 0
                        ? countriesDataByName.countryByNameList[0].timezones[0]
                            .toString()
                        : "no data",
                    dateFormat: "dateFormat",
                    dailingCode: countriesDataByName.countryByNameList.length > 0
                        ? countriesDataByName.countryByNameList[0].idd['root'].toString()
                        .replaceAll("[", "").replaceAll("]", "")
                         + 
                        countriesDataByName.countryByNameList[0].idd['suffixes'].toString()
                        .replaceAll("[", "").replaceAll("]", "")
                        : "no data",
                    drivingSide: countriesDataByName.countryByNameList.length > 0
                        ? countriesDataByName.countryByNameList[0].car['side']
                            .toString()
                        : "no data",)
              ]);
        });
      }),
    ));
  }
}
