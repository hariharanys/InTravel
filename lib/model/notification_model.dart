class NotificationTodayModel {
  String? image;
  String? notification;
  String? time;
  bool? isSelected;
  NotificationTodayModel(
      {this.image, this.notification, this.time, this.isSelected});
}

final NotificationTodayModel todayNotification1 = NotificationTodayModel(
    image: 'assets/images/notification1.png',
    notification: 'There has been an accident ahead on your regular route.',
    time: 'now',
    isSelected: true);
final NotificationTodayModel todayNotification2 = NotificationTodayModel(
    image: 'assets/images/notification2.png',
    notification: 'There is a traffic jam ahead on your regular route. ',
    time: '02:30 pm',
    isSelected: true);
final NotificationTodayModel todayNotification3 = NotificationTodayModel(
    image: 'assets/images/notification4.png',
    notification: 'Severe weather is forecasted for your area.',
    time: '09:00 am',
    isSelected: true);

List<NotificationTodayModel> todayNotificationList = [
  todayNotification1,
  todayNotification2,
  todayNotification3
];

class NotificationYesterdayModel {
  String? image;
  String? notification;
  String? time;
  bool? isSelected;
  NotificationYesterdayModel(
      {this.image, this.notification, this.time, this.isSelected});
}

final NotificationYesterdayModel yesterdayNotification1 =
    NotificationYesterdayModel(
        image: 'assets/images/notification1.png',
        notification: 'There has been an accident ahead on your regular route.',
        time: '12:00 pm',
        isSelected: true);
final NotificationYesterdayModel yesterdayNotification2 =
    NotificationYesterdayModel(
        image: 'assets/images/notification2.png',
        notification: 'There is a traffic jam ahead on your regular route. ',
        time: '02:30 pm',
        isSelected: true);
final NotificationYesterdayModel yesterdayNotification3 =
    NotificationYesterdayModel(
        image: 'assets/images/notification4.png',
        notification: 'Severe weather is forecasted for your area.',
        time: '09:00 am',
        isSelected: true);
final NotificationYesterdayModel yesterdayNotification4 =
    NotificationYesterdayModel(
        image: 'assets/images/notification1.png',
        notification: 'There has been an accident ahead on your regular route.',
        time: '08:00 am',
        isSelected: true);
final NotificationYesterdayModel yesterdayNotification5 =
    NotificationYesterdayModel(
        image: 'assets/images/notification3.png',
        notification:
            ' A road block has been reported on your regular route. The blockage is expected to last for several hours.',
        time: '07 :30 am',
        isSelected: true);
final NotificationYesterdayModel yesterdayNotification6 =
    NotificationYesterdayModel(
        image: 'assets/images/notification4.png',
        notification: 'Severe weather is forecasted for your area.',
        time: '06:00 am',
        isSelected: true);
final NotificationYesterdayModel yesterdayNotification7 =
    NotificationYesterdayModel(
        image: 'assets/images/notification1.png',
        notification: 'There has been an accident ahead on your regular route.',
        time: '02:00 am',
        isSelected: true);
final NotificationYesterdayModel yesterdayNotification8 =
    NotificationYesterdayModel(
        image: 'assets/images/notification3.png',
        notification:
            ' A road block has been reported on your regular route. The blockage is expected to last for several hours.',
        time: '01:30 am',
        isSelected: true);
final NotificationYesterdayModel yesterdayNotification9 =
    NotificationYesterdayModel(
        image: 'assets/images/notification4.png',
        notification: 'Severe weather is forecasted for your area.',
        time: '12:00 am',
        isSelected: true);

List<NotificationYesterdayModel> yestardayNotificationList = [
  yesterdayNotification1,
  yesterdayNotification2,
  yesterdayNotification3,
  yesterdayNotification4,
  yesterdayNotification5,
  yesterdayNotification6,
  yesterdayNotification7,
  yesterdayNotification8,
  yesterdayNotification9
];
