import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_beginning/routes/app_routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../models/Signup_model/model_signup.dart';

class SignController extends GetxController {
  RxBool obscureText = true.obs;
  var isNameValid = false.obs;
  var isEmailValid = false.obs;
  var isPasswordValid = false.obs;
  final userNameControl = new TextEditingController();
  final emailAddressControl = new TextEditingController();

  // final residentialAddressControl = new TextEditingController();
  // final phoneNumberControl = new TextEditingController();
  final passwordControl = new TextEditingController();

  // final confirmPasswordControl = new TextEditingController();
  final formKey = GlobalKey<FormState>();

  void validateName(String value) {
    isNameValid.value = value.isNotEmpty;
  }

  void validateEmail(String value) {
    isEmailValid.value = value.contains('@gmail.com');
  }

  void validatePassword(String value) {
    isPasswordValid.value =
        value.length >= 0; // Add your password validation logic here
  }

  final auth = FirebaseAuth.instance;
  final password = ''.obs;

  String? ValidatePassword(String value) {
    if (value.length < 8) {
      return 'Password must be at least 8 characters long';
    }
    return null;
  }

  String? ValidateEmail(String value) {
    if (value.contains('@gmail.com')) {
      return null;
    }
    return 'E-Mail must contain @gmail.com';
  }

  void signUp(String email, String password) async {
    if (formKey.currentState!.validate()) {
      await auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) => {
                postDetailToFirestore(),
                Fluttertoast.showToast(msg: "Signin  Successfull"),
                Get.toNamed(AppRoutes.Bottomnav),
              })
          .catchError((e) {
        Fluttertoast.showToast(msg: e!.message);
      });
    }
  }

  Future<void> postDetailToFirestore() async {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      try {
        UserModel userModel = UserModel(
          emailAddress: user.email ?? '',
          uid: user.uid,
          userName: userNameControl.text,
          // Extract string value using .value
          password: passwordControl.text, // Extract string value using .value
        );

        await firebaseFirestore
            .collection("users")
            .doc(user.uid)
            .set(userModel.toMap());

        Fluttertoast.showToast(msg: "Account Created Successfully !");
        Get.toNamed(AppRoutes.Bottomnav);
      } catch (e) {
        Fluttertoast.showToast(msg: "Error: $e");
        print("Error posting data to Firestore: $e");
      }
    } else {
      Fluttertoast.showToast(msg: "User not authenticated");
      print("User not authenticated");
    }
  }

  signInWithGoogle() async {
    GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;
    AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken, idToken: googleAuth?.idToken);
    UserCredential userCredential =
        await FirebaseAuth.instance.signInWithCredential(credential);
    print(userCredential.user?.displayName);

    if (userCredential.user != null) {
      Get.toNamed(AppRoutes.Bottomnav);
    }
  }

  signInWithFacebook() async {
    try {
      // Trigger Facebook login
      final LoginResult result = await FacebookAuth.instance.login();

      // Check if login was successful
      if (result.status == LoginStatus.success) {
        // Get access token
        final AccessToken accessToken = result.accessToken!;

        // Get Facebook AuthCredential
        final OAuthCredential credential =
            FacebookAuthProvider.credential(accessToken.token);

        // Sign in with Firebase using Facebook AuthCredential
        UserCredential userCredential =
            await FirebaseAuth.instance.signInWithCredential(credential);

        // Print user's display name
        print(userCredential.user?.displayName);

        // Show welcome toast with the user's name
        Fluttertoast.showToast(
            msg: "Welcome, ${userCredential.user!.displayName}",
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.CENTER,
            backgroundColor: Colors.grey,
            textColor: Colors.white,
            fontSize: 16.0);

        // Navigate to your desired screen
        Get.toNamed(AppRoutes.Bottomnav);
      } else {
        // Handle login error
        print('Facebook login failed');
      }
    } catch (e) {
      // Handle exceptions
      print('Error during Facebook login: $e');
    }
  }
}
