import 'package:flutter/material.dart';
import 'package:quickservtablemanagement/fetaures/authentication/presentation/screens/login_screen.dart';
import 'package:quickservtablemanagement/fetaures/tablemanagement/presentation/screens/table_homescreen.dart';
import 'package:quickservtablemanagement/services/shared_preference_helper.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  double _opacity = 0.0;

  @override
  void initState() {
    super.initState();
    // Fade animation after first frame
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        _opacity = 1.0;
      });
    });

    _navigateNext();
    // // Start fade-in animation
    // Future.delayed(const Duration(milliseconds: 100), () {
    //   setState(() {
    //     _opacity = 1.0;
    //   });
    // });

    // // Navigate to home screen after 2 seconds
    // Future.delayed(const Duration(seconds: 2), () {
    //   Navigator.pushReplacement(
    //     context,
    //     MaterialPageRoute(builder: (_) => LoginScreen()),
    //   );
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          Colors.white, // you can replace with AppColors.white if defined
      body: Center(
        child: AnimatedOpacity(
          opacity: _opacity,
          duration: const Duration(milliseconds: 600),
          curve: Curves.easeInOut,
          child: Image.asset(
            "assets/icons/quikservlogo.png",
            fit: BoxFit.contain,
            width: 150, // optional, adjust size
          ),
        ),
      ),
    );
  }

  Future<void> _navigateNext() async {
    final sharedPrefHelper = SharedPreferenceHelper();
    final token = await sharedPrefHelper.getToken();

    // Keep splash for 1.2 seconds
    await Future.delayed(const Duration(milliseconds: 1200));

    if (!mounted) return;

    final shouldGoHome = token != null && token.isNotEmpty;

    Navigator.pushReplacement(
      context,
      PageRouteBuilder(
        transitionDuration: const Duration(milliseconds: 400),
        pageBuilder: (_, __, ___) =>
            shouldGoHome ? TableHomescreen() : LoginScreen(),
        transitionsBuilder: (_, animation, __, child) {
          return FadeTransition(opacity: animation, child: child);
        },
      ),
    );
  }
}
