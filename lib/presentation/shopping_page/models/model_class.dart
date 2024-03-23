class Categories {
  String? img;
  String? txt;

  Categories({
    this.img,
    this.txt,
  });

  factory Categories.fromJson(Map<String, dynamic>? json) {
    if (json == null) {
      throw ArgumentError('json must not be null');
    }
    return Categories(
      img: json['img'] as String? ?? '',
      // Provide a default value if img is not present
      txt: json['txt'] as String? ?? '',
      // Provide a default value if txt is not present
    );
  }

  // Method to convert Products object to a map
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['img'] = img;
    data['txt'] = txt;
    return data;
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Categories && other.img == img && other.txt == txt;
  }

  @override
  int get hashCode {
    return img.hashCode ^ txt.hashCode;
  }
}
