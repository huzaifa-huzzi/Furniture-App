import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SessionManager {
  static final SessionManager _session = SessionManager._internal();

  String? userId;

  // Stream controller for profile picture URL
  StreamController<String> _profilePictureController = StreamController<String>.broadcast();

  factory SessionManager() {
    return _session;
  }

  SessionManager._internal();

  Future<void> init() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    userId = prefs.getString('userId');
  }

  // Set the user ID after login
  Future<void> setUser(String userId) async {
    this.userId = userId;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('userId', userId);
  }

  // Get the user ID
  String? getUser() {
    return userId;
  }

  // Check if a user is logged in
  bool isLoggedIn() {
    return userId != null;
  }

  // Clear user session (logout)
  Future<void> clearUser() async {
    userId = null;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('userId');
  }


  Stream<String> profilePictureUrlStream() {
    return _profilePictureController.stream;
  }


  void updateProfilePictureUrl(String? url) {
    debugPrint('New profile picture URL: $url');
    _profilePictureController.add(url ?? '');
  }


  void dispose() {
    _profilePictureController.close();
  }
}
