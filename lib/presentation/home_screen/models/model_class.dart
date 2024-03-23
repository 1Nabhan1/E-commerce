import 'package:get/get.dart';

class Products {
  String img;
  String txt;
  int price;
  double str_rat;
  int rew_count;
  RxInt counter;

  Products(
      {required this.rew_count,
      required this.img,
      required this.txt,
      required this.price,
      required this.str_rat,
      required this.counter});

  factory Products.fromJson(Map<String, dynamic>? json) {
    if (json == null) {
      throw ArgumentError('json must not be null');
    }
    return Products(
      rew_count: json['rew_count'] as int? ?? 0,
      // Provide a default value if rew_count is not present
      img: json['img'] as String? ?? '',
      // Provide a default value if img is not present
      txt: json['txt'] as String? ?? '',
      // Provide a default value if txt is not present
      price: json['price'] as int? ?? 0,
      // Provide a default value if price is not present
      str_rat: json['str_rat'] as double? ?? 0.0,
      counter: 1.obs,
      // Provide a default value if str_rat is not present
    );
  }

  // Method to convert Products object to a map
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['img'] = img;
    data['txt'] = txt;
    data['price'] = price;
    data['str_rat'] = str_rat;
    data['rew_count'] = rew_count;
    return data;
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Products &&
        other.img == img &&
        other.txt == txt &&
        other.price == price &&
        other.str_rat == str_rat &&
        other.rew_count == rew_count;
  }

  @override
  int get hashCode {
    return img.hashCode ^
        txt.hashCode ^
        price.hashCode ^
        str_rat.hashCode ^
        rew_count.hashCode;
  }
}
