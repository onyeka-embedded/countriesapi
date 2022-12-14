
import 'package:countriesapp/provider/countries_provider.dart';
import 'package:countriesapp/screens/detail_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../const/app_color.dart';
import '../const/enum_const.dart';
import '../custom_widgets/country_widget.dart';
import '../models/countries_model.dart';
import '../provider/theme_provider.dart';
import '../services/countries_api.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late List<CountriesModel>? datar = [];
  CountriesApiService countriesApiService = CountriesApiService();
  TextEditingController _searchController = TextEditingController();
  late FocusNode focusNode;
  @override
  initState() {
    // TODO: implement initState
    
    focusNode = FocusNode();
    super.initState();
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    final countiesProvider =
        Provider.of<CountriesProvider>(context, listen: true);
    countiesProvider.getAllCountriesData();
    super.didChangeDependencies();
  }
  

  @override
  void dispose() {
    // TODO: implement dispose
    _searchController.dispose();
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final _provider = Provider.of<DarkThemeProvider>(context, listen: false);
    final _CountriesProvider = Provider.of<CountriesProvider>(context, listen: false);
    int gv = 0;
  

    return SafeArea(
      child: Scaffold(
          body: Container(
        margin: EdgeInsets.only(left: 24.w, right: 24.w, top: 0.h),
        child: Consumer<DarkThemeProvider>(
            builder: (BuildContext context, data, child) {
          return SingleChildScrollView(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 24.h),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            // Navigator.push(context, MaterialPageRoute(builder: (context) => const DetailScreen()));
                          },
                          child: SizedBox(
                            height: 25.h,
                            width: 120.w,
                            child: data.isDark
                                ? Image.asset("assets/images/logo.png",
                                    fit: BoxFit.cover)
                                : Image.asset("assets/images/ex_logo.png",
                                    fit: BoxFit.cover),
                          ),
                        ),
                        GestureDetector(
                            onTap: () {
                              _provider.setDarkTheme = !_provider.isDark;
                            },
                            child: Icon(
                                data.isDark ? Icons.dark_mode : Icons.sunny)),
                      ]),
                  SizedBox(height: 20.h),
                  SizedBox(
                      height: 48.h,
                      width: 380.w,
                      child: TextField(
                        decoration: InputDecoration(
                          fillColor: data.isDark
                              ? const Color.fromRGBO(152, 162, 179, 0.2)
                              : const Color(0xFFF2F4F7),
                          filled: true,
                          border: const OutlineInputBorder(
                            borderSide: BorderSide.none,
                          ),
                          hintText: "Search Country",
                          contentPadding: EdgeInsets.zero,
                          hintStyle: TextStyle(
                              fontSize: 12,
                              color: data.isDark
                                  ? const Color(0xFFEAECF0)
                                  : const Color(0xFF000000),
                              fontFamily: "Axiforma"),
                          prefixIcon: SizedBox(child: Icon(Icons.search)),
                        ),
                        controller: _searchController,
                        keyboardType: TextInputType.text,
                        onChanged: _CountriesProvider.searchResult,
                      )),
                  SizedBox(height: 16.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          _showModalBS(context, data);
                        },
                        child: Container(
                          height: 40.h,
                          width: 73.w,
                          decoration: BoxDecoration(
                              color: data.isDark
                                  ? const Color(0xFF000F24)
                                  : const Color(0xFFFCFCFD),
                              borderRadius: BorderRadius.circular(4.r),
                              border: Border.all(
                                color: data.isDark
                                    ? const Color(0xFFA9B8D5)
                                    : const Color(0xFFA9B8D5),
                                width: 0.2,
                              )),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 10.w,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Icon(
                                  CupertinoIcons.globe,
                                  size: 25.h,
                                ),
                                Text(
                                  "EN",
                                  style: TextStyle(fontSize: 14.sp),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),

                      GestureDetector(
                        onTap: () {
                          showModalBottomSheet(
                              context: context,
                              backgroundColor: data.isDark
                                  ? const Color(0xFF000F24)
                                  : Colors.white,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.vertical(
                                      top: Radius.circular(30.r))),
                              clipBehavior: Clip.hardEdge,
                              builder: (context) {
                                return Container(
                                    margin: EdgeInsets.only(
                                        top: 20.h, left: 15.w, right: 15.w),
                                   height: MediaQuery.of(context).size.height * 0.2,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                            topRight: Radius.circular(15.r),
                                            topLeft: Radius.circular(15.r))),
                                    child: Column(children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          const Text(
                                            "Filter",
                                            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, fontFamily: "Axiforma"),
                                          ),
                                           IconButton(
                                            icon: Icon(Icons.close, size: 40.h,), 
                                            onPressed: () { 
                                            Navigator.pop(context);
                                             },),
                                        ],
                                      ),
                                      SizedBox(height: 8.h,),
                                        Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          const Text(
                                            "Continent",
                                            style: TextStyle(fontSize: 14, fontWeight: FontWeight.normal, fontFamily: "Axiforma"),
                                          ),
                                          IconButton(
                                            icon: Icon(Icons.arrow_drop_down_sharp, size: 40.h,), 
                                            onPressed: () { 
                                                 //const FilterShowBM();
                                         showModel4Filter(context, data);
                                             },),
                                        ],
                                      ),
                                        SizedBox(height: 8.h,),
                                        Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                         const Text(
                                            "Timezone",
                                            style: TextStyle(fontSize: 14, fontWeight: FontWeight.normal, fontFamily: "Axiforma"),
                                          ),
                                           IconButton(
                                            icon: Icon(Icons.arrow_drop_down_sharp, size: 40.h,), 
                                            onPressed: () { 
                                              
                                             },),
                                        ],
                                      ),
                                    ]));
                              });
                        },
                        child: Container(
                          height: 40.h,
                          width: 86.w,
                          decoration: BoxDecoration(
                              color: data.isDark
                                  ? const Color(0xFF000F24)
                                  : const Color(0xFFFCFCFD),
                              borderRadius: BorderRadius.circular(4.r),
                              border: Border.all(
                                color: const Color(0xFFA9B8D5),
                                width: 0.2,
                              )),
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10.w),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Icon(
                                  Icons.filter_alt_outlined,
                                  size: 25.h,
                                ),
                                Text("Filter",
                                    style: TextStyle(fontSize: 14.sp))
                              ],
                            ),
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
                      SizedBox(
                        height: 18.h,
                      ),
                     //  _CountriesProvider.getAllCountriesData(),
                        _CountriesProvider.isLoading
                            ? 
                             Container(
                               height: 639.h,
                               width: double.maxFinite,
                            color: data.isDark ? const Color(0xFF000F24) : Colors.white,
                              child: Column(
                                children: [
                                  SizedBox(
                                     height: 500.h,
                                    width: double.maxFinite,
                                    child: SpinKitThreeBounce(
                                        duration: const Duration(seconds: 1),
                                        itemBuilder: (BuildContext context, index) {
                                        //  print("true");
                                          return DecoratedBox(
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(15),
                                              color: index.isEven ? Colors.red : Colors.green),
                                       );
                                      }),
                                  ),
                                    InkWell(
                                      onTap: (){
                                        _CountriesProvider.getAllCountriesData();
                                      },
                                      child: Icon(Icons.refresh_outlined, size: 50.h,)),
                                ],
                              ),
                               )
                             :
                      Container(
                          height: 639.h,
                          width: double.maxFinite,
                          child: Consumer<CountriesProvider>(builder:
                              (BuildContext context, countriesData, child) {
                            return ListView.builder(
                                // print(datar.length);
                                itemCount: countriesData.countryData.length,
                                itemBuilder: (BuildContext context, index) {
                                  print(datar!.length);
                                  return GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  DetailScreen(
                                                      name: countriesData
                                                          .countryData![index]
                                                          .name
                                                          .common
                                                          .toString())));
                                    },
                                    child: CountryWidget(
                                      image: countriesData
                                          .countryData[index].flags.png
                                          .toString(),
                                      countryName: countriesData
                                          .countryData[index].name.common
                                          .toString(),
                                      color_1: data.isDark
                                          ? AppColor.countryNameColorDark
                                          : AppColor.countryNameColorLight,
                                      capital: countriesData
                                          .countryData[index].capital
                                          .toString()
                                          .replaceAll("[", "")
                                          .replaceAll("]", ""),
                                      color_2: data.isDark
                                          ? AppColor.countryCapitalColorDark
                                          : AppColor
                                              .countryCapitalColorLightDark,
                                    ),
                                  );
                                });
                          })),
                    ],
                  )
                ]),
          );
        }),
      )),
    );
  }

  Future<dynamic> showModel4Filter(
      BuildContext context, DarkThemeProvider data) {
        final _provider = Provider.of<CountriesProvider>(context, listen: false);
    return showModalBottomSheet(
        context: context,
        backgroundColor: data.isDark ? const Color(0xFF000F24) : Colors.white,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(30.r))),
        clipBehavior: Clip.hardEdge,
        builder: (context) {
          return Container(
            margin: EdgeInsets.only(top: 20.h, left: 20.w, right: 15.w),
            height: MediaQuery.of(context).size.height * 0.8,
            width: double.maxFinite,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(15.r),
                    topLeft: Radius.circular(15.r))),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Filter",
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          fontFamily: "Axiforma"),
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.close,
                        size: 40.h,
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ],
                ),
                SizedBox(
                  height: 10.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Continent",
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                          fontFamily: "Axiforma"),
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.arrow_drop_up_sharp,
                        size: 40.h,
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ],
                ),
                SizedBox(
                  height: 8.h,
                ),
                Expanded(child: Consumer<CountriesProvider>(
                    builder: (BuildContext context, countriesenum, child) {
                  return ListView(
                    children: [
                     ContinentistTile(context, 0, FilterContinent.africa),
                    ContinentistTile(context, 1, FilterContinent.americas),
                     ContinentistTile(context, 2, FilterContinent.asia),
                    ContinentistTile(context, 3, FilterContinent.europe),
                     ContinentistTile(context, 4, FilterContinent.oceania),
                    
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children: [
                    GestureDetector(
                        onTap: (){
                          _provider.countryByContinentList.clear();
                          _provider.clearAllCheckList();
                        },
                      child: Container(
                                    height: 50.h,
                                      width: 80.w,
                                      decoration: BoxDecoration(
                      color: Colors.transparent,
                       border: Border.all(
                          color: data.isDark
                          ?  Colors.white
                           :  Colors.black,
                            width: 0.2,
                                )
                        ),
                                      child: Center(
                                         child: Text("Reset", style: TextStyle(
                                           fontSize: 14.sp,
                                           fontWeight: FontWeight.normal,
                                           fontFamily: "Axiforma"
                                         ),),
                                       ),
                                      ),
                    ),
                 GestureDetector(
                   onTap: (){
                     _provider.getAllCountryByContinent();
                     Navigator.pop(context);
                   },
                   child: Container(
                    height: 50.h,
                   width: 160.w,
                    decoration: BoxDecoration(
                      color: Colors.orangeAccent,
                       border: Border.all(
                          color: data.isDark
                          ?  Colors.white
                           :  Colors.black,
                            width: 0.2,
                                )
                    ),
                    child: const Center(child: Text("Show Result", style: TextStyle(
                      fontSize: 14,
                          fontWeight: FontWeight.normal,
                          fontFamily: "Axiforma"
                    ),))
                                 ),
                 )
                 ]
               )
                    ],
                  );
                }))
              ],
            ),
          );
        });
       }

   Consumer<CountriesProvider> ContinentistTile(BuildContext context, int index, FilterContinent data) {
         List<String> continentList = [
      "Africa",
      "Americas",
      "Asia",
      "Europe",
      "Oceania",
    ];
    final provider = Provider.of<CountriesProvider>(context, listen: false);
    return Consumer<CountriesProvider>(builder:
              (BuildContext context, filterContinent, child) {
        return CheckboxListTile(
          contentPadding: const EdgeInsets.all(0),
          title: Text(
            continentList[index],
            style: const TextStyle(
                fontSize: 14,
                //color: data.isDark ? const Color(0xFFEAECF0) : const Color(0xFF000000),
                fontFamily: "Axiforma"),
          ),
          value: filterContinent.checkContinent[index],
         // groupValue: filterContinent.continent,
          onChanged: (value) {
            provider.filterListTileControl(data);
            print(data.toString());
          },
          activeColor: Colors.amber,
          controlAffinity: ListTileControlAffinity.trailing,
        );
      }
    );
  }

  Future<dynamic> _showModalBS( BuildContext context, DarkThemeProvider data) {

  //final _provider = Provider.of<CountriesProvider>(context, listen: false);
    
    return showModalBottomSheet(
        context: context,
        backgroundColor: data.isDark ? const Color(0xFF000F24) : Colors.white,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(30.r))),
        clipBehavior: Clip.hardEdge,
        builder: (context) {
          return Container(
            margin: EdgeInsets.only(top: 20.h, left: 20.w, right: 15.w),
            height: MediaQuery.of(context).size.height * 0.9,
            width: double.maxFinite,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(15.r),
                    topLeft: Radius.circular(15.r))),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    //SizedBox(width: 1.w,),
                    const Text(
                      "Language",
                      style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                    InkWell(
                      onTap: (){
                        Navigator.pop(context);
                      },
                      child: const Icon(Icons.close)),
                   // SizedBox(width: 5,),
                  ],
                ),
                SizedBox(
                  height: 12.h,
                ),
                Expanded(
                    child: Consumer<CountriesProvider>(builder:
                              (BuildContext context, countriesenum, child) {
                        return ListView(
                          children: [
                            langLIstTile(0, CountryLanguages.behasa),
                             langLIstTile(1, CountryLanguages.chinese),
                              langLIstTile(2, CountryLanguages.deutsch),
                             langLIstTile(3, CountryLanguages.english),
                             langLIstTile(4, CountryLanguages.enpanol),
                             langLIstTile(5, CountryLanguages.french),
                              langLIstTile(6, CountryLanguages.italiano),
                             langLIstTile(7, CountryLanguages.portugues),
                             langLIstTile(8, CountryLanguages.pycckua),
                              langLIstTile(9, CountryLanguages.svenska),
                             langLIstTile(10, CountryLanguages.turkce),
                          ],
                        );
                      }
                    )
                ),
               
              ],
            ),
          );
        });
  }

  Consumer<CountriesProvider> langLIstTile(int index, CountryLanguages value) {
         List<String> _enumValues = CountryLanguages.values.map((e) => e.name).toList();
          final _provider = Provider.of<CountriesProvider>(context, listen: false);
    return Consumer<CountriesProvider>(builder:
              (BuildContext context, countriesenum, child) {
        return RadioListTile(
          contentPadding: EdgeInsets.all(0),
          title: Text(
            _enumValues[index],
            style: const TextStyle(
                fontSize: 14,
                //color: data.isDark ? const Color(0xFFEAECF0) : const Color(0xFF000000),
                fontFamily: "Axiforma"),
          ),
          value: value,
          groupValue: countriesenum.languages,
          onChanged: (CountryLanguages? value) {
            _provider.listTileControl(value);
          },
          activeColor: Colors.amber,
          controlAffinity: ListTileControlAffinity.trailing,
        );
      }
    );
  }
}
