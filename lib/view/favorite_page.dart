import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:intravel/view/home_screen.dart';

import '../common/custom_card.dart';
import '../model/excursions_model.dart';
import '../theme/app_colors.dart';
import '../theme/text_style.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({super.key});

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  List<Favorites> display_list = List.from(favoriteList);
  TextEditingController _searchController = TextEditingController();

  void updateList(String value) {
    setState(() {
      display_list = favoriteList
          .where((element) =>
              element.place!.toLowerCase().contains(value.toLowerCase()))
          .toList();
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _searchController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.whiteColor.withOpacity(.1),
        elevation: 0,
        leading: IconButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomeScreen(),
                  ));
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
              weight: 700,
            )),
        centerTitle: true,
        title: const Text('Favorites', style: headingStyle),
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 20.0),
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
                  toolbarOptions: const ToolbarOptions(
                    copy: false,
                    paste: false,
                    cut: false,
                    selectAll: true,
                  ),
                  cursorColor: Colors.black,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                  onChanged: (value) => updateList(value),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: display_list.length,
                itemBuilder: (context, index) => CustomCard(
                  padding: const EdgeInsets.only(
                      left: 5, top: 5, bottom: 5, right: 10),
                  containerpadding: const EdgeInsets.all(0),
                  margin: EdgeInsets.only(
                      top: index == 0 ? 5 : 0, bottom: 17, right: 20, left: 20),
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
                                    image: AssetImage(
                                        display_list[index].image ?? ''),
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
                                    Text(display_list[index].place ?? '',
                                        style: const TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w700,
                                            color: Colors.black)),
                                    const SizedBox(
                                      height: 3,
                                    ),
                                    Text(
                                        'Around ${display_list[index].hours ?? ''}',
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
                                Text(display_list[index].day ?? '',
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
                                display_list[index].isSelected =
                                    !display_list[index].isSelected!;
                                setState(() {});
                              },
                              icon: Icon(
                                Icons.favorite,
                                size: 13,
                                color: !display_list[index].isSelected!
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
                                display_list[index].rating ?? '',
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
            ],
          ),
        ),
      ),
    );
  }
}
