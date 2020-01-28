
# FlutterMeetupLund

Workshop for Flutter Meetup Lund

---

This project uses normal state management.

  

You can see the current look of the Screens

  

![Working Screenshot](/Screenshots/1_WorkingScreen.png)

  

> inspiration from https://www.udemy.com/course/flutter-bootcamp-with-dart/

  
  

## Depend on SQFlite

Add the following dependencies to pubspec.yml and run “flutter packages get” command in the terminal.

> sqflite: ^1.1.6+3

> path_provider: ^1.2.0

  

## Firebase Setup

https://console.firebase.google.com/project/

  

>

 - [ ] Go to your Flutter app directory move the **google-services.json**
       file (that you just downloaded) into the **android/app** directory.
 - [ ] In your IDE or editor, open **android/ app/build.gradle** and add the
       following line as the last line in the file: 
   

> `apply plugin:    'com.google.gms.google-services'`

 - [ ] In this file **android/build.gradle** inside the buildscript tag, add a new
dependency:

    > 

    buildscript { 
    		    repositories { 
    		    // ... } 					
    		    dependencies { 
    		    // ... 
    		    classpath 'com.google.gms:google-services:4.3.2' // new 
    		    } 
    		    }

 - [ ] In add package reference to  **pubspec.yaml** 
 
 -`firebase_core: ^0.4.3+2`
  -`cloud_firestore: ^0.13.0+1`
