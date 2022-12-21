import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../utils/colors.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {

  bool displaySearchResult = false;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        extendBodyBehindAppBar: true,
        body: ListView.builder(
            itemCount: 1,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    Container(
                      width: 0.9.sw,
                      height: 0.1.sh,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          FaIcon(
                            FontAwesomeIcons.barsStaggered,
                            size: 0.05.sw,
                          ),
                          FaIcon(FontAwesomeIcons.bookmark, size: 0.05.sw)
                        ],
                      ),
                    ),
                    Text(
                      'What are you looking for? ',
                      style: GoogleFonts.spaceMono(
                          fontSize: 0.02.sh, fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: 0.01.sh,
                    ),
                    TextField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.r),
                              borderSide:
                              BorderSide(color: AppColors.purpleColor)),
                          contentPadding:
                          EdgeInsets.symmetric(horizontal: 0.05.sw),
                          focusedBorder: OutlineInputBorder(
                              borderSide:
                              BorderSide(color: AppColors.purpleColor),
                              borderRadius: BorderRadius.circular(20.r)),
                          suffix: FaIcon(
                            FontAwesomeIcons.magnifyingGlass,
                            size: 0.02.sh,
                          )),

                    ),
                    Text(
                      'Search by name or category',
                      style: GoogleFonts.spaceMono(fontSize: 0.01.sh),
                    ),
                    Column(
                      children: [
                        Visibility(
                          visible: displaySearchResult,
                          child: Container(
                              height: 1.sh,
                              child: ListView.builder(
                                physics: NeverScrollableScrollPhysics(),
                                itemCount:
                                5,
                                itemBuilder: (context, index) {
                                  return Container(
                                    margin: EdgeInsets.symmetric(vertical: 9.0),
                                    padding: EdgeInsets.all(5),
                                    decoration: BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                            color: Colors.grey[200]!,
                                            blurRadius: 3.0,
                                            offset: Offset(0, 1))
                                      ],
                                      color: Colors.white,
                                    ),
                                    child: ListTile(
                                      onTap: () {
                                       Get.showSnackbar(GetSnackBar(messageText: Text('clicked'),)).show();
                                      },
                                      leading: Container(
                                        width: 50,
                                        height: 50,
                                        padding: EdgeInsets.all(9),
                                        decoration: BoxDecoration(
                                            color: Color(0xff5bd2d4),
                                            shape: BoxShape.circle,


                                            ),
                                      ),
                                      title: Text("test"),
                                      subtitle: Text("test"),
                                      trailing: IconButton(
                                          icon: Icon(Icons.chevron_right),
                                          onPressed: () {}),
                                    ),
                                  );
                                },
                              )),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          height: 0.015.sh,
                        ),
                        Visibility(
                          visible: !displaySearchResult,
                          child: Container(
                            child: Column(
                              children: [
                                Container(
                                  width: 0.8.sw,
                                  height: 0.2.sh,
                                  decoration: BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                            blurRadius: 20,
                                            color: Colors.grey,
                                            spreadRadius: -5,
                                            offset: Offset(0, 0))
                                      ],
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(15)),
                                  child: Stack(
                                    children: [
                                      Positioned(
                                          bottom: -0.07.sw,
                                          right: -0.1.sw,
                                          child: CircleAvatar(
                                            backgroundColor: Colors.blueAccent,
                                            radius: 0.1.sh,
                                          )),
                                      Positioned(
                                          bottom: -0.08.sh,
                                          right: 0..sw,
                                          child: Image(
                                            image: AssetImage(
                                              'assets/image/phone illustration.png',
                                            ),
                                            width: 150,
                                            height: 250,
                                          )),
                                      Positioned(
                                        top: 0.05.sh,
                                        left: 0.05.sh,
                                        child: Column(
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: [
                                            FaIcon(
                                              FontAwesomeIcons.utensils,
                                              color: Colors.orange,
                                            ),
                                            Padding(
                                              padding:
                                              EdgeInsets.only(top: 0.01.sh),
                                              child: Text(
                                                'Food',
                                                style: GoogleFonts.spaceMono(
                                                    fontSize: 0.02.sh,
                                                    fontWeight:
                                                    FontWeight.bold),
                                              ),
                                            ),
                                            Text(
                                              'Favorite place suggestions',
                                              style: GoogleFonts.kanit(
                                                  fontSize: 0.015.sh,
                                                  color: Colors.grey),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 0.05.sh,
                                ),
                                Container(
                                  width: 0.8.sw,
                                  height: 0.2.sh,
                                  decoration: BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                            blurRadius: 20,
                                            color: Colors.grey,
                                            spreadRadius: -5,
                                            offset: Offset(0, 0))
                                      ],
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(15)),
                                  child: Stack(
                                    children: [
                                      Positioned(
                                          bottom: -0.07.sw,
                                          right: -0.1.sw,
                                          child: CircleAvatar(
                                            backgroundColor: Colors.pinkAccent,
                                            radius: 0.1.sh,
                                          )),
                                      Positioned(
                                          bottom: -0.05.sh,
                                          right: 0.05.sw,
                                          child: Image(
                                            image: AssetImage(
                                              'assets/image/park illustration.png',
                                            ),
                                            width: 0.5.sw,
                                            height: 0.3.sh,
                                          )),
                                      Positioned(
                                        top: 0.05.sh,
                                        left: 0.05.sh,
                                        child: Column(
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: [
                                            FaIcon(
                                              FontAwesomeIcons.utensils,
                                              color: AppColors.darkGreen,
                                            ),
                                            Padding(
                                              padding:
                                              EdgeInsets.only(top: 0.01.sh),
                                              child: Text(
                                                'Transport',
                                                style: GoogleFonts.spaceMono(
                                                    fontSize: 0.02.sh,
                                                    fontWeight:
                                                    FontWeight.bold),
                                              ),
                                            ),
                                            Text(
                                              'Reach your destination',
                                              style: GoogleFonts.kanit(
                                                  fontSize: 0.015.sh,
                                                  color: Colors.grey),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 0.05.sh,
                                ),
                                Container(
                                  width: 0.8.sw,
                                  height: 0.2.sh,
                                  decoration: BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                            blurRadius: 20,
                                            color: Colors.grey,
                                            spreadRadius: -5,
                                            offset: Offset(0, 0))
                                      ],
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(15)),
                                  child: Stack(
                                    children: [
                                      Positioned(
                                          bottom: -0.07.sw,
                                          right: -0.1.sw,
                                          child: CircleAvatar(
                                            backgroundColor: Colors.greenAccent,
                                            radius: 0.1.sh,
                                          )),
                                      Positioned(
                                          bottom: -0.05.sh,
                                          right: 0.05.sw,
                                          child: Image(
                                            image: AssetImage(
                                              'assets/image/mountain illustration.png',
                                            ),
                                            width: 0.3.sw,
                                            height: 0.3.sh,
                                          )),
                                      Positioned(
                                        top: 0.05.sh,
                                        left: 0.05.sh,
                                        child: Column(
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: [
                                            FaIcon(
                                              FontAwesomeIcons.mountainSun,
                                              color: AppColors.yellowColor,
                                            ),
                                            Padding(
                                              padding:
                                              EdgeInsets.only(top: 0.01.sh),
                                              child: Text(
                                                'Mountain',
                                                style: GoogleFonts.spaceMono(
                                                    fontSize: 0.02.sh,
                                                    fontWeight:
                                                    FontWeight.bold),
                                              ),
                                            ),
                                            Text(
                                              'Favorite place suggestions',
                                              style: GoogleFonts.kanit(
                                                  fontSize: 0.015.sh,
                                                  color: Colors.grey),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 0.05.sh,
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              );
            }),
      ),
    );
  }


}
