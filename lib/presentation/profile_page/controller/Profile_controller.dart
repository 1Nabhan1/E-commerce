import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../../sign_up_screen/models/Signup_model/model_signup.dart';

class ProfileController extends GetxController {
  User? user = FirebaseAuth.instance.currentUser;
  UserModel loggedInUser = UserModel();

  @override
  void onInit() async {
    super.onInit();
    if (user != null) {
      try {
        DocumentSnapshot snapshot = await FirebaseFirestore.instance
            .collection("users")
            .doc(user!.uid)
            .get();

        if (snapshot.exists) {
          loggedInUser = UserModel.fromMap(snapshot.data()!);
          update(); // Notify GetX to update UI
        } else {
          print('User data does not exist');
        }
      } catch (e) {
        print('Error fetching user data: $e');
      }
    } else {
      print('User is not authenticated');
    }
    update();
  }
}
