import 'package:dart_furniture_store_app/Provider/FavouriteIcon/FavouriteIcon3.dart';
import 'package:dart_furniture_store_app/Provider/FavouriteIcon/FavouriteIconProvider.dart';
import 'package:dart_furniture_store_app/Provider/FavouriteIcon/FavouriteIconProvider2.dart';
import 'package:dart_furniture_store_app/Provider/ForgotPasswordProvider.dart';
import 'package:dart_furniture_store_app/Provider/LoginProvider.dart';
import 'package:dart_furniture_store_app/Provider/ProfileProvider.dart';
import 'package:dart_furniture_store_app/Provider/SinupProvider.dart';
import 'package:dart_furniture_store_app/Resources/colors.dart';
import 'package:dart_furniture_store_app/services/sessionManager.dart';
import 'package:dart_furniture_store_app/utils/Route/Route%20name.dart';
import 'package:dart_furniture_store_app/utils/Route/RoutesInitialzed.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:persistent_shopping_cart/persistent_shopping_cart.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await PersistentShoppingCart().init();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await SessionManager().init();
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return  MultiProvider(providers:[
      ChangeNotifierProvider(create: (_) => SignupProvider()),
      ChangeNotifierProvider(create: (_) => LoginProvider()),
      ChangeNotifierProvider(create: (_) => ForgotProvider()),
      ChangeNotifierProvider(create: (_) => ProfileProvider()),
      ChangeNotifierProvider(create: (_) => FavoriteModel()),
      ChangeNotifierProvider(create: (_) => FavoriteModel2()),
      ChangeNotifierProvider(create: (_) => FavoriteModel3()),
    ],
      child:GetMaterialApp(
        debugShowCheckedModeBanner: false,
        useInheritedMediaQuery: true,
        locale: DevicePreview.locale(context),
        builder: DevicePreview.appBuilder,
        title: 'Furniture Store',
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.white,
            brightness: Brightness.light,
          ),
          textTheme: TextTheme(
              displayLarge: GoogleFonts.montserrat(
                fontSize: 40,
                fontStyle: FontStyle.normal,
                color:Colors.white,
              ),
              displaySmall: GoogleFonts.montserrat(
                fontSize:25,
                color:AppColors.primaryColor,
                fontStyle:FontStyle.normal,
              ),
              displayMedium: GoogleFonts.montserrat(
                fontSize: 22,
                color:Colors.white,
                fontStyle:FontStyle.normal,
              ),
              titleLarge: GoogleFonts.montserrat(
                fontSize:28 ,
                fontStyle: FontStyle.normal,
                color:Colors.white,
              ),
              bodyMedium: GoogleFonts.poppins(
                  fontSize:30,
                  fontStyle:FontStyle.normal,
                  color:Colors.black
              ),
              bodySmall: GoogleFonts.poppins(
                fontSize:22,
                fontStyle:FontStyle.normal,
                color:Colors.grey,
              ),
            titleSmall: GoogleFonts.montserrat(
              fontSize:35,
              color:Colors.black,
              fontStyle:FontStyle.italic,
            ),
              titleMedium: GoogleFonts.montserrat(
              fontSize:25,
                color:Colors.black,
                fontStyle:FontStyle.normal,
          )
          ),
        ),
        initialRoute: RouteName.splashScreen,
        onGenerateRoute: Routes.generateRoute,
      ),
    );
  }
}
