class EventDto {
  EventDto({
    required this.title,
    required this.eventImgUrl,
    required this.subTitle,
  });

  EventDto.fromJson(dynamic json) {
    title = json['title'];
    eventImgUrl = json['eventImgUrl'];
    subTitle = json['subTitle'];
  }
  late String title;
  late String eventImgUrl;
  late String subTitle;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['title'] = title;
    map['eventImgUrl'] = eventImgUrl;
    map['subTitle'] = subTitle;
    return map;
  }
}
