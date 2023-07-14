import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'Screens/InsiderPage.dart';
import 'Screens/LoginPage.dart';
import 'Screens/HomePage.dart';
import 'Widgets/bottomNavigationBar.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initialization,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          // Firebase has been initialized
          // Check if the user is already signed in
          FirebaseAuth auth = FirebaseAuth.instance;
          if (auth.currentUser != null) {
            // Redirect the user to MainScreen
            return MaterialApp(
              home: MainScreen(),
            );
          } else {
            // User is not signed in, show the login page
            return GlobalLoaderOverlay(
              child: MaterialApp(
                // debugShowCheckedModeBanner: false,
                initialRoute: '/',
                routes: {
                  '/': (context) => LoginPage(),
                  'MainScreen': (context) => MainScreen(),
                  '/insider': (context) => InsiderPage(),
                },
              ),
            );
          }
        }
        // Firebase is still initializing, show a loading indicator or splash screen
        return CircularProgressIndicator();
      },
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    HomePage(),
    EverydayPage(),
    LuxePage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}

class EverydayPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Everyday Page'),
    );
  }
}

class LuxePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Luxe Page'),
    );
  }
}

class ProfilePage extends StatelessWidget {
  Future<void> signOut(BuildContext context) async {
    try {
      await FirebaseAuth.instance.signOut();
      // Navigate back to the login page
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => LoginPage(),
        ),
      );
    } catch (e) {
      // Handle sign-out error
      print('Error signing out: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 200,
        child: ElevatedButton(
          onPressed: () {
            signOut(context);
          },
          style: ElevatedButton.styleFrom(
            primary: const Color(0xFFff3f6c),
            textStyle: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          child: const Text('Sign Out'),
        ),
      ),
    );
  }
}
