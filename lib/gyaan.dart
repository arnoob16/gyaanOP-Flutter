class Gyaans {
  String status;
  String error;
  int totalResults;
  List<Gyaan> gyaans;

  Gyaans({this.status, this.gyaans});

  Gyaans.fromJson(Map<String, dynamic> gyaanJson)
      : status = gyaanJson['status'],
        gyaans = List.from(gyaanJson['articles'])
            .map((gyaan) => Gyaan.fromJson(gyaan))
            .toList(),
        totalResults = gyaanJson['total'],
        error = gyaanJson['error'];
}

class Gyaan {
  String author;
  String headline;
  String description;
  String url;
  String imageUrl;

  Gyaan.fromJson(Map<String, dynamic> gyaanJson)
      : author = gyaanJson['author'],
        headline = gyaanJson['title'].toString().trim(),
        description = gyaanJson['description'],
        url = gyaanJson['read_more'],
        imageUrl = gyaanJson['image'];
}
