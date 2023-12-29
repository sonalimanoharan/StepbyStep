import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trail2/firebase_options.dart';
import 'package:trail2/src/features/authentication/screens/dashboard_client/dashboardclient.dart';
import 'package:trail2/src/features/authentication/screens/dashboard_user%20copy/dashboard.dart';
import 'package:trail2/src/repository/authentication_repository/authentication_repository.dart';
import 'package:trail2/src/utils/theme/theme.dart';
import 'package:trail2/src/features/authentication/screens/splash_screen/splash_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform)
      .then((value) => Get.put(AuthenticationRepository()));

  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: TAppTheme.lightTheme,
      darkTheme: TAppTheme.darkTheme,
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
      defaultTransition: Transition.leftToRightWithFade,
      transitionDuration: const Duration(milliseconds: 500),
      home: Dashboard(),
    );
  }
}
