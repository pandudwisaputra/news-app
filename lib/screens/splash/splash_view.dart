import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/app.dart';
import 'package:news_app/screens/home/home_screen.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> with TickerProviderStateMixin {
  double size = 150;
  bool isFirstTime = true;

  late final AnimationController _animationController = AnimationController(
    duration: const Duration(seconds: 1),
    vsync: this,
  );

  late final Animation<Offset> _offsetAnimation = Tween<Offset>(
    begin: const Offset(0.0, 5.0),
    end: Offset.zero,
  ).animate(CurvedAnimation(
    parent: _animationController,
    curve: Curves.linear,
  ));

  @override
  void initState() {
    init();

    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  Future<void> init() async {
    await Future.delayed(const Duration(seconds: 4));
    setState(() {
      size = 200;
      isFirstTime = false;
    });
    _animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                color: Colors.transparent,
                child: AnimatedSize(
                  curve: Curves.easeIn,
                  duration: isFirstTime
                      ? const Duration(microseconds: 1)
                      : const Duration(milliseconds: 500),
                  child: Image.asset(
                    'assets/launcher_icon.png',
                    width: size,
                  ),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              AnimatedBuilder(
                  animation: _animationController,
                  builder: (context, child) {
                    return SlideTransition(
                      position: _offsetAnimation,
                      child: Column(
                        children: [
                          Text(
                            "News App",
                            style:
                                Theme.of(context).textTheme.bodyLarge!.copyWith(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 24,
                                    ),
                          ),
                          const SizedBox(
                            height: 50,
                          ),
                          Container(
                            padding: const EdgeInsets.only(
                              top: 123,
                              bottom: 79,
                            ),
                            decoration: const BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  Colors.transparent,
                                  Color(0xff717171),
                                  Color(0xff717171),
                                ],
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 52,
                              ),
                              child: ElevatedButton(
                                onPressed: () {
                                  Navigator.pushAndRemoveUntil(
                                    context,
                                    CupertinoPageRoute(
                                      builder: (context) => const HomeScreen(),
                                    ),
                                    (route) => false,
                                  );
                                },
                                style: ElevatedButton.styleFrom(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 12,
                                  ),
                                  minimumSize: const Size(double.infinity, 0),
                                  elevation: 0,
                                  backgroundColor: primaryColor,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                ),
                                child: Text(
                                  'Get Start',
                                  style: interWhiteTextStyle.copyWith(
                                    fontFamily: 'Inter',
                                    color: Colors.white,
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
