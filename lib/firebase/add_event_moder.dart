class EventModel {
  static const String collectionName = 'events';
  String id;
  String title;
  String decription;
  String eventName;
  String eventImage;
  DateTime eventdateTime;
  String eventTime;
  bool isFav;
  String categoryId;

  EventModel({
    this.id = '',
    required this.title,
    required this.decription,
    required this.eventName,
    required this.eventdateTime,
    required this.eventImage,
    required this.eventTime,
    this.isFav = false,
    required this.categoryId,
  });

  EventModel.fromJson(Map<String, dynamic> data)
      : this(
          id: data['id'] ?? '',
          decription: data['des'] ?? '',
          eventdateTime:
              DateTime.fromMillisecondsSinceEpoch(data['event_date_time'] ?? 0),
          eventImage: data['event_image'] ?? '',
          eventName: data['event_name'] ?? '',
          eventTime: data['event_time'] ?? '',
          title: data['title'] ?? '',
          isFav: data['if_fav'] ?? false,
          categoryId: data['category_id'] ?? 'all',
        );

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'des': decription,
      'title': title,
      'event_name': eventName,
      'event_image': eventImage,
      'event_date_time': eventdateTime.millisecondsSinceEpoch,
      'event_time': eventTime,
      'if_fav': isFav,
      'category_id': categoryId,
    };
  }
}
