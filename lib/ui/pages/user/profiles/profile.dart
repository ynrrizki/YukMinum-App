import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:yukminum_app/message/snackbar.dart';
import 'package:yukminum_app/shared/themes/themes.dart';
import 'package:yukminum_app/ui/components/material.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  TextEditingController? _email;
  TextEditingController? _fName;
  AssetImage _image = AssetImage('assets/images/yanu.jpg');

  void setProfile() {
    setState(() {
      _email = _email;
      _fName = _fName;
      AnimatedSnackBar.material(
        updateSuccess,
        type: AnimatedSnackBarType.success,
        mobileSnackBarPosition: MobileSnackBarPosition.bottom,
        duration: const Duration(seconds: 4),
      ).show(context);
    });
  }

  @override
  void initState() {
    super.initState();
    _email = TextEditingController(text: 'yanuarrizki165@gmail.com');
    _fName = TextEditingController(text: 'Yanuar Rizki Sanjaya');
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Container(
        color: bgColorPrimary,
        child: ListView(
          children: [
            Container(
              height: 200,
              padding: const EdgeInsets.all(0),
              width: MediaQuery.of(context).size.width,
              color: Colors.white,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () async {
                      await showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            content: Container(
                              width: 200,
                              height: 250,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: _image,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    },
                    child: Container(
                      padding: const EdgeInsets.all(2),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey, width: 3),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(100),
                        ),
                      ),
                      child: CircleAvatar(
                        backgroundImage: _image,
                        backgroundColor: Colors.black,
                        radius: 40,
                        child: (_image == null)
                            ? Text(
                                'Y',
                                style: GoogleFonts.inter(
                                    fontSize: 40, color: Colors.white),
                              )
                            : null,
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  Text(
                    _fName!.text,
                    style: interTitle.copyWith(
                      fontSize: 17,
                    ),
                  ),
                  Text(
                    _email!.text,
                    style: GoogleFonts.inter(
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
              child: Column(
                children: [
                  SizedBox(
                    height: 50,
                    child: Theme(
                      data: Theme.of(context).copyWith(
                        colorScheme: ThemeData().colorScheme.copyWith(
                              primary: Colors.black,
                            ),
                      ),
                      child: TextFormField(
                        controller: _fName,
                        decoration: const InputDecoration(
                          contentPadding:
                              EdgeInsets.only(left: 8.0, bottom: 8.0, top: 8.0),
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.person),
                          label: Text('Full Name'),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 50),
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
                        enabled: false,
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
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: BtnLong(
                onPressed: () {
                  setProfile();
                },
                title: 'Save',
              ),
            ),
            const SizedBox(height: 50),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: BtnLong(
                onPressed: () async {
                  return await showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text("Confirm"),
                        content: const Text("Are you sure you want to logout?"),
                        actions: <Widget>[
                          ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: Colors.red,
                              ),
                              onPressed: () => Navigator.of(context)
                                  .pushNamedAndRemoveUntil(
                                      '/sign-in', (route) => false),
                              child: const Text("Yes")),
                          ElevatedButton(
                            onPressed: () => Navigator.of(context).pop(false),
                            child: const Text("CANCEL"),
                          ),
                        ],
                      );
                    },
                  );
                },
                title: 'Logout',
                color: Colors.red,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
