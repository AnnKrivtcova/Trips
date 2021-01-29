import 'dart:convert';

Client clientFromJson(String str) {
  final jsonData = json.decode(str);
  return Client.fromMap(jsonData);
}

String clientToJson(Client data) {
  final dyn = data.toMap();
  return json.encode(dyn);
}

class Client {
  int id;
  String description;
  String country;
  int days;
  int year;
  String timeOfYear;
  String timeOfYearPhoto;
  bool blocked;

  Client({
    this.id,
    this.description,
    this.country,
    this.days,
    this.blocked,
    this.timeOfYear,
    this.timeOfYearPhoto,
    this.year,
  });

  factory Client.fromMap(Map<String, dynamic> json) => new Client(
    id: json["id"],
    description: json["description"],
    country: json["country"],
    days: json["days"],
    timeOfYear: json["timeOfYear"],
    timeOfYearPhoto: json["timeOfYearPhoto"],
    year: json["year"],
    blocked: json["blocked"] == 1,
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "description": description,
    "country": country,
    "days" : days,
    "timeOfYear": timeOfYear,
    "timeOfYearPhoto": timeOfYearPhoto,
    "year": year,
    "blocked": blocked,
  };
}