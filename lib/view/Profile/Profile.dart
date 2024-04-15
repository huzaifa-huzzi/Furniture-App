import 'package:dart_furniture_store_app/Provider/ProfileProvider.dart';
import 'package:dart_furniture_store_app/Resources/ReusbaleRow.dart';
import 'package:dart_furniture_store_app/Resources/RoundButton.dart';
import 'package:dart_furniture_store_app/Resources/colors.dart';
import 'package:dart_furniture_store_app/view/NaveBar%20Drawer/NavBar.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:provider/provider.dart';
import 'package:dart_furniture_store_app/services/sessionManager.dart';

class Profile extends StatefulWidget {
  const  Profile({super.key,});

  @override
  State<Profile> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<Profile> {
  final ref  = FirebaseDatabase.instance.ref().child('user');
  final auth= FirebaseAuth.instance;
  bool loading = false;
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return SafeArea(
      child: Scaffold(
        drawer:const  NavBar(),
        appBar: AppBar(
          iconTheme:const  IconThemeData(color: AppColors.primaryColor),
        ),
        body: Column(
          children: [
            StreamBuilder(
              stream: SessionManager().isLoggedIn()
                  ? ref.child(SessionManager().userId.toString()).onValue
                  : const  Stream.empty(), // Use an empty stream if the user is not logged in
              builder: (context, AsyncSnapshot snapshot) {
                if (SessionManager().isLoggedIn()) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: LoadingIndicator(
                        indicatorType: Indicator.ballClipRotate,
                        colors: [AppColors.primaryColor],
                      ),
                    );
                  } else if (snapshot.hasError) {
                    debugPrint('Error fetching data: ${snapshot.error}');
                    return Text('Error: ${snapshot.error}');
                  } else if (!snapshot.hasData || snapshot.data == null) {
                    debugPrint('No data available');
                    return const Text('Data not available');
                  } else {
                    Map<dynamic, dynamic>? map =
                    snapshot.data!.snapshot.value as Map<dynamic, dynamic>?;

                    if (map != null) {
                      return Consumer<ProfileProvider>(
                        builder: (context, imagePicker, _) {
                          return Column(
                            children: [
                              Stack(
                                alignment: Alignment.bottomCenter,
                                children: [
                                  Center(
                                    child: GestureDetector(
                                      onTap: () => imagePicker.getGalleryImage(),
                                      child: Padding(
                                        padding: EdgeInsets.only(
                                            top: mediaQuery.size.height * 0.01),
                                        child: Column(
                                          children: [
                                            Stack(
                                              alignment: Alignment.bottomCenter,
                                              children: [
                                                CircleAvatar(
                                                  radius: 80,
                                                  backgroundColor: Colors.grey[300],
                                                  backgroundImage:
                                                  imagePicker.image != null
                                                      ? FileImage(imagePicker.image!)
                                                      : null,
                                                  child: imagePicker.image == null
                                                      ? const Icon(
                                                    Icons.camera_alt,
                                                    size: 50,
                                                    color: AppColors.primaryColor,
                                                  )
                                                      : null,
                                                ),
                                                const Positioned(
                                                  bottom: 0,
                                                  child: SizedBox(
                                                    width: 50,
                                                    height: 50,
                                                    child: CircleAvatar(
                                                      backgroundColor:
                                                      AppColors.primaryColor,
                                                      child: Icon(Icons.add,
                                                          color: Colors.white),
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: mediaQuery.size.height * 0.06,),
                              ReusableRow(
                                title: 'Username',
                                value: map['username'],
                              ),
                              SizedBox(height: mediaQuery.size.height * 0.06,),
                              ReusableRow(
                                title: 'Email',
                                value: map['email'],
                              ),
                            ],
                          );
                        },
                      );
                    } else {
                      debugPrint('Data is null');
                      return const Text('Data is null');
                    }
                  }
                } else {
                  return Center(
                    child: ElevatedButton(
                      onPressed: () {
                        // Navigate to login screen
                      },
                      child: const  Text('Login'),
                    ),
                  );
                }
              },
            ),

            SizedBox(height: mediaQuery.size.height * 0.04,),
            Consumer<ProfileProvider>(builder: (context, imagePicker, _){
              return   RoundButton(title: 'Logout',loading: imagePicker.loading ,onTap: (){
                         imagePicker.logout(context);
                  },
                );
            }),
          ],
        ),
      ),
    );
  }
}
