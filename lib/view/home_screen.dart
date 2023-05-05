import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:intravel/common/custom_card.dart';
import 'package:intravel/common/textInputField.dart';
import 'package:intravel/constants/file_constant.dart';
import 'package:intravel/model/restaurant_model.dart';
import 'package:intravel/theme/app_colors.dart';
import 'package:intravel/view/favorite_page.dart';
import 'package:intravel/view/profile_screen.dart';
import 'package:intravel/view/weather_page.dart';

import '../model/excursions_model.dart';
import '../model/hotel_model.dart';
import '../model/upcoming_event_model.dart';
import 'package:favorite_button/favorite_button.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController _searchController = TextEditingController();
  List<EventModel> display_list = List.from(eventList);
  List<Excursion> excursion_list = List.from(excursionList);
  List<HotelModel> hotel_list = List.from(hotelList);
  List<RestaurantModel> restaurant_list = List.from(restaurantList);
  bool like = false;
  int selectedIndex = 0;
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _searchController.dispose();
  }

  _getHomePage() {
    return SafeArea(
        child: SingleChildScrollView(
      physics: AlwaysScrollableScrollPhysics(),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.only(
            right: 15.0,
            left: 10,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: RichText(
                    text: TextSpan(children: [
                  TextSpan(
                      text: 'In',
                      style: TextStyle(
                          fontSize: 20,
                          color: AppColors.primaryButtonColor,
                          fontWeight: FontWeight.w700)),
                  TextSpan(
                      text: 'Travel',
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                          fontWeight: FontWeight.w700))
                ])),
              ),
              InkWell(
                mouseCursor: SystemMouseCursors.click,
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProfileScreen(),
                      ));
                },
                child: Container(
                  height: 35,
                  width: 35,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black26),
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: AssetImage('assets/images/zoro.jpg'))),
                ),
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 15.0, top: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Flexible(
                flex: 8,
                child: TextFormField(
                  decoration: InputDecoration(
                      prefixIcon: const Icon(
                        Icons.search,
                        color: Colors.black12,
                        size: 20,
                      ),
                      contentPadding: const EdgeInsets.only(
                          left: 10, right: 10, top: 0, bottom: 0),
                      hintText: 'Search Place',
                      hintStyle: const TextStyle(color: Colors.black12),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                            color: Colors.black12,
                          )),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                            color: Colors.black12,
                          ))),
                ), /*  */
              ),
              const SizedBox(
                width: 8,
              ),
              Flexible(
                flex: 1,
                child: InkWell(
                  child: Container(
                      height: 45,
                      width: 45,
                      padding: const EdgeInsets.only(left: 5, right: 5),
                      decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(10)),
                      child: Image.asset(
                        FileConstants.filter,
                        color: AppColors.whiteColor,
                        width: 30,
                        height: 30,
                      )),
                ),
              )
            ],
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(left: 20.0, top: 20),
          child: Text(
            'Upcoming Events',
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.w700, fontSize: 24),
          ),
        ),
        Container(
          height: 290,
          margin: const EdgeInsets.only(top: 10),
          width: MediaQuery.of(context).size.width,
          child: ListView.separated(
              scrollDirection: Axis.horizontal,
              physics: AlwaysScrollableScrollPhysics(),
              separatorBuilder: (context, index) => Container(
                    width: 0,
                  ),
              itemCount: display_list.length,
              itemBuilder: (context, index) => CustomCard(
                    margin: EdgeInsets.only(
                        right: index == display_list.length - 1 ? 20 : 0,
                        left: index == 0 ? 20 : 10,
                        top: 10,
                        bottom: 10),
                    padding: const EdgeInsets.all(0),
                    containerpadding: const EdgeInsets.all(0),
                    child: SizedBox(
                      width: 200,
                      height: 290,
                      child: Column(
                        children: [
                          Container(
                            height: 150,
                            width: 200,
                            clipBehavior: Clip.antiAlias,
                            decoration: BoxDecoration(
                                borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(15),
                                    topRight: Radius.circular(15)),
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: AssetImage(
                                      display_list[index].imageUrl ?? '',
                                    ))),
                            child: Container(
                              height: 30,
                              alignment: Alignment.bottomRight,
                              padding:
                                  const EdgeInsets.only(bottom: 10, right: 10),
                              child: Container(
                                decoration: BoxDecoration(
                                    color:
                                        AppColors.primaryColor.withOpacity(.7),
                                    borderRadius: BorderRadius.circular(5)),
                                padding: const EdgeInsets.all(5.0),
                                child: Text(
                                  "${display_list[index].price ?? ''}\$ /person",
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 13,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 15.0, right: 15),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      display_list[index].place ?? '',
                                      style: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w700,
                                          color: Colors.black),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        const Icon(
                                          Icons.calendar_month_outlined,
                                          size: 13,
                                          color: Colors.black26,
                                          weight: 700,
                                        ),
                                        const SizedBox(
                                          width: 3,
                                        ),
                                        Text(
                                          "${display_list[index].month ?? ''} ${display_list[index].date ?? ''}",
                                          style: const TextStyle(
                                            fontSize: 11,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.black26,
                                          ),
                                        )
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Container(
                                          height: 25,
                                          width: 25,
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              image: DecorationImage(
                                                  image: AssetImage(
                                                      display_list[index]
                                                              .logo ??
                                                          ''),
                                                  fit: BoxFit.cover)),
                                        ),
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const Text(
                                              'Host by',
                                              style: TextStyle(
                                                fontSize: 11,
                                                fontWeight: FontWeight.w600,
                                                color: Colors.black26,
                                              ),
                                            ),
                                            Text(
                                              display_list[index].hotel ?? '',
                                              style: const TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w700,
                                                  color: Colors.black),
                                            )
                                          ],
                                        )
                                      ],
                                    )
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Icon(
                                      Icons.star,
                                      size: 13,
                                      color: AppColors.primaryColor,
                                      weight: 700,
                                    ),
                                    Text(
                                      display_list[index].rating ?? '',
                                      style: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 13,
                                          fontWeight: FontWeight.w500),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  )),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'Excursions',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                    fontSize: 24),
              ),
              TextButton(
                  onPressed: () {},
                  child: const Text('See all excursions',
                      style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w600,
                        color: Colors.black26,
                      )))
            ],
          ),
        ),
        ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: excursion_list.length,
          itemBuilder: (context, index) => CustomCard(
            padding:
                const EdgeInsets.only(left: 5, top: 5, bottom: 5, right: 10),
            containerpadding: const EdgeInsets.all(0),
            margin: EdgeInsets.only(
                top: index == 0 ? 5 : 0, bottom: 10, right: 20, left: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: 80,
                      width: 80,
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                              image:
                                  AssetImage(excursion_list[index].image ?? ''),
                              fit: BoxFit.cover)),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 3.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(excursion_list[index].place ?? '',
                                  style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.black)),
                              const SizedBox(
                                height: 3,
                              ),
                              Text(
                                  'Around ${excursion_list[index].hours ?? ''}',
                                  style: const TextStyle(
                                    fontSize: 11,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black26,
                                  )),
                            ],
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Text(excursion_list[index].day ?? '',
                              style: const TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.w700,
                                color: Colors.black,
                              ))
                        ],
                      ),
                    )
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    IconButton(
                        alignment: Alignment.topRight,
                        padding: const EdgeInsets.only(top: 5, right: 5),
                        hoverColor: Colors.transparent,
                        splashColor: Colors.transparent,
                        onPressed: () {
                          excursion_list[index].isSelected =
                              !excursion_list[index].isSelected!;
                          setState(() {});
                        },
                        icon: Icon(
                          Icons.favorite,
                          size: 13,
                          color: excursion_list[index].isSelected!
                              ? AppColors.primaryButtonColor
                              : Colors.black38,
                        )),
                    Row(
                      children: [
                        const Icon(
                          Icons.star,
                          size: 13,
                          color: AppColors.primaryColor,
                          weight: 700,
                        ),
                        Text(
                          excursion_list[index].rating ?? '',
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 13,
                              fontWeight: FontWeight.w500),
                        )
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'Hotels',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                    fontSize: 24),
              ),
              TextButton(
                  onPressed: () {},
                  child: const Text('See all hotels',
                      style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w600,
                        color: Colors.black26,
                      )))
            ],
          ),
        ),
        ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: hotel_list.length,
            itemBuilder: (context, index) => CustomCard(
                  padding: const EdgeInsets.only(
                      left: 5, top: 5, bottom: 5, right: 10),
                  containerpadding: const EdgeInsets.all(0),
                  margin: EdgeInsets.only(
                      top: index == 0 ? 5 : 0, bottom: 10, right: 20, left: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            height: 80,
                            width: 80,
                            clipBehavior: Clip.antiAlias,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(
                                    image: AssetImage(
                                        hotel_list[index].image ?? ''),
                                    fit: BoxFit.cover)),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 3.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(hotel_list[index].hotel ?? '',
                                        style: const TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w700,
                                            color: Colors.black)),
                                    const SizedBox(
                                      height: 3,
                                    ),
                                    Text(
                                        'About ${hotel_list[index].price ?? ''} per person',
                                        style: const TextStyle(
                                          fontSize: 11,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.black26,
                                        )),
                                  ],
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                Row(
                                  children: [
                                    Visibility(
                                      visible: hotel_list[index].ratedHost!,
                                      child: Container(
                                        padding: const EdgeInsets.only(
                                            top: 2,
                                            bottom: 2.5,
                                            left: 3,
                                            right: 3),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            border: Border.all(
                                              color: Colors.blue.shade900,
                                            )),
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Icon(
                                              Icons.workspace_premium_sharp,
                                              size: 8,
                                              color: Colors.blue.shade900,
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 1.0),
                                              child: Text(
                                                'Top rated host',
                                                style: TextStyle(
                                                    color: Colors.blue.shade900,
                                                    fontSize: 8,
                                                    letterSpacing: .7,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 2,
                                    ),
                                    Visibility(
                                      visible: hotel_list[index].wifi!,
                                      child: Container(
                                        padding: const EdgeInsets.only(
                                            top: 2,
                                            bottom: 2.5,
                                            left: 3,
                                            right: 3),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            border: Border.all(
                                              color: Colors.blue.shade900,
                                            )),
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Icon(
                                              Icons.wifi,
                                              size: 8,
                                              color: Colors.blue.shade900,
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 1.0),
                                              child: Text(
                                                'Free wifi',
                                                style: TextStyle(
                                                    color: Colors.blue.shade900,
                                                    fontSize: 8,
                                                    letterSpacing: .7,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 2,
                                    ),
                                    Visibility(
                                      visible: hotel_list[index].foodAvailable!,
                                      child: Container(
                                        padding: const EdgeInsets.only(
                                            top: 2,
                                            bottom: 2.5,
                                            left: 3,
                                            right: 3),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            border: Border.all(
                                              color: Colors.blue.shade900,
                                            )),
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Icon(
                                              Icons.dining_outlined,
                                              size: 8,
                                              color: Colors.blue.shade900,
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 1.0),
                                              child: Text(
                                                'Food available',
                                                style: TextStyle(
                                                    color: Colors.blue.shade900,
                                                    fontSize: 8,
                                                    letterSpacing: .7,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 5.0,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Icon(
                              Icons.star,
                              size: 13,
                              color: AppColors.primaryColor,
                              weight: 700,
                            ),
                            Text(
                              hotel_list[index].rating ?? '',
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w500),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                )),
        Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'Restaurants',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                    fontSize: 24),
              ),
              TextButton(
                  onPressed: () {},
                  child: const Text('See all restaurants',
                      style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w600,
                        color: Colors.black26,
                      )))
            ],
          ),
        ),
        Container(
          height: 250,
          margin: const EdgeInsets.only(top: 10),
          width: MediaQuery.of(context).size.width,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              physics: AlwaysScrollableScrollPhysics(),
              itemCount: restaurant_list.length,
              itemBuilder: (context, index) => CustomCard(
                    margin: EdgeInsets.only(
                        right: index == restaurant_list.length - 1 ? 20 : 0,
                        left: index == 0 ? 20 : 10,
                        bottom: 10),
                    padding: const EdgeInsets.all(0),
                    containerpadding: const EdgeInsets.all(0),
                    child: SizedBox(
                      width: 200,
                      height: 250,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 150,
                            width: 200,
                            clipBehavior: Clip.antiAlias,
                            decoration: BoxDecoration(
                                borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(15),
                                    topRight: Radius.circular(15)),
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: AssetImage(
                                      restaurant_list[index].image ?? '',
                                    ))),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 8.0, right: 8.0, top: 5.0),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      restaurant_list[index].restaurant ?? '',
                                      style: const TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w700,
                                          color: Colors.black),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        const Icon(
                                          Icons.star,
                                          size: 13,
                                          color: AppColors.primaryColor,
                                          weight: 700,
                                        ),
                                        Text(
                                          restaurant_list[index].rating ?? '',
                                          style: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 13,
                                              fontWeight: FontWeight.w500),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        const Icon(
                                          Icons.location_on,
                                          size: 11,
                                          color: Colors.black26,
                                          weight: 700,
                                        ),
                                        const SizedBox(
                                          width: 2,
                                        ),
                                        Text(
                                          restaurant_list[index].place ?? '',
                                          style: const TextStyle(
                                            fontSize: 11,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.black26,
                                          ),
                                        )
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        const Icon(
                                          Icons.timer,
                                          size: 11,
                                          color: Colors.black26,
                                          weight: 700,
                                        ),
                                        const SizedBox(
                                          width: 2,
                                        ),
                                        Text(
                                          restaurant_list[index].timing ?? '',
                                          style: const TextStyle(
                                            fontSize: 11,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.black26,
                                          ),
                                        )
                                      ],
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                            alignment: Alignment.bottomLeft,
                            margin: const EdgeInsets.only(
                              left: 9,
                            ),
                            height: 24,
                            width: 100,
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    backgroundColor:
                                        AppColors.primaryButtonColor,
                                    foregroundColor: Colors.white),
                                onPressed: () {},
                                child: const Padding(
                                  padding: EdgeInsets.only(bottom: 2.0),
                                  child: Text(
                                    'Book a table',
                                    style: TextStyle(fontSize: 11),
                                  ),
                                )),
                          )
                        ],
                      ),
                    ),
                  )),
        )
      ]),
    ));
  }

  _getScreen(int index) {
    switch (index) {
      case 0:
        return _getHomePage();

      case 1:
        return const SizedBox();
      case 2:
        return WeatherPage();
      case 3:
        return const SizedBox();
      case 4:
        return FavoritePage();
    }
  }

  void _onItemtapped(int index) {
    selectedIndex = index;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        width: MediaQuery.of(context).size.width,
        margin: const EdgeInsets.only(left: 15, right: 15, bottom: 15, top: 15),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.transparent),
          color: Colors.transparent,
        ),
        child: ClipRRect(
          clipBehavior: Clip.antiAlias,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15.0),
              topRight: Radius.circular(15.0),
              bottomRight: Radius.circular(15.0),
              bottomLeft: Radius.circular(15.0)),
          child: BottomNavigationBar(
              backgroundColor: AppColors.primaryColor.withOpacity(.5),
              selectedItemColor: Colors.white,
              unselectedItemColor: Colors.black,
              selectedFontSize: 10,
              iconSize: 20,
              unselectedFontSize: 10,
              selectedLabelStyle: TextStyle(color: Colors.white),
              unselectedLabelStyle: TextStyle(color: Colors.black),
              onTap: (index) => _onItemtapped(index),
              currentIndex: selectedIndex,
              elevation: 10,
              type: BottomNavigationBarType.fixed,
              items: <BottomNavigationBarItem>[
                BottomNavigationBarItem(icon: Icon(Icons.map), label: 'Trips'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.location_on), label: 'Map'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.sunny_snowing), label: 'Weather'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.calendar_today_rounded), label: 'Plans'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.favorite), label: 'Favorites')
              ]),
        ),
      ),
      body: _getScreen(selectedIndex),
    );
  }
}
