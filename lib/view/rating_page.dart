import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:intravel/common/custom_card.dart';

import '../theme/app_colors.dart';
import '../theme/text_style.dart';

class RatingPage extends StatefulWidget {
  const RatingPage({super.key});

  @override
  State<RatingPage> createState() => _RatingPageState();
}

class _RatingPageState extends State<RatingPage> {
  _onClick() {
    Navigator.pop(context);
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(
        'Thank You for your feedback!',
      ),
      backgroundColor: Colors.green.shade700,
    ));
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
        title: const Text('Rate Us', style: headingStyle),
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 20.0, right: 20.0),
                  child: Text(
                    'How did you like our InTravel App?',
                    style: TextStyle(
                        color: Colors.black54,
                        fontSize: 22,
                        fontWeight: FontWeight.w400),
                  ),
                ),
                const SizedBox(
                  height: 60,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () => _onClick(),
                        child: CustomCard(
                          padding: EdgeInsets.zero,
                          containerpadding: EdgeInsets.zero,
                          child: Column(
                            children: [
                              Container(
                                height: 170,
                                width: 170,
                                clipBehavior: Clip.antiAlias,
                                decoration: const BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(15),
                                        topRight: Radius.circular(15)),
                                    image: DecorationImage(
                                        image: AssetImage(
                                            'assets/images/sadEmoji.png'),
                                        fit: BoxFit.fill)),
                              ),
                              const Padding(
                                padding:
                                    EdgeInsets.only(top: 8.0, bottom: 35.0),
                                child: Text(
                                  'Meh!',
                                  style: headingStyle,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      GestureDetector(
                        onTap: () => _onClick(),
                        child: CustomCard(
                          padding: EdgeInsets.zero,
                          containerpadding: EdgeInsets.zero,
                          child: Column(
                            children: [
                              Container(
                                height: 170,
                                width: 170,
                                clipBehavior: Clip.antiAlias,
                                decoration: const BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(15),
                                        topRight: Radius.circular(15)),
                                    image: DecorationImage(
                                        image: AssetImage(
                                            'assets/images/happyEmoji.png'),
                                        fit: BoxFit.fill)),
                              ),
                              const Padding(
                                padding:
                                    EdgeInsets.only(top: 8.0, bottom: 35.0),
                                child: Text(
                                  'Loved It!',
                                  style: headingStyle,
                                ),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
