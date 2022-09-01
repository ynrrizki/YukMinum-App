import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:yukminum_app/message/snackbar.dart';
import 'package:yukminum_app/shared/themes/themes.dart';
import 'package:yukminum_app/ui/components/material.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _pass = TextEditingController();

  void checkLogin() {
    if (_email.text == 'yanuarrizki165@gmail.com' && _pass.text == 'yanu123') {
      AnimatedSnackBar.material(
        signInSuccess,
        type: AnimatedSnackBarType.success,
        mobileSnackBarPosition: MobileSnackBarPosition.top,
        duration: const Duration(seconds: 4),
      ).show(context);
      Navigator.of(context)
          .pushNamedAndRemoveUntil('/user-pages', (route) => false);
    } else {
      AnimatedSnackBar.material(
        'Wrong Email or Password',
        type: AnimatedSnackBarType.error,
        mobileSnackBarPosition: MobileSnackBarPosition.top,
        duration: const Duration(seconds: 4),
      ).show(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return FormAuth(
      title: 'Sign In',
      onPressed: () {
        checkLogin();
        // AnimatedSnackBar.material(
        //   signInSuccess,
        //   type: AnimatedSnackBarType.success,
        //   mobileSnackBarPosition: MobileSnackBarPosition.bottom,
        //   duration: const Duration(seconds: 4),
        // ).show(context);
        // Navigator.pushReplacementNamed(context, '/user-pages');
      },
      hyperlinkAuth: () {
        Navigator.pushNamed(context, '/sign-up');
      },
      appBar: AppBar(
        centerTitle: true,
        title: Column(
          children: const [
            SizedBox(height: 10),
            Text(
              'Sign In',
            ),
          ],
        ),
        backgroundColor: bgColorPrimary,
        elevation: 0,
        titleTextStyle: GoogleFonts.inter(
          color: Colors.black,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      titleHyperlinkAuth: 'Sign Up',
      children: <Widget>[
        Image.asset(
          'assets/images/sign-in.png',
          width: 57,
        ),
        Text(
          'Welcome Back',
          style: interTitle.copyWith(
            fontSize: 24,
          ),
        ),
        const SizedBox(height: 49),
        // input email
        SizedBox(
          height: 50,
          child: Theme(
            data: Theme.of(context).copyWith(
              colorScheme: ThemeData().colorScheme.copyWith(
                    primary: Colors.black,
                  ),
            ),
            child: TextFormField(
              controller: _email,
              decoration: const InputDecoration(
                contentPadding:
                    EdgeInsets.only(left: 8.0, bottom: 8.0, top: 8.0),
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.email),
                label: Text('Email'),
              ),
            ),
          ),
        ),
        const SizedBox(height: 49),
        // input password
        SizedBox(
          height: 50,
          child: Theme(
            data: Theme.of(context).copyWith(
              colorScheme: ThemeData().colorScheme.copyWith(
                    primary: Colors.black,
                  ),
            ),
            child: TextFormField(
              controller: _pass,
              focusNode: FocusNode(),
              obscureText: true,
              decoration: const InputDecoration(
                contentPadding:
                    EdgeInsets.only(left: 8.0, bottom: 8.0, top: 8.0),
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.lock_outlined),
                label: Text('Password'),
              ),
            ),
          ),
        ),
        const SizedBox(height: 15),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            TextButton(
              onPressed: () {},
              child: Text(
                'Forgot Password?',
                style: GoogleFonts.inter(
                  color: Colors.black,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
