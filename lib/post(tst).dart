import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

// void main() {
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Update Data Example',
//       home: UpdateDataPage(),
//     );
//   }
// }

class UpdateDataPage extends StatefulWidget {
  @override
  _UpdateDataPageState createState() => _UpdateDataPageState();
}

class _UpdateDataPageState extends State<UpdateDataPage> {
  String _updateStatus = '';

  Future<void> updatePostData() async {
    final String apiUrl = 'https://jsonplaceholder.typicode.com';

    // Sample data for updating email and password
    Map<String, dynamic> updatedData = {
      'email': 'newemail@example.com',
      'password': 'newpassword'
    };

    try {
      // Fetching the existing data
      var response = await http.get(Uri.parse(apiUrl));
      if (response.statusCode == 200) {
        List<dynamic> posts = json.decode(response.body);

        // Updating email and password fields
        for (var post in posts) {
          post['email'] = updatedData['email'];
          post['password'] = updatedData['password'];
        }

        // Updating the data on the server
        var updateResponse = await http.put(
          Uri.parse(apiUrl),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(posts),
        );

        if (updateResponse.statusCode == 200) {
          setState(() {
            _updateStatus = 'Data updated successfully';
          });
        } else {
          setState(() {
            _updateStatus = 'Failed to update data';
          });
        }
      } else {
        setState(() {
          _updateStatus = 'Failed to fetch data';
        });
      }
    } catch (e) {
      setState(() {
        _updateStatus = 'Error: $e';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Update Data Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: updatePostData,
              child: Text('Update Data'),
            ),
            SizedBox(height: 20),
            Text(
              _updateStatus,
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
