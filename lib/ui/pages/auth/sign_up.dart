import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:yukminum_app/shared/themes/themes.dart';
import 'package:yukminum_app/ui/components/material.dart';

class SignUp extends StatelessWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FormAuth(
      title: 'Sign Up',
      onPressed: () {
        Navigator.pushReplacementNamed(context, '/sign-in');
      },
      hyperlinkAuth: () {
        Navigator.pop(context);
      },
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pushReplacementNamed(context, '/sign-in');
          },
        ),
        centerTitle: true,
        title: Column(
          children: const [
            SizedBox(height: 10),
            Text(
              'Sign Up',
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
      titleHyperlinkAuth: 'Sign In',
      children: <Widget>[
        Image.asset(
          'assets/images/sign-up.png',
          width: 92,
        ),
        Text(
          'Create an Account',
          style: interTitle.copyWith(
            fontSize: 24,
          ),
        ),
        const SizedBox(height: 49),
        // input full name
        SizedBox(
          height: 50,
          child: Theme(
            data: Theme.of(context).copyWith(
              colorScheme: ThemeData().colorScheme.copyWith(
                    primary: Colors.black,
                  ),
            ),
            child: TextFormField(
              decoration: const InputDecoration(
                contentPadding:
                    EdgeInsets.only(left: 8.0, bottom: 8.0, top: 8.0),
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.person_add),
                label: Text('Full Name'),
              ),
            ),
          ),
        ),
        const SizedBox(height: 20),
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
        const SizedBox(height: 20),
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
      ],
    );
  }
}
