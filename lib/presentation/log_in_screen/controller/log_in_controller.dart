import 'package:ecommerce_beginning/routes/app_routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LogController extends GetxController {
  var isEmailValid = false.obs;
  RxBool obscureText = true.obs;
  var isPasswordValid = false.obs;
  final formKey = GlobalKey<FormState>();

  final auth = FirebaseAuth.instance;

  final TextEditingController emailControl = new TextEditingController();
  final TextEditingController passwordControl = new TextEditingController();

  void validateEmail(String value) {
    isEmailValid.value = value.contains('@gmail.com');
  }

  String? ValidateEmail(String value) {
    if (value.contains('@gmail.com')) {
      return null;
    }
    return 'E-Mail must contain @gmail.com';
  }

  void validatePassword(String value) {
    isPasswordValid.value =
        value.length >= 0; // Add your password validation logic here
  }

  final password = ''.obs;

  String? ValidatePassword(String value) {
    if (value.length < 8) {
      return 'Password must be at least 8 characters long';
    }
    return null;
  }

  void login(String email, String password) async {
    if (formKey.currentState!.validate()) {
      await auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((uid) => {
                Fluttertoast.showToast(msg: "Login Successfull"),
                Get.toNamed(AppRoutes.Bottomnav),
              })
          .catchError((e) {
        Fluttertoast.showToast(msg: e!.message);
      });
    }
  }

  // Future<Map<String, dynamic>?> getUserData(String uid) async {
  //   DocumentSnapshot userSnapshot =
  //       await FirebaseFirestore.instance.collection('users').doc(uid).get();
  //
  //   if (userSnapshot.exists) {
  //     return userSnapshot.data() as Map<String, dynamic>;
  //   } else {
  //     return null;
  //   }
  // }

  signInWithGoogle() async {
    GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;
    AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken, idToken: googleAuth?.idToken);
    UserCredential userCredential =
        await FirebaseAuth.instance.signInWithCredential(credential);
    print(userCredential.user?.displayName);

    if (userCredential.user != null) {
      Fluttertoast.showToast(
          msg: "Welcome, ${userCredential.user!.displayName}",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.CENTER,
          backgroundColor: Colors.grey,
          textColor: Colors.white,
          fontSize: 16.0);
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
