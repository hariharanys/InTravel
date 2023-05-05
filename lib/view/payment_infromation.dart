import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:intravel/common/custom_card.dart';
import 'package:intravel/common/utils.dart';

import '../model/paymentinformation_model.dart';
import '../theme/app_colors.dart';
import '../theme/text_style.dart';

class PaymentInformationPage extends StatefulWidget {
  const PaymentInformationPage({super.key});

  @override
  State<PaymentInformationPage> createState() => _PaymentInformationPageState();
}

class _PaymentInformationPageState extends State<PaymentInformationPage> {
  int selectedIndex = 0;
  List<PaymentInformation> paymentInformationDash =
      List.from(paymentinformationList);
  List<PaymentHistoryCurrent> paymentHistoryCurrent =
      List.from(paymentHistoryCurrentList);
  List<PaymentHistoryPrevious> paymentHistoryPrevious =
      List.from(paymentHistoryPreviousList);
  List<PaymentHistoryAll> allPayment = List.from(allPaymentList);

  _getCurrentHistory() {
    return ListView.builder(
      itemCount: paymentHistoryCurrent.length,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      scrollDirection: Axis.vertical,
      itemBuilder: (context, index) => CustomCard(
        padding: const EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                      color: AppColors.primaryColor.withOpacity(.8),
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(10)),
                  child: paymentHistoryCurrent[index].icons,
                ),
                const SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      paymentHistoryCurrent[index].date ?? '',
                      style: const TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w600,
                        color: Colors.black26,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      paymentHistoryCurrentList[index].type ?? '',
                      style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                          color: Colors.black),
                    )
                  ],
                )
              ],
            ),
            Text(
              paymentHistoryCurrentList[index].amount ?? '',
              style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                  color: Colors.black),
            )
          ],
        ),
      ),
    );
  }

  _getPreviousHistory() {
    return ListView.builder(
      itemCount: paymentHistoryPrevious.length,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      scrollDirection: Axis.vertical,
      itemBuilder: (context, index) => CustomCard(
        padding: const EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                      color: AppColors.primaryColor.withOpacity(.8),
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(10)),
                  child: paymentHistoryPrevious[index].icons,
                ),
                const SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      paymentHistoryPrevious[index].date ?? '',
                      style: const TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w600,
                        color: Colors.black26,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      paymentHistoryPrevious[index].type ?? '',
                      style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                          color: Colors.black),
                    )
                  ],
                )
              ],
            ),
            Text(
              paymentHistoryPrevious[index].amount ?? '',
              style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                  color: Colors.black),
            )
          ],
        ),
      ),
    );
  }

  _getAllHistory() {
    return ListView.builder(
      itemCount: allPayment.length,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      scrollDirection: Axis.vertical,
      itemBuilder: (context, index) => CustomCard(
        padding: const EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                      color: AppColors.primaryColor.withOpacity(.8),
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(10)),
                  child: allPayment[index].icons,
                ),
                const SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      allPayment[index].date ?? '',
                      style: const TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w600,
                        color: Colors.black26,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      allPayment[index].type ?? '',
                      style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                          color: Colors.black),
                    )
                  ],
                )
              ],
            ),
            Text(
              allPayment[index].amount ?? '',
              style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                  color: Colors.black),
            )
          ],
        ),
      ),
    );
  }

  _onItemTapped() {
    switch (selectedIndex) {
      case 0:
        return _getCurrentHistory();

      case 1:
        return _getPreviousHistory();

      case 2:
        return _getAllHistory();
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
        title: const Text('Payment Information', style: headingStyle),
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:
                    const EdgeInsets.only(left: 20.0, right: 20.0, top: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Text(
                          Utils.dateTime('dd'),
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w700),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(Utils.dateTime('MMM'),
                            style: const TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w700)),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(Utils.dateTime('y'),
                            style: const TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w700))
                      ],
                    ),
                    Container(
                      height: 35,
                      width: 35,
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black26),
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image: AssetImage('assets/images/zoro.jpg'))),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 250,
                width: MediaQuery.of(context).size.width,
                child: ListView.builder(
                  itemCount: paymentInformationDash.length,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => GestureDetector(
                    onTap: () {
                      selectedIndex = index;
                      setState(() {});
                    },
                    child: CustomCard(
                      margin: EdgeInsets.only(
                          left: index == 0 ? 20 : 0,
                          right: index == paymentInformationDash.length - 1
                              ? 20
                              : 10,
                          bottom: 10),
                      containerpadding: const EdgeInsets.all(0),
                      padding: const EdgeInsets.all(0),
                      child: Container(
                        height: 250,
                        width: 200,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: paymentInformationDash[index].color),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              paymentInformationDash[index].month ?? '',
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 20),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const Text(
                              'Total Amount',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              paymentInformationDash[index].amount ?? '',
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 20),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 20.0, top: 20),
                child: Text(
                  'History',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                      fontSize: 24),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
                child: _onItemTapped(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
