import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_ui_firestore/firebase_ui_firestore.dart';


import '../constants.dart';
import '../size_config.dart';

class ProfilePicture extends StatelessWidget {
const ProfilePicture({Key? key, required this.size}) : super(key: key);

final double size; // Required size parameter
  @override
  Widget build(BuildContext context) {
    // Get the current user
    final user = FirebaseAuth.instance.currentUser;

    // Check if the user has a profile picture URL
    if (user != null && user.photoURL != null) {
      // If the user has a profile picture URL, display their profile picture
      return CircleAvatar(
        backgroundImage: NetworkImage(user.photoURL!),
      );
    } else {
      // If the user does not have a profile picture URL, display a random picture
      return CircleAvatar(
        backgroundColor: Colors.lightBlue, // Placeholder color
        radius: size/2,
        // child: Icon(Icons.person_2_rounded, size: size/2,), // Placeholder icon
        child: Image.asset('assets/images/jetha.png', height: size, width: size,),
      );
    }
  }
}
//
// class ProfilePicture extends StatefulWidget {
//   const ProfilePicture({Key? key, this.size = 100}) : super(key: key);
//
//   final double size;
//
//   @override
//   _ProfilePictureState createState() => _ProfilePictureState();
// }
//
// class _ProfilePictureState extends State<ProfilePicture> {
//   late String? _photoURL;
//
//   @override
//   void initState() {
//     super.initState();
//     _photoURL = FirebaseAuth.instance.currentUser?.photoURL;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     if (_photoURL != null) {
//       return GestureDetector(
//         onTap: _pickImage,
//         child: CircleAvatar(
//           backgroundImage: NetworkImage(_photoURL!),
//           radius: widget.size / 2,
//         ),
//       );
//     } else {
//       return GestureDetector(
//         onTap: _pickImage,
//         child: CircleAvatar(
//           backgroundColor: Colors.lightBlue,
//           radius: widget.size / 2,
//           child: Icon(Icons.person, size: widget.size / 2),
//         ),
//       );
//     }
//   }
//
//   Future<void> _pickImage() async {
//     final picker = ImagePicker();
//     final pickedFile = await picker.getImage(source: ImageSource.gallery);
//     if (pickedFile != null) {
//       final user = FirebaseAuth.instance.currentUser;
//       if (user != null) {
//         final storage = FirebaseStorage.instance;
//         final reference = storage.ref().child('profile_pictures/${user.uid}');
//         final uploadTask = reference.putFile(File(pickedFile.path));
//         await uploadTask.whenComplete(() {});
//
//         final downloadURL = await reference.getDownloadURL();
//
//         await FirebaseFirestore.instance
//             .collection('users')
//             .doc(user.uid)
//             .update({'profilePictureUrl': downloadURL});
//
//         setState(() {
//           _photoURL = downloadURL;
//         });
//       }
//     }
//   }
// }