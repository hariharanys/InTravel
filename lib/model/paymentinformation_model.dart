import 'package:flutter/material.dart';
import 'package:intravel/theme/app_colors.dart';

//current payment history model

class PaymentInformation {
  String? month;
  String? amount;
  Color? color;

  PaymentInformation({this.month, this.amount, this.color});
}

final PaymentInformation currentMonth = PaymentInformation(
    month: 'May', amount: '\$ 25000', color: AppColors.primaryColor);
final PaymentInformation previousMonth = PaymentInformation(
    month: 'Previous Month',
    amount: '\$ 70000',
    color: AppColors.primaryColor.withOpacity(.8));
final PaymentInformation allMonth = PaymentInformation(
    month: 'All',
    amount: '\$ 245000',
    color: AppColors.primaryColor.withOpacity(.5));

List<PaymentInformation> paymentinformationList = [
  currentMonth,
  previousMonth,
  allMonth
];

class PaymentHistoryCurrent {
  String? date;
  String? type;
  String? amount;
  Icon? icons;

  PaymentHistoryCurrent({this.date, this.type, this.amount, this.icons});
}

final PaymentHistoryCurrent currentpayment1 = PaymentHistoryCurrent(
    date: '01 MAY 2023',
    type: 'Shopping',
    amount: '\$20',
    icons: Icon(
      Icons.shopping_bag_outlined,
      color: AppColors.whiteColor,
      size: 20,
    ));

final PaymentHistoryCurrent currentpayment2 = PaymentHistoryCurrent(
    date: '03 MAY 2023',
    type: 'Foods',
    amount: '\$40',
    icons: Icon(
      Icons.food_bank_outlined,
      color: AppColors.whiteColor,
      size: 20,
    ));

final PaymentHistoryCurrent currentpayment3 = PaymentHistoryCurrent(
    date: '04 MAY 2023',
    type: 'Clothing',
    amount: '\$30',
    icons: Icon(
      Icons.how_to_vote_sharp,
      color: AppColors.whiteColor,
      size: 20,
    ));

final PaymentHistoryCurrent currentpayment4 = PaymentHistoryCurrent(
    date: '05 MAY 2023',
    type: 'Bike Insurance',
    amount: '\$10',
    icons: Icon(
      Icons.pedal_bike,
      color: AppColors.whiteColor,
      size: 20,
    ));

final PaymentHistoryCurrent currentpayment5 = PaymentHistoryCurrent(
    date: '07 MAY 2023',
    type: 'Banking',
    amount: '\$1200',
    icons: Icon(
      Icons.store_rounded,
      color: AppColors.whiteColor,
      size: 20,
    ));

final PaymentHistoryCurrent currentpayment6 = PaymentHistoryCurrent(
    date: '08 MAY 2023',
    type: 'Shopping',
    amount: '\$20',
    icons: Icon(
      Icons.shopping_bag_outlined,
      color: AppColors.whiteColor,
      size: 20,
    ));

final PaymentHistoryCurrent currentpayment7 = PaymentHistoryCurrent(
    date: '01 MAY 2023',
    type: 'Foods',
    amount: '\$20',
    icons: Icon(
      Icons.food_bank_outlined,
      color: AppColors.whiteColor,
      size: 20,
    ));

final PaymentHistoryCurrent currentpayment8 = PaymentHistoryCurrent(
    date: '10 MAY 2023',
    type: 'Shopping',
    amount: '\$20',
    icons: Icon(
      Icons.shopping_bag_outlined,
      color: AppColors.whiteColor,
      size: 20,
    ));

List<PaymentHistoryCurrent> paymentHistoryCurrentList = [
  currentpayment1,
  currentpayment2,
  currentpayment3,
  currentpayment4,
  currentpayment5,
  currentpayment6,
  currentpayment7,
  currentpayment8
];

//previous payment history model
class PaymentHistoryPrevious {
  String? date;
  String? type;
  String? amount;
  Icon? icons;

  PaymentHistoryPrevious({this.date, this.type, this.amount, this.icons});
}

final PaymentHistoryPrevious previouspayment1 = PaymentHistoryPrevious(
    date: '01 APR 2023',
    type: 'Travel',
    amount: '\$80',
    icons: Icon(
      Icons.shopping_bag_outlined,
      color: AppColors.whiteColor,
      size: 20,
    ));

final PaymentHistoryPrevious previouspayment2 = PaymentHistoryPrevious(
    date: '02 APR 2023',
    type: 'Foods',
    amount: '\$30',
    icons: Icon(
      Icons.food_bank_outlined,
      color: AppColors.whiteColor,
      size: 20,
    ));

final PaymentHistoryPrevious previouspayment3 = PaymentHistoryPrevious(
    date: '02 APR 2023',
    type: 'Transport',
    amount: '\$300',
    icons: Icon(
      Icons.how_to_vote_sharp,
      color: AppColors.whiteColor,
      size: 20,
    ));

final PaymentHistoryPrevious previouspayment4 = PaymentHistoryPrevious(
    date: '04 APR 2023',
    type: 'Bike Insurance',
    amount: '\$40',
    icons: Icon(
      Icons.shopping_bag_outlined,
      color: AppColors.whiteColor,
      size: 20,
    ));

final PaymentHistoryPrevious previouspayment5 = PaymentHistoryPrevious(
    date: '06 APR 2023',
    type: 'Shopping',
    amount: '\$120',
    icons: Icon(
      Icons.store_rounded,
      color: AppColors.whiteColor,
      size: 20,
    ));

final PaymentHistoryPrevious previouspayment6 = PaymentHistoryPrevious(
    date: '08 APR 2023',
    type: 'Banking',
    amount: '\$70',
    icons: Icon(
      Icons.pedal_bike,
      color: AppColors.whiteColor,
      size: 20,
    ));
final PaymentHistoryPrevious previouspayment7 = PaymentHistoryPrevious(
    date: '09 APR 2023',
    type: 'Foods',
    amount: '\$30',
    icons: Icon(
      Icons.food_bank_outlined,
      color: AppColors.whiteColor,
      size: 20,
    ));

final PaymentHistoryPrevious previouspayment8 = PaymentHistoryPrevious(
    date: '17 APR 2023',
    type: 'Shopping',
    amount: '\$200',
    icons: Icon(
      Icons.shopping_bag_outlined,
      color: AppColors.whiteColor,
      size: 20,
    ));

List<PaymentHistoryPrevious> paymentHistoryPreviousList = [
  previouspayment1,
  previouspayment2,
  previouspayment3,
  previouspayment4,
  previouspayment5,
  previouspayment6,
  previouspayment7,
  previouspayment8
];

//all payment history model

class PaymentHistoryAll {
  String? date;
  String? type;
  String? amount;
  Icon? icons;

  PaymentHistoryAll({this.date, this.type, this.amount, this.icons});
}

final PaymentHistoryAll allpayment1 = PaymentHistoryAll(
    date: '01 MAY 2023',
    type: 'Shopping',
    amount: '\$20',
    icons: Icon(
      Icons.shopping_bag_outlined,
      color: AppColors.whiteColor,
      size: 20,
    ));

final PaymentHistoryAll allpayment2 = PaymentHistoryAll(
    date: '03 MAY 2023',
    type: 'Foods',
    amount: '\$40',
    icons: Icon(
      Icons.food_bank_outlined,
      color: AppColors.whiteColor,
      size: 20,
    ));

final PaymentHistoryAll allpayment3 = PaymentHistoryAll(
    date: '04 MAY 2023',
    type: 'Clothing',
    amount: '\$30',
    icons: Icon(
      Icons.how_to_vote_sharp,
      color: AppColors.whiteColor,
      size: 20,
    ));

final PaymentHistoryAll allpayment4 = PaymentHistoryAll(
    date: '05 MAY 2023',
    type: 'Bike Insurance',
    amount: '\$10',
    icons: Icon(
      Icons.pedal_bike,
      color: AppColors.whiteColor,
      size: 20,
    ));

final PaymentHistoryAll allpayment5 = PaymentHistoryAll(
    date: '07 MAY 2023',
    type: 'Banking',
    amount: '\$1200',
    icons: Icon(
      Icons.store_rounded,
      color: AppColors.whiteColor,
      size: 20,
    ));

final PaymentHistoryAll allpayment6 = PaymentHistoryAll(
    date: '08 MAY 2023',
    type: 'Shopping',
    amount: '\$20',
    icons: Icon(
      Icons.shopping_bag_outlined,
      color: AppColors.whiteColor,
      size: 20,
    ));

final PaymentHistoryAll allpayment7 = PaymentHistoryAll(
    date: '01 MAY 2023',
    type: 'Foods',
    amount: '\$20',
    icons: Icon(
      Icons.food_bank_outlined,
      color: AppColors.whiteColor,
      size: 20,
    ));

final PaymentHistoryAll allpayment8 = PaymentHistoryAll(
    date: '10 MAY 2023',
    type: 'Shopping',
    amount: '\$20',
    icons: Icon(
      Icons.shopping_bag_outlined,
      color: AppColors.whiteColor,
      size: 20,
    ));

final PaymentHistoryAll allpayment9 = PaymentHistoryAll(
    date: '01 APR 2023',
    type: 'Travel',
    amount: '\$80',
    icons: Icon(
      Icons.shopping_bag_outlined,
      color: AppColors.whiteColor,
      size: 20,
    ));

final PaymentHistoryAll allpayment10 = PaymentHistoryAll(
    date: '02 APR 2023',
    type: 'Foods',
    amount: '\$30',
    icons: Icon(
      Icons.food_bank_outlined,
      color: AppColors.whiteColor,
      size: 20,
    ));

final PaymentHistoryAll allpayment11 = PaymentHistoryAll(
    date: '02 APR 2023',
    type: 'Transport',
    amount: '\$300',
    icons: Icon(
      Icons.how_to_vote_sharp,
      color: AppColors.whiteColor,
      size: 20,
    ));

final PaymentHistoryAll allpayment12 = PaymentHistoryAll(
    date: '04 APR 2023',
    type: 'Bike Insurance',
    amount: '\$40',
    icons: Icon(
      Icons.shopping_bag_outlined,
      color: AppColors.whiteColor,
      size: 20,
    ));

final PaymentHistoryAll allpayment13 = PaymentHistoryAll(
    date: '06 APR 2023',
    type: 'Shopping',
    amount: '\$120',
    icons: Icon(
      Icons.store_rounded,
      color: AppColors.whiteColor,
      size: 20,
    ));

final PaymentHistoryAll allpayment14 = PaymentHistoryAll(
    date: '08 APR 2023',
    type: 'Banking',
    amount: '\$70',
    icons: Icon(
      Icons.pedal_bike,
      color: AppColors.whiteColor,
      size: 20,
    ));
final PaymentHistoryAll allpayment15 = PaymentHistoryAll(
    date: '09 APR 2023',
    type: 'Foods',
    amount: '\$30',
    icons: Icon(
      Icons.food_bank_outlined,
      color: AppColors.whiteColor,
      size: 20,
    ));

final PaymentHistoryAll allpayment16 = PaymentHistoryAll(
    date: '17 APR 2023',
    type: 'Shopping',
    amount: '\$200',
    icons: Icon(
      Icons.shopping_bag_outlined,
      color: AppColors.whiteColor,
      size: 20,
    ));

List<PaymentHistoryAll> allPaymentList = [
  allpayment1,
  allpayment2,
  allpayment3,
  allpayment4,
  allpayment5,
  allpayment6,
  allpayment7,
  allpayment8,
  allpayment9,
  allpayment10,
  allpayment11,
  allpayment12,
  allpayment13,
  allpayment14,
  allpayment15,
  allpayment16
];
