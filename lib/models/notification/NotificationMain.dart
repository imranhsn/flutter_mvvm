import 'dart:convert';

NotificationMain moviesMainFromJson(String str) =>
    NotificationMain.fromJson(json.decode(str));

String moviesMainToJson(NotificationMain data) => json.encode(data.toJson());

class NotificationMain {
  NotificationMain({
    this.notifications,
  });

  List<NotificationModel>? notifications;

  factory NotificationMain.fromJson(Map<String, dynamic> json) =>
      NotificationMain(
        notifications: json["notifications"] == null
            ? null
            : List<NotificationModel>.from(json["notifications"]
                .map((x) => NotificationModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "notifications": notifications == null
            ? null
            : List<dynamic>.from(notifications!.map((x) => x.toJson())),
      };
}

class NotificationModel {
  NotificationModel({
    this.id,
    this.title,
    this.description,
    this.time,
    this.image,
    this.users,
  });

  String? id;
  String? title;
  String? description;
  String? time;
  String? image;
  List<String>? users;

  factory NotificationModel.fromJson(Map<String, dynamic> json) =>
      NotificationModel(
        id: json["id"] == null ? null : json["id"],
        title: json["title"] == null ? null : json["title"],
        description: json["description"] == null ? null : json["description"],
        time: json["time"] == null ? null : json["time"],
        image: json["image"] == null ? null : json["image"],
        users: json["users"] == null
            ? null
            : List<String>.from(json["users"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "title": title == null ? null : title,
        "description": description == null ? null : description,
        "time": time == null ? null : time,
        "image": image == null ? null : image,
        "users": users == null ? null : List<String>.from(users!.map((x) => x))
      };
}
