import 'package:flutter/material.dart';
import 'package:yukminum_app/shared/themes/themes.dart';
import 'widget_btn_long.dart';

class FormAuth extends StatelessWidget {
  final String title;
  final String titleHyperlinkAuth;
  final Function() onPressed;
  final Function() hyperlinkAuth;
  final List<Widget>? children;
  final PreferredSizeWidget? appBar;

  const FormAuth({
    Key? key,
    required this.title,
    required this.onPressed,
    required this.hyperlinkAuth,
    required this.titleHyperlinkAuth,
    this.children,
    this.appBar,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: bgColorPrimary,
        appBar: appBar,
        body: Center(
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 20.5),
            children: [
              // Form
              Form(
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 35, vertical: 20),
                  margin: const EdgeInsets.only(
                    right: 10,
                    left: 10,
                    top: 19,
                  ),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(7.91)),
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromARGB(8, 0, 0, 0),
                        blurRadius: 9.89,
                      ),
                    ],
                  ),
                  // height: 409,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: children ?? <Widget>[Container()],
                  ),
                ),
              ),
              const SizedBox(height: 35),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.white,
                      elevation: 1,
                      padding: const EdgeInsets.all(18),
                    ),
                    onPressed: () {},
                    child: Image.asset('assets/images/facebook.png', width: 36),
                  ),
                  const SizedBox(width: 24),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.white,
                      elevation: 1,
                      padding: const EdgeInsets.all(18),
                    ),
                    onPressed: () {},
                    child: Image.asset('assets/images/google.png', width: 36),
                  )
                ],
              ),
              const SizedBox(height: 10),
              (title == 'Sign In')
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('Don’t have an account?'),
                        TextButton(
                          onPressed: () {
                            Navigator.pushReplacementNamed(context, '/sign-up');
                          },
                          child: const Text('Sign Up'),
                        ),
                      ],
                    )
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('Already have an account?'),
                        TextButton(
                          onPressed: () {
                            Navigator.pushReplacementNamed(context, '/sign-in');
                          },
                          child: const Text('Sign In'),
                        ),
                      ],
                    ),
              const SizedBox(height: 10),
              BtnLong(
                title: title,
                onPressed: onPressed,
              ),
              const SizedBox(height: 25),
            ],
          ),
        ),
      ),
    );
  }
}
