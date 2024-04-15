import 'package:dart_furniture_store_app/services/sessionManager.dart';
import 'package:dart_furniture_store_app/utils/utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'dart:io';
import 'dart:core';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';

import '../utils/Route/Route name.dart';


class ProfileProvider with ChangeNotifier {
  final DatabaseReference _databaseRef = FirebaseDatabase.instance.ref('user');
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;
  final picker = ImagePicker();

  bool _loading = false;

  bool get loading => _loading;

  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  File? _image;

  File? get image => _image;

  Future<void> getGalleryImage() async {
    final PickedFile = await picker.pickImage(
        source: ImageSource.gallery, imageQuality: 100);

    if (PickedFile != null) {
      _image = File(PickedFile.path);
      notifyListeners();
    } else {
      const Text('No image Selected');
    }
  }

  Future<void> uploadImage() async {
    setLoading(true);
    Reference ref = _storage.ref().child(
        '/ProfilePicture/${SessionManager().userId.toString()}');

    try {
      UploadTask uploadTask = ref.putFile(_image!);

      TaskSnapshot snapshot = await uploadTask.whenComplete(() => null);

      String downloadUrl = await snapshot.ref.getDownloadURL();

      await _databaseRef.child('Profile').set(downloadUrl);
      if (kDebugMode) {
        print('Image uploaded successfully.');
      }
      setLoading(false);
    } catch (error) {
      if (kDebugMode) {
        print('Error uploading image: $error');
      }
      setLoading(false);
    }


  }

  void logout(BuildContext context) async {
    setLoading(true);
    try {
      await _auth.signOut().then((value) {
        Navigator.pushNamed(context, RouteName.splashScreen2);
        Utils.toastMessage('Logout Successful');
        setLoading(false);
      }).onError((error, stackTrace) {
        Utils.toastMessage(error.toString());
        setLoading(false);
      });
    } catch (e) {
      Utils.toastMessage(e.toString());
      setLoading(false);
    }
  }
}
