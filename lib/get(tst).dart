import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class Photo {
  final int albumId;
  final int id;
  final String title;
  final String url;
  final String thumbnailUrl;

  Photo({
    required this.albumId,
    required this.id,
    required this.title,
    required this.url,
    required this.thumbnailUrl,
  });

  factory Photo.fromJson(Map<String, dynamic> json) {
    return Photo(
      albumId: json['albumId'],
      id: json['id'],
      title: json['title'],
      url: json['url'],
      thumbnailUrl: json['thumbnailUrl'],
    );
  }
}

class HomeControllers extends GetxController {
  var photos = <Photo>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchData();
  }

  Future<void> fetchData() async {
    try {
      final response = await http
          .get(Uri.parse('https://jsonplaceholder.typicode.com/photos'));

      if (response.statusCode == 200) {
        final List<dynamic> jsonData = json.decode(response.body);
        final List<Photo> fetchedPhotos =
            jsonData.map((e) => Photo.fromJson(e)).toList();
        photos.value = fetchedPhotos;
      } else {
        throw Exception('Failed to fetch data');
      }
    } catch (e) {
      throw Exception('Failed to fetch data');
    }
  }
}

class HomePage extends StatelessWidget {
  final HomeControllers controller = Get.put(HomeControllers());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Photo Album'),
      ),
      body: Obx(
        () => ListView.builder(
          itemCount: controller.photos.length,
          itemBuilder: (context, index) {
            final photo = controller.photos[index];
            return ListTile(
              title: Text(photo.title),
              subtitle:
                  Text('Album ID: ${photo.albumId}, Photo ID: ${photo.id}'),
              leading: Image.network(photo.url),
              onTap: () {
                // Handle tap if needed
              },
            );
          },
        ),
      ),
    );
  }
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'JSONPlaceholder Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}
