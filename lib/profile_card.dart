import 'dart:io';
import 'package:flutter/material.dart';

class ProfileCard extends StatelessWidget {
  final String fullName;
  final String email;
  final String phoneNumber;
  final String password;
  final VoidCallback onEdit;
  final VoidCallback onChangePicture;
  final String? profileImagePath;

  ProfileCard({
    required this.fullName,
    required this.email,
    required this.phoneNumber,
    required this.password,
    required this.onEdit,
    required this.onChangePicture,
    this.profileImagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(20.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      elevation: 10,
      child: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            GestureDetector(
              onTap: onChangePicture,
              child: CircleAvatar(
                radius: 50,
                backgroundImage: profileImagePath != null
                    ? FileImage(File(profileImagePath!))
                    : AssetImage('assets/profile_picture.png') as ImageProvider,
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  fullName,
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
                SizedBox(),
                Icon(
                  Icons.check_circle,
                  color: Colors.green,
                  size: 22,
                ),
              ],
            ),
            SizedBox(height: 10),
            Text(
              email,
              style: TextStyle(fontSize: 16, color: Colors.grey[700]),
            ),
            SizedBox(height: 10),
            Text(
              phoneNumber,
              style: TextStyle(fontSize: 16, color: Colors.grey[700]),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: onEdit,
              child: Text('Edit Profile'),
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.blue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
