import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:intravel/common/custom_card.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../model/safety_model.dart';
import '../theme/app_colors.dart';
import '../theme/text_style.dart';

class SafetyScreen extends StatefulWidget {
  const SafetyScreen({super.key});

  @override
  State<SafetyScreen> createState() => _SafetyScreenState();
}

class _SafetyScreenState extends State<SafetyScreen> {
  List<SafetyModel> display_list = List.from(safetylist);
  late YoutubePlayerController _controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    const url = 'https://www.youtube.com/watch?v=DcHN0CfIU0k';

    _controller = YoutubePlayerController(
        initialVideoId: YoutubePlayer.convertUrlToId(url)!,
        flags: const YoutubePlayerFlags(
            mute: false, loop: false, autoPlay: false));
  }

  @override
  void deactivate() {
    // TODO: implement deactivate
    super.deactivate();
    _controller.pause();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) => YoutubePlayerBuilder(
      player: YoutubePlayer(controller: _controller),
      builder: (context, player) => Scaffold(
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
            body: SizedBox(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin:
                          const EdgeInsets.only(left: 20, right: 20, top: 20),
                      height: 250,
                      clipBehavior: Clip.antiAlias,
                      width: MediaQuery.of(context).size.width,
                      child: player,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15)),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 20.0),
                      child: Text('Coronavirus Safety',
                          style: TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                              fontWeight: FontWeight.w700)),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 20.0, right: 20, top: 10),
                      child: Text(
                          'Follow these easy steps to help prevent the spread of COVID-19',
                          style: TextStyle(
                              fontSize: 13,
                              color: Colors.black,
                              fontWeight: FontWeight.w500)),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      height: 250,
                      width: MediaQuery.of(context).size.width,
                      child: ListView.builder(
                        itemCount: display_list.length,
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) => CustomCard(
                          margin: EdgeInsets.only(
                              left: index == 0 ? 20 : 0,
                              right: index == display_list.length - 1 ? 20 : 10,
                              bottom: 10),
                          containerpadding: const EdgeInsets.all(0),
                          padding: const EdgeInsets.all(0),
                          child: SizedBox(
                            height: 250,
                            width: 150,
                            child: Column(
                              children: [
                                Container(
                                  height: 150,
                                  width: 250,
                                  clipBehavior: Clip.antiAlias,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.rectangle,
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(15),
                                          topRight: Radius.circular(15)),
                                      image: DecorationImage(
                                          image: AssetImage(
                                              display_list[index].image ?? ''),
                                          fit: BoxFit.contain)),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  display_list[index].safety ?? '',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 13,
                                      fontWeight: FontWeight.w600),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ));
}
