class EventDataModel {

  static const String collectionName = "EventDataModel";
  final String eventId;
  final String eventTitle;
  final String eventImage;
  final String eventDescription;
  final String eventCategory;
  final DateTime eventDate;
  bool isFavorite;

  EventDataModel({required this.eventId,
    required this.eventTitle,
    required this.eventImage,
    required this.eventDescription,
    required this.eventCategory,
    required this.eventDate,
    this.isFavorite = false
  }
  );

  factory EventDataModel.fromFirestore(Map<String, dynamic> json) =>
      EventDataModel(
          eventId: json["eventId"],
          eventTitle: json["eventTitle"],
          eventImage: json["eventImage"],
          eventDescription: json["eventDescription"],
          eventCategory: json["eventCategory"],
          eventDate: DateTime.fromMillisecondsSinceEpoch(json["eventDate"]),
          isFavorite: json["isFavorite"],
      );

  //fun to convert the objects to json
  Map<String, dynamic> toFireStore() {
    return {
      "eventId": this.eventId,
      "eventTitle": this.eventTitle,
      "eventImage": this.eventImage,
      "eventDescription": this.eventDescription,
      "eventCategory": this.eventCategory,
      "eventDate": this.eventDate.millisecondsSinceEpoch,//to store it as int
      "isFavorite": this.isFavorite,
    };
  }
}
