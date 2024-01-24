# chat_application

## Architecture

chat_application/  
├── android/  
├── assets/  
│   ├── fonts  
├── build/  
├── ios/  
├── lib/  
│   ├── api/  
│   │    ├── api_endpoints.dart  
│   ├── models/  
│   ├── modules/  
│   │   ├── module_name  
│   │   │   ├── logic  
│   │   │   │   ├── binding  
│   │   │   │   │   ├── module_name_binding.dart  
│   │   │   │   ├── controller  
│   │   │   │   │   ├── module_name_controller.dart  
│   │   │   ├── view  
│   │   │   │   ├── widgets  
│   │   │   │   ├── module_name_screen.dart  
│   ├── routes/  
│   ├── values/  
│   ├── widgets/  
├── test/  
├── .gitignore  
├── .metadata  
├── pubspec.yaml  
├── README.md  

- assets : Assets store fonts, images etc. files require in project  
  
- models : Place your data models in this directory. These models represent the structure of your data and are used by your controllers and views.  
  
- modules : Application modules in this directory. Modules contain ui, business logic, widgets, etc.

- routes : You can organize your app's navigation logic here. Define your routes and use GetX's navigation methods.

- values : In this directory constant defined for string, colors, assets etc., also extension methods added.

- widgets : Common widgets are in this directory.



## Steps to run the app

- Requirements : Flutter SDK

- Step 1 : Download the project.

- Step 2 : Open in IDE.

- Step 3 : Open terminal and go to app directory.

- Step 4 : Run command 'flutter pub get'.

- Step 5 : Run command 'flutter run'.