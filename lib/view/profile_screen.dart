import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:intravel/common/custom_card.dart';
import 'package:intravel/theme/app_colors.dart';
import 'package:intravel/theme/text_style.dart';
import 'package:intravel/view/notification.dart';
import 'package:intravel/view/payment_infromation.dart';
import 'package:intravel/view/personal_information.dart';
import 'package:intravel/view/rating_page.dart';
import 'package:intravel/view/safety_screen.dart';

import '../model/myprofile_model.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  List<MyProfileModel> display_list = List.from(profileFieldList);

  _onItemTapped(int index) {
    switch (index) {
      case 0:
        return Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => PersonalInformationPage(),
            ));
      case 1:
        return Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => PaymentInformationPage(),
            ));
      case 2:
        return Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => SafetyScreen(),
            ));
      case 3:
        return Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => NotificationPage(),
            ));
      case 4:
        return Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => RatingPage(),
            ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.whiteColor.withOpacity(.1),
        elevation: 0,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
              weight: 700,
            )),
        centerTitle: true,
        title: const Text('My Profile', style: headingStyle),
      ),
      body: SafeArea(
          child: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: AssetImage('assets/images/zoro.jpg'))),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const <Widget>[
                      Text(
                        'Roronoa Zoro',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.w700),
                      ),
                      Text(
                        'zoro@gmail.com',
                        style: TextStyle(
                            color: Colors.black26,
                            fontSize: 11,
                            fontWeight: FontWeight.w600),
                      )
                    ],
                  )
                ],
              ),
            ),
            ListView.builder(
              itemCount: display_list.length,
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) => GestureDetector(
                onTap: () {
                  _onItemTapped(index);
                },
                child: CustomCard(
                  containerpadding: const EdgeInsets.only(top: 0, bottom: 0),
                  padding: const EdgeInsets.only(
                      top: 2, bottom: 2, left: 10, right: 10),
                  margin: EdgeInsets.only(
                      left: 20,
                      right: 20,
                      top: index == 0 ? 20 : 0,
                      bottom: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          display_list[index].icons ?? Icon(null),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            display_list[index].field ?? '',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.w500),
                          )
                        ],
                      ),
                      IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.arrow_forward_ios,
                            color: AppColors.primaryButtonColor,
                            size: 13,
                            weight: 700,
                          ))
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      )),
    );
  }
}
