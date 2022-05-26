

# Pokemon_test

A Pokedex app made with Flutter using the next packages:

* flutter_intl: used to manage different languages of the app (only english by now).
* cached_network_image: Flutter package to make easier the cached image data in the device.
* dio: Flutter package to handle different kind of request on an API.
* flutter_neumorphic: Flutter package for the use of different neumorphism ui elements.
* flutter_riverpod: High capable Flutter state management.
* flutter_screenutil: Flutter package to handle the resize of the components to fit different sizes of screens.
* go_router: Friendly Flutter package to use Navigator 2.0, it allows to implement declarative navigation and an easy way to implement deep linking navigation.
* hive_flutter: NoSQL database manager for Flutter, very fast and easy to use.

Some of the skills worked on this project:

* Clean architecture: All the project was made to be reusable and scalable, separated in data, domain and ui layers.
* Internationalization: App ready to include different languages.
* API Consumption: Use of a public API (https://pokeapi.co/) to make different request, and handle errors.
* UI/UX: Friendly app, with nice shapes and colors.



## Instructions to install the App

To use a pre compiled demo of the app, you could use this apk release file on an Android device: https://drive.google.com/file/d/1pH0vLNwFsYDfVpgnInEqBqlvxSI37Ydh/view?usp=sharing

To run the app, you have to take into account the next requisites and steps:

* You must have installed the latest Flutter version (3.0.1).
* Clone this repository.
* Create/use an Android/iOS emulator, or a physical device connected to the computer.
* If it is a physical device, you have to follow some extra steps:
	Android: https://www.geeksforgeeks.org/how-to-install-flutter-app-on-android/#:~:text=Using%20a%20USB%20cable%2C%20plug,recognizes%20your%20connected%20Android%20device.
	iOS: https://medium.com/front-end-weekly/how-to-test-your-flutter-ios-app-on-your-ios-device-75924bfd75a8
* Inside the folder of the repository, run "flutter clean", then "flutter pub get".
* Inside the folder of the repository, run "flutter run".

## Use of the App

* Splash Screen: Pokeball animation, load of the app's config, load the saved data in the device.
![alt text](https://drive.google.com/uc?export=view&id=18Iqsv8J84Y6z1OhCAGnUxjMl8AgSBcle)

* Home Screen: Button to go to Pokedex, button to go to Favorites, textfield to search any pokemon by name or id. 
*![alt text](https://drive.google.com/uc?export=view&id=1XfOCBFoeLsnjswl7uq48Prcq3M-2tH0n)

![alt text](https://drive.google.com/uc?export=view&id=1v-s0r1ASwjj8VEy449lueSYAE1i0ct9Z)

![alt text](https://drive.google.com/uc?export=view&id=17YpS9ap2CXq9ByV4AJW96BLJE2c0a-vm)
* Pokedex page: Load the first 151 Pokémon (limitations of the service, and the devices), saved the data to the local storage, the next time when the app be opened, the data will not be loaded from the service, but the local storage. Each Pokémon has a button with a heart in the corner, press that corner includes/removes that Pokémon of your favorites list. Press the button outside the heart, open the bottom sheet with additional information of that Pokémon.

![alt text](https://drive.google.com/uc?export=view&id=1IelmagOAo-qvItL3zS5Tk7Vjd67L_00C)

* Show Pokémon information: A scrollable component to visualize information like, height, weight, stats and abilities.
![alt text](https://drive.google.com/uc?export=view&id=1zX91khC1Z5LPngaVuGlHYkOeG6R9RWtx)
![alt text](https://drive.google.com/uc?export=view&id=1LG_FZb2FC7BQtG-ITFUwYlHM3CiuYC8u)

![alt text](https://drive.google.com/uc?export=view&id=1bxdJmzNEPvJQHO-VsOcL87afXBXzJSrc)

![alt text](https://drive.google.com/uc?export=view&id=1BJClHbmLJ9FAoiyfXz2Nv0ivacTtfjXi)

* Favorites Pages: Page with the list of all your favorites Pokémon. You can press the heart button to delete from your favorites.
![alt text](https://drive.google.com/uc?export=view&id=1rgRIPOLxZrklYXrwitEBKdWXg0uJGIB0)


