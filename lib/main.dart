import 'package:flutter/material.dart';
import 'package:petsnurseryapp/screens/home/splashscreenloggedin.dart';
import 'package:petsnurseryapp/screens/login/splash_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthService().user,
      child: ChangeNotifierProvider(
        create: (context) => CoffeeOrderList(),
        child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Pet\'s Nursery',
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            home: Wrapper(),
            routes: <String, WidgetBuilder>{
              '/LoginScreen': (BuildContext context) => new LoginScreen(),
              '/LoggedInScreen': (BuildContext context) => new PetsList(),
              '/RegistrationScreen': (BuildContext context) =>
                  new RegistrationScreen(),
              '/PetDetailScreen': (BuildContext context) => new PetDetails(),
            }),
      ),
    );
  }
}

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    if (user == null) {
      return SplashScreen();
    } else {
      return SplashScreenLoggedIn();
    }
  }
}
