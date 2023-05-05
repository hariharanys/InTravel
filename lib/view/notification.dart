import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:intravel/common/custom_card.dart';

import '../model/notification_model.dart';
import '../theme/app_colors.dart';
import '../theme/text_style.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  List<NotificationTodayModel> todayList = List.from(todayNotificationList);
  List<NotificationYesterdayModel> yestardayList =
      List.from(yestardayNotificationList);
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
        title: const Text('Notification', style: headingStyle),
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          physics: AlwaysScrollableScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 20.0, right: 20.0, top: 10),
                child: Text(
                  'Today',
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Colors.black),
                ),
              ),
              ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: todayList.length,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) => GestureDetector(
                  onTap: () {
                    todayList[index].isSelected = false;
                    setState(() {});
                  },
                  child: CustomCard(
                    boxShadow: todayList[index].isSelected!
                        ? const BoxShadow(
                            color: Colors.black26,
                            spreadRadius: 1,
                            offset: Offset(2, 2),
                            // blurStyle: BlurStyle.normal,
                            blurRadius: 6.0,
                          )
                        : const BoxShadow(color: Colors.white),
                    margin: EdgeInsets.only(
                        left: 20,
                        right: 20,
                        top: index == 0 ? 20 : 0,
                        bottom: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 1.5,
                          child: Row(
                            children: [
                              Stack(
                                children: [
                                  Container(
                                    height: 60,
                                    width: 60,
                                    clipBehavior: Clip.antiAlias,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                            color: Colors.black45, width: .5),
                                        image: DecorationImage(
                                            image: AssetImage(
                                                todayList[index].image ?? ''))),
                                  ),
                                  Visibility(
                                    visible:
                                        todayList[index].isSelected ?? false,
                                    child: Positioned(
                                        right: 0,
                                        top: 10,
                                        child: Container(
                                          height: 10,
                                          width: 10,
                                          decoration: BoxDecoration(
                                              color: AppColors.primaryColor,
                                              shape: BoxShape.circle),
                                        )),
                                  )
                                ],
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Flexible(
                                child: Wrap(
                                  children: [
                                    Text(todayList[index].notification ?? '',
                                        style: normalStyle),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: Text(
                            todayList[index].time ?? '',
                            textAlign: TextAlign.end,
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 11,
                                fontWeight: FontWeight.w500),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 20.0, right: 20.0, top: 10),
                child: Text(
                  'Yesterday',
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Colors.black),
                ),
              ),
              ListView.builder(
                scrollDirection: Axis.vertical,
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: yestardayList.length,
                itemBuilder: (context, index) => GestureDetector(
                  onTap: () {
                    yestardayList[index].isSelected = false;
                    setState(() {});
                  },
                  child: CustomCard(
                    boxShadow: yestardayList[index].isSelected!
                        ? const BoxShadow(
                            color: Colors.black26,
                            spreadRadius: 1,
                            offset: Offset(2, 2),
                            // blurStyle: BlurStyle.normal,
                            blurRadius: 6.0,
                          )
                        : const BoxShadow(color: Colors.white),
                    margin: EdgeInsets.only(
                        left: 20,
                        right: 20,
                        top: index == 0 ? 20 : 0,
                        bottom: index == yestardayList.length - 1 ? 20 : 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 1.5,
                          child: Row(
                            children: [
                              Stack(
                                children: [
                                  Container(
                                    height: 60,
                                    width: 60,
                                    clipBehavior: Clip.antiAlias,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                            color: Colors.black45, width: .5),
                                        image: DecorationImage(
                                            image: AssetImage(
                                                yestardayList[index].image ??
                                                    ''))),
                                  ),
                                  Visibility(
                                    visible: yestardayList[index].isSelected ??
                                        false,
                                    child: Positioned(
                                        right: 0,
                                        top: 10,
                                        child: Container(
                                          height: 10,
                                          width: 10,
                                          decoration: BoxDecoration(
                                              color: AppColors.primaryColor,
                                              shape: BoxShape.circle),
                                        )),
                                  )
                                ],
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Flexible(
                                child: Wrap(
                                  children: [
                                    Text(
                                        yestardayList[index].notification ?? '',
                                        style: normalStyle),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: Text(
                            yestardayList[index].time ?? '',
                            textAlign: TextAlign.end,
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 11,
                                fontWeight: FontWeight.w500),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
