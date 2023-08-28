## SETUP Firebase App
1. Install Flutter Fire CLI (https://firebase.google.com/docs/cli#setup_update_cli)
2. Setup our flutter app with firebase by using flutterfire setup command or manually setup the project in firebase console (https://firebase.google.com/docs/flutter/setup?platform=ios)
3. Make sure firebase_options.dart is created
4. To integrate firebase into flutter project, add the firebase_core package and other firebase package that we need (ex: firestore, firebase auth)
5. Add below code 
  // await Firebase.initializeApp(
  //     options: DefaultFirebaseOptions.currentPlatform,
  // );

# If you encounter errors, please check:
1. The package version that we use
2. Android Studio/Xcode version
Check whether the package current version is support by the IDE version
- Tips: Try to googling the package and check the firebase ios or android platform SDK on that package version