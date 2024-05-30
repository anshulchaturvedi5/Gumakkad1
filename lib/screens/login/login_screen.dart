import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:ghumakkad_2/screens/bottombar.dart';
import 'package:ghumakkad_2/utils/showSnackBar.dart';
import 'package:ghumakkad_2/widgets/home_app_bar.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircleAvatar(
              radius: 100,
              backgroundColor: Colors.white,
              backgroundImage: AssetImage("assets/ghumakkad.png"),
            ),
            const SizedBox(height: 15),
            const Text(
              "Ghumakkad",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 100),
            InkWell(
              onTap: () {
                authenticateWithGoogle(context: context);
              },
              child: SizedBox(
                width: 230,
                height: 70,
                child: Card(
                  elevation: 5.0,
                  shape: RoundedRectangleBorder(
                    side: const BorderSide(width: 2.0),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image(
                        image: AssetImage("assets/google.png"),
                        width: 40,
                        height: 40,
                      ),
                      SizedBox(width: 5),
                      Text(
                        'Login with Google',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> authenticateWithGoogle({required BuildContext context}) async {
    try {
      final user = await signInWithGoogle();
      debugPrint('User: ${user?.displayName}');
      Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (context) => BottomBar()));
    } on NoGoogleAccountChosenException {
      return;
    } catch (e) {
      if (!context.mounted) return;
      showSnackBar(
        context,
        'An unkown error occurred!',
      );
    }
  }

  Future<User?> signInWithGoogle() async {
    try {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    if (googleUser == null) {
      throw const NoGoogleAccountChosenException();
    }

    final GoogleSignInAuthentication? googleAuth =
        await googleUser.authentication;

    final AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    print("HIII");
    print(credential);

    final userCredential =
        await FirebaseAuth.instance.signInWithCredential(credential);
    displayName = userCredential.user!.displayName!; // to store user name
    print(displayName);
    debugPrint('User: ${userCredential.user?.email}');
    return userCredential.user;
    // Navigator.of(context)
    //     .pushReplacement(MaterialPageRoute(builder: (context) => BottomBar()));
    } catch (error) {
      debugPrint("Error signing in with Google: $error");
      return null;
    }
  }
}

class NoGoogleAccountChosenException implements Exception {
  const NoGoogleAccountChosenException();
}
