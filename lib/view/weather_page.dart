import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:weather/weather.dart';
import 'package:geolocator/geolocator.dart';

import '../common/utils.dart';
import '../theme/app_colors.dart';
import '../theme/text_style.dart';

class WeatherPage extends StatefulWidget {
  const WeatherPage({super.key});

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  var latitude;
  var longitude;
  var place;
  var temprature;
  var humidity;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getCurrectLocation();
  }

  void _getCurrectLocation() async {
    await Geolocator.checkPermission();
    await Geolocator.requestPermission();
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    latitude = position.latitude;
    longitude = position.longitude;
    print(latitude);
    print(longitude);
    _getWeather();
  }

  void _getWeather() async {
    WeatherFactory wf = new WeatherFactory('0e402a118ba5433267d31591a50e7bce',
        language: Language.ENGLISH);
    Weather w = await wf.currentWeatherByLocation(latitude, longitude);
    place = w.areaName;
    temprature = w.temperature.toString().replaceAll('Celsius', '');
    humidity = w.humidity;
    List<Weather> forecast =
        await wf.fiveDayForecastByLocation(latitude, longitude);
    setState(() {});
    print(w.areaName);
    print(humidity);
    print(w.cloudiness);
    print(w.tempMax);
    print(w.country);
  }

  _getImages() {
    if (humidity > 25) {
      return AssetImage('assets/images/sunny.png');
    }
    if (humidity > 60) {
      return AssetImage('assets/images/rainy.png');
    }
    if (humidity > 50) {
      return AssetImage('assets/images/cloudy.png');
    }
  }

  @override
  Widget build(BuildContext context) {
    return place == '' || humidity == null
        ? Scaffold(
            body: SizedBox(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Center(child: CircularProgressIndicator())))
        : Scaffold(
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
              title: const Text('Weather Status', style: headingStyle),
            ),
            body: SizedBox(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                      height: 300,
                      width: 300,
                      margin: const EdgeInsets.only(left: 20, right: 20),
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          image: DecorationImage(
                              image: _getImages(), fit: BoxFit.cover)),
                      child: Container(
                        height: double.infinity,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(.3),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              place ?? '--',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700,
                                  letterSpacing: 1,
                                  fontSize: 17),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Text(
                              '${temprature ?? '--'}\u00B0C',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 35),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Text(Utils.dateTime('EEEE'),
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 18)),
                            const SizedBox(
                              height: 20,
                            ),
                            Text(
                              Utils.dateTime('dd/MM/yyy'),
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 20),
                            ),
                          ],
                        ),
                      )),
                ],
              ),
            ),
          );
  }
}
