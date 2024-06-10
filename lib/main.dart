import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'profile_card.dart';
import 'edit_profile_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String fullName = 'John Doe';
  String email = 'john.doe@example.com';
  String phoneNumber = '123-456-7890';
  String password = 'password123';
  String? profileImagePath;

  void _editProfile(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => EditProfilePage(
          fullName: fullName,
          email: email,
          phoneNumber: phoneNumber,
          password: password,
          onSave: (profileData) {
            setState(() {
              fullName = profileData['fullName']!;
              email = profileData['email']!;
              phoneNumber = profileData['phoneNumber']!;
              password = profileData['password']!;
            });
          },
        ),
      ),
    );
  }

  Future<void> _changeProfilePicture() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        profileImagePath = pickedFile.path;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Custom Profile Card'),
        ),
        body: Center(
          child: Builder(
            builder: (context) => ProfileCard(
              fullName: fullName,
              email: email,
              phoneNumber: phoneNumber,
              password: password,
              onEdit: () => _editProfile(context),
              onChangePicture: _changeProfilePicture,
              profileImagePath: profileImagePath,
            ),
          ),
        ),
      ),
    );
  }
}
